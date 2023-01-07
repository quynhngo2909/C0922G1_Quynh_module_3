package repository.impl;

import model.Facility;
import model.House;
import model.Room;
import model.Villa;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";
    private static String SELECT_ALL_FACILITY = "select * from facility";
    private static String INSERT_NEW_FACILITY = "insert into facility (name, area, cost, max_people, rent_type_id," +
            "facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free) " +
            "values(?,?,?,?,?,?,?,?,?,?,?)";

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
    public List<Facility> facilityList() {
        List<Facility> facilityList = new ArrayList<>();
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
                int rentTypeId = rs.getInt(6);
                int facilityTypeId = rs.getInt(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                switch (facilityTypeId) {
                    case 1: //Villa
                        facilityList.add(new Villa(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                                descriptionOtherConvenience, poolArea, numberOfFloors));
                        break;
                    case 2: //House
                        facilityList.add(new House(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                                descriptionOtherConvenience, numberOfFloors));
                        break;
                    case 3: //Room
                        facilityList.add(new Room(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, facilityFree));
                        break;
                    default:
                        break;
                }
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
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
        return false;
    }
}
