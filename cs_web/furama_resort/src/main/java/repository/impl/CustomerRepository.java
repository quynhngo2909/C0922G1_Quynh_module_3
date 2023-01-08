package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";


    private static String SELECT_ALL_CUSTOMERS = "select * from customer";
    private static String INSERT_NEW_CUSTOMER = "insert into customer(customer_type, name, birthday, gender, id_card, phone_number, email, address) values(?,?,?,?,?,?,?,?)";
    private static String UPDATE_CUSTOMER = "update customer set customer_type=?,  name=?, birthday=?, gender=?, id_card=?, phone_number=?, email=?, address=?  where id =?";
    private static String SELECT_CUSTOMER_BY_ID = "select * from customer where id=?";
    private static String DELETE_CUSTOMER_BY_ID = "delete from customer where id=?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return connection;
    }

    @Override
    public List<Customer> customers() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int customerTypeId = rs.getInt(2);
                String customerName = rs.getString(3);
                String birthday = rs.getString(4);
                Boolean gender = rs.getBoolean(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                customers.add(new Customer(id, customerName, birthday, idCard, phone, email, address, customerTypeId, gender));
            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return customers;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt(1);
                int customerTypeId = rs.getInt(2);
                String customerName = rs.getString(3);
                String birthday = rs.getString(4);
                Boolean gender = rs.getBoolean(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                customer = new Customer(id, customerName, birthday, idCard, phone, email, address, customerTypeId, gender);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customer;
    }

    @Override
    public boolean create(Customer customer) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_CUSTOMER);
            pt.setInt(1, customer.getCustomerTypeId());
            pt.setString(2, customer.getName());
            pt.setString(3, customer.getBirthday());
            pt.setBoolean(4, customer.isGender());
            pt.setString(5, customer.getIdCard());
            pt.setString(6, customer.getPhoneNumber());
            pt.setString(7, customer.getEmail());
            pt.setString(8, customer.getAddress());
            createStatus = pt.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }

    @Override
    public boolean update(int id, Customer customer) {
        boolean updateStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(UPDATE_CUSTOMER);
            pt.setInt(1, customer.getCustomerTypeId());
            pt.setString(2, customer.getName());
            pt.setString(3, customer.getBirthday());
            pt.setBoolean(4, customer.isGender());
            pt.setString(5, customer.getIdCard());
            pt.setString(6, customer.getPhoneNumber());
            pt.setString(7, customer.getEmail());
            pt.setString(8, customer.getAddress());
            pt.setInt(8, id);
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
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            pt.setInt(1, id);
            deleteStatus = pt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return deleteStatus;
    }
}
