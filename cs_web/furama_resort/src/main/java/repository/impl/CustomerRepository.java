package repository.impl;

import model.Customer;
import model.CustomerTypeId;
import model.CustomerVirtual;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym2022";

    private IdCustomerTypeRepository customerTypeRepository = new IdCustomerTypeRepository();
    private static String SELECT_ALL_CUSTOMERS = "select c.id, ct.name, c.name, c.birthday, c.gender, c.id_card, c.phone_number, c.email, c.address from customer c join customer_type ct where c.customer_type = ct.id";
    private static String INSERT_NEW_CUSTOMER = "insert into customer(customer_type, name, birthday, gender, id_card, phone_number, email, address) values(?,?,?,?,?,?,?,?)";
    private static String UPDATE_CUSTOMER = "update customer set customer_type=?,  name=?, birthday=?, gender=?, id_card=?, phone_number=?, email=?, address=?  where id =?";
    private static String SELECT_CUSTOMER_BY_ID = "select c.id, ct.name, c.name, c.birthday, c.gender, c.id_card, c.phone_number, c.email, c.address from customer c join customer_type ct where c.customer_type = ct.id and c.id = ?;";
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
    public List<CustomerVirtual> customers() {
        List<CustomerVirtual> customers = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String customerType = rs.getString(2);
                String customerName = rs.getString(3);
                String birthday = rs.getString(4);
                Boolean gender = rs.getBoolean(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                customers.add(new CustomerVirtual(id, customerName, birthday, idCard, phone, email, address, new CustomerTypeId(customerType), gender));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return customers;
    }

    @Override
    public CustomerVirtual findById(int findId) {
        CustomerVirtual customer = null;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            pt.setInt(1, findId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String customerType = rs.getString(2);
                String customerName = rs.getString(3);
                String birthday = rs.getString(4);
                Boolean gender = rs.getBoolean(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                customer = new CustomerVirtual(id, customerName, birthday, idCard, phone, email, address,
                        new CustomerTypeId(customerType), gender);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customer;
    }

    @Override
    public boolean create(CustomerVirtual customer) {
        boolean createStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(INSERT_NEW_CUSTOMER);
            pt.setInt(1, customerTypeRepository.typeId().get(customer.getCustomerTypeId().getName()));
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
    public boolean update(int id, CustomerVirtual customer) {
        boolean updateStatus = false;
        Connection connection = getConnection();
        PreparedStatement pt;
        try {
            pt = connection.prepareStatement(UPDATE_CUSTOMER);
            pt.setInt(1, customerTypeRepository.typeId().get(customer.getCustomerTypeId().getName()));
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
