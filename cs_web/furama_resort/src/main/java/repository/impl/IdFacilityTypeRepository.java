package repository.impl;

import repository.IIdListRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IdFacilityTypeRepository implements IIdListRepository {

    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";

    private static String SELECT_FACILITY_TYPE = "select * from facility_type";

    private Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  connection;
    }
    @Override
    public List<Integer> idList() {
        Connection connection = getConnection();
        List<Integer> facilityTypeID = new ArrayList<>();
        PreparedStatement pt = null;
        try {
            pt = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet rs = pt.executeQuery();
            while(rs.next()) {
                facilityTypeID.add(rs.getInt(1));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityTypeID;
    }

    @Override
    public List<String> typeNameList() {
        Connection connection = getConnection();
        List<String> facilityType = new ArrayList<>();
        PreparedStatement pt = null;
        try {
            pt = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet rs = pt.executeQuery();
            while(rs.next()) {
                facilityType.add(rs.getString(2));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityType;
    }

    @Override
    public Map<String, Integer> typeIdMap() {
        Map<String, Integer> facilityTypeId = new HashMap<>();
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                facilityTypeId.put(rs.getString(2), rs.getInt(1));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityTypeId;
    }
}
