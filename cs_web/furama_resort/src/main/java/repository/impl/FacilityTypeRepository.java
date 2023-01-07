package repository.impl;

import repository.IFacilityTypeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {

    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";

    private static String SELECT_FACILITY_TYPE_ID = "select id from facility_type";

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
    public List<Integer> facilityTypeID() {
        Connection connection = getConnection();
        List<Integer> facilityTypeID = new ArrayList<>();
        PreparedStatement pt = null;
        try {
            pt = connection.prepareStatement(SELECT_FACILITY_TYPE_ID);
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
}
