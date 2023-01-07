package repository.impl;

import repository.IFacilityTypeRepository;
import repository.IRentTypeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {

    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";

    private static String SELECT_RENT_TYPE_ID = "select id from rent_type";

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
    public List<Integer> rentTypeID() {
        Connection connection = getConnection();
        List<Integer> rentTypeId = new ArrayList<>();
        PreparedStatement pt = null;
        try {
            pt = connection.prepareStatement(SELECT_RENT_TYPE_ID);
            ResultSet rs = pt.executeQuery();
            while(rs.next()) {
                rentTypeId.add(rs.getInt(1));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rentTypeId;
    }
}
