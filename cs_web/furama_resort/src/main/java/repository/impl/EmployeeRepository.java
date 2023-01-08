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

    private static String SELECT_ALL_EMPLOYEE = "";
    private static String INSERT_NEW_EMPLOYEE = "";
    private static String UPDATE_EMPLOYEE = "";
    private static String DELETE_EMPLOYEE = "";
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
        return null;
    }

    @Override
    public boolean create(Employee employee) {
        return false;
    }

    @Override
    public boolean update(int id, Employee employee) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Employee find(String string) {
        return null;
    }
}
