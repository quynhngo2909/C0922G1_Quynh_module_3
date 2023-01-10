package repository.impl;

import repository.IIdListRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IdCustomerTypeRepository implements IIdListRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";

    private static String SELECT_ALL_CUSTOMER_TYPE = "select * from customer_type";

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
    public List<Integer> idList() {
        List<Integer> customerTypeId = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                customerTypeId.add(rs.getInt(1));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerTypeId;
    }

    @Override
    public List<String> typeNameList() {
        List<String> customerType = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                customerType.add(rs.getString(2));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerType;
    }

    @Override
    public Map<String, Integer> typeIdMap() {
        Map<String, Integer> customerTypeId = new HashMap<>();
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                customerTypeId.put(rs.getString(2), rs.getInt(1));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerTypeId;
    }
}