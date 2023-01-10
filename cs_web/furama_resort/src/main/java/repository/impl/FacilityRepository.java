package repository.impl;

import model.*;
import repository.IFacilityRepository;
import repository.IIdListRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.function.BinaryOperator;

public class FacilityRepository implements IFacilityRepository {
    private IIdListRepository idFacilityType = new IdFacilityTypeRepository();
    private IIdListRepository idRentType = new IdRentTypeRepository();
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";
    private static String SELECT_ALL_FACILITY = "select f.id, f.name, f.area, f.cost, f.max_people, rt.name, ft.name," +
            " f.standard_room, f.description_other_convenience, f.pool_area, f.number_of_floors, f.facility_free " +
            "from facility f left join facility_type ft on f.facility_type_id = ft.id" +
            " left join rent_type rt on f.rent_type_id = rt.id";
    private static String INSERT_NEW_FACILITY = "insert into facility (name, area, cost, max_people, rent_type_id," +
            "facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free) " +
            "values(?,?,?,?,?,?,?,?,?,?,?)";

    private static String SEARCH_FACILITY_BY_NAME_RENT_TYPE_COST ="select f.id, f.name, f.area, f.cost, f.max_people," +
            " rt.name, ft.name, f.standard_room, f.description_other_convenience, f.pool_area, f.number_of_floors, " +
            "f.facility_free from facility f left join facility_type ft on f.facility_type_id = ft.id " +
            "left join rent_type rt on f.rent_type_id = rt.id where f.name like ? and rt.name like ? and f.cost like ?";

    private static String DELETE_BY_ID = "delete from facility where id=?";
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return connection;
    }

    @Override
    public List<FacilityVirtual> facilityList() {
        List<FacilityVirtual> facilityList = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                String rentType = rs.getString(6);
                String facilityType = rs.getString(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                facilityList.add(new FacilityVirtual(id, name, area, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, numberOfFloors, poolArea, facilityFree,rentType, facilityType));
                }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }

    @Override
    public List<FacilityVirtual> searchByNameRentTypeCost(String strName, String strType, String strCost) {
        List<FacilityVirtual> facilityList = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(SEARCH_FACILITY_BY_NAME_RENT_TYPE_COST);
            pt.setString(1, strName);
            pt.setString(2, strType);
            pt.setString(3, strCost);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                String rentType = rs.getString(6);
                String facilityType = rs.getString(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                facilityList.add(new FacilityVirtual(id, name, area, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, numberOfFloors, poolArea, facilityFree,rentType, facilityType));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }

    @Override
    public boolean create(FacilityVirtual facility) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_FACILITY);
            pt.setString(1, facility.getName());
            pt.setInt(2, facility.getArea());
            pt.setDouble(3, facility.getCost());
            pt.setInt(4, facility.getMaxPeople());
            pt.setInt(5, idRentType.typeIdMap().get(facility.getRentType()));
            pt.setInt(6, idFacilityType.typeIdMap().get(facility.getFacilityType()));
            pt.setString(7, facility.getStandardRoom());
            pt.setString(8, facility.getDescriptionOtherConvenience());
            pt.setDouble(9, facility.getPoolArea());
            pt.setInt(10, facility.getNumberOfFloors());
            pt.setString(11, facility.getFacilityType());
            createStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }

    @Override
    public Facility findById(int id) {
        return null;
    }

    @Override
    public boolean createVilla(Villa villa) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_FACILITY);
            pt.setString(1, villa.getName());
            pt.setInt(2, villa.getArea());
            pt.setDouble(3, villa.getCost());
            pt.setInt(4, villa.getMaxPeople());
            pt.setInt(5, villa.getRentTypeId());
            pt.setInt(6, villa.getFacilityTypeId());
            pt.setString(7, villa.getStandardRoom());
            pt.setString(8, villa.getDescriptionOtherConvenience());
            pt.setDouble(9, villa.getPoolArea());
            pt.setInt(10, villa.getNumberOfFloors());
            pt.setString(11, "-");
            createStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }

    @Override
    public boolean createHouse(House house) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_FACILITY);
            pt.setString(1, house.getName());
            pt.setInt(2, house.getArea());
            pt.setDouble(3, house.getCost());
            pt.setInt(4, house.getMaxPeople());
            pt.setInt(5, house.getRentTypeId());
            pt.setInt(6, house.getFacilityTypeId());
            pt.setString(7, house.getStandardRoom());
            pt.setString(8, house.getDescriptionOtherConvenience());
            pt.setDouble(9, 0);
            pt.setInt(10, house.getNumberOfFloors());
            pt.setString(11, "-");
            createStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }

    @Override
    public boolean createRoom(Room room) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_FACILITY);
            pt.setString(1, room.getName());
            pt.setInt(2, room.getArea());
            pt.setDouble(3, room.getCost());
            pt.setInt(4, room.getMaxPeople());
            pt.setInt(5, room.getRentTypeId());
            pt.setInt(6, room.getFacilityTypeId());
            pt.setString(7, "-");
            pt.setString(8,"-");
            pt.setDouble(9, 0);
            pt.setInt(10, 0);
            pt.setString(11, room.getFacilityFree());
            createStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }


    @Override
    public boolean update(int id, Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        boolean deleteStatus = false;
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(DELETE_BY_ID);
            pt.setInt(1, id);
            deleteStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return deleteStatus;
    }
}
