package repository.impl;

import model.Employee;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_database?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym2022";

    private static String SELECT_ALL_EMPLOYEE = "select * from employee;";
    private static String INSERT_NEW_EMPLOYEE = "insert into employee (name, birthday, id_card, salary, phone_number," +
            " email, address, position_id, education_degree_id, division_id, username) values(?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
    private static String UPDATE_EMPLOYEE = "update employee set name = ?, birthday = ?, id_card = ?, salary = ?, " +
            "phone_number = ?, email = ?, address = ?, position_id = ?, education_degree_id = ?, division_id = ?, username = ? where id = ?";
    private static String DELETE_EMPLOYEE = "delete from employee where id = ?";
    private static String FIND_EMPLOYEE = "";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public List<Employee> employeeList() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String birthday = rs.getString(3);
                String idCard = rs.getString(4);
                double salary = rs.getDouble(5);
                String phoneNumber = rs.getString(6);
                String email = rs.getString(7);
                String address = rs.getString(8);
                int positionId = rs.getInt(9);
                int educationDegreeId = rs.getInt(10);
                int divisionId = rs.getInt(11);
                String username = rs.getString(12);
                employeeList.add(new Employee(id, name, birthday, idCard, phoneNumber, email, address, salary, positionId,
                        educationDegreeId, divisionId, username));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }

    @Override
    public boolean create(Employee employee) {
        boolean createStatus = false;
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(INSERT_NEW_EMPLOYEE);
            pt.setString(1, employee.getName());
            pt.setString(2, employee.getBirthday());
            pt.setString(3, employee.getIdCard());
            pt.setDouble(4, employee.getSalary());
            pt.setString(5, employee.getPhoneNumber());
            pt.setString(6, employee.getEmail());
            pt.setString(7, employee.getAddress());
            pt.setInt(8, employee.getPositionId());
            pt.setInt(9, employee.getEducationDegree());
            pt.setInt(10, employee.getDivisionId());
            pt.setString(11, employee.getUsername());
            createStatus = pt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return createStatus;
    }

    @Override
    public boolean update(int id, Employee employee) {
        boolean updateStatus = false;
        Connection connection = getConnection();
        try {
            PreparedStatement pt = connection.prepareStatement(UPDATE_EMPLOYEE);
            pt.setString(1, employee.getName());
            pt.setString(2, employee.getBirthday());
            pt.setString(3, employee.getIdCard());
            pt.setDouble(4, employee.getSalary());
            pt.setString(5, employee.getPhoneNumber());
            pt.setString(6, employee.getEmail());
            pt.setString(7, employee.getAddress());
            pt.setInt(8, employee.getPositionId());
            pt.setInt(9, employee.getEducationDegree());
            pt.setInt(10, employee.getDivisionId());
            pt.setString(11, employee.getUsername());
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
            PreparedStatement pt = connection.prepareStatement(DELETE_EMPLOYEE);
            pt.setInt(1, id);
            deleteStatus = pt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return deleteStatus;
    }

    @Override
    public Employee find(String string) {
        return null;
    }
}
