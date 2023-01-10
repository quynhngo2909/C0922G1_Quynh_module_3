package repository.impl;

import model.*;
import repository.IFacilityRepository;
import repository.IIdListRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    private static String FIND_FACILITY_BY_ID ="select f.id, f.name, f.area, f.cost, f.max_people," +
            " rt.name, ft.name, f.standard_room, f.description_other_convenience, f.pool_area, f.number_of_floors, " +
            "f.facility_free from facility f left join facility_type ft on f.facility_type_id = ft.id " +
            "left join rent_type rt on f.rent_type_id = rt.id where f.id = ?";

    private static String DELETE_BY_ID = "delete from facility where id=?";
    private static String UPDATE_FACILITY = "update facility f set f.name = ?, f.area = ?, f.cost = ?, f.max_people = ?, " +
            "f.rent_type_id = ?, f.facility_type_id= ?, f.standard_room= ?, f.description_other_convenience = ?," +
            " f.pool_area = ?, f.number_of_floors = ?, f.facility_free= ? where f.id = ?";
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
            pt.setString(1, "%" + strName + "%");
            pt.setString(2,"%" + strType + "%");
            pt.setString(3,"%" + strCost + "%");
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
    public FacilityVirtual findById(int id) {
        FacilityVirtual facility = null;
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(FIND_FACILITY_BY_ID);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int facilityId = rs.getInt(1);
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
                facility = new FacilityVirtual(id, name, area, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, numberOfFloors, poolArea, facilityFree,rentType, facilityType);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facility;
    }
    @Override
    public boolean update(int id, FacilityVirtual facility) {
        boolean updateStatus = false;
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(UPDATE_FACILITY);
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
            pt.setInt(12, id);
            updateStatus = pt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return updateStatus;
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
