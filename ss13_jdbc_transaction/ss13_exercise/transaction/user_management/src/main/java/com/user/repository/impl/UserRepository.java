package com.user.repository.impl;

import com.user.repository.IUserRepository;
import com.user.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo_user_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym2022";

    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String SELECT_USERS_BY_ID = "select * from users where id = ?;";
    private static final String INSERT_USERS_SQL = "insert into users(name, email, country) values (?,?,?);";
    private static final String UPDATE_USERS_SQL = "update users set name = ?, email = ?, country = ? where id = ?;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";

    private static final String SELECT_USERS_BY_COUNTRY = "select * from users where country = ?";

    private static final String ORDER_BY_NAME_ASCENDING = "select * from users order by name asc;";
    private static final String INSERT_USER_SP = "call add_new_user(?,?,?)";

    public UserRepository() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public User selectUserById(int id) {
        User user = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public boolean insertUser(User user) {
        boolean rowInserted = true;
        System.out.println(INSERT_USERS_SQL);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            rowInserted = preparedStatement.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return rowInserted;
    }

    @Override
    public boolean updateUser(User user) {
        boolean rowUpdated = true;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return rowUpdated;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean rowDeleted = true;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return rowDeleted;
    }

    @Override
    public List<User> selectUserByCountry(String countryName) {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_COUNTRY);
            preparedStatement.setString(1, countryName);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                userList.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> sortByNameDescending() {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_NAME_ASCENDING);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                userList.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean addUserTransaction(User user) {
        boolean addStatus = false;
        Connection connection = null;
        try {
            connection = getConnection();
            CallableStatement cs = connection.prepareCall(INSERT_USER_SP);
            connection.setAutoCommit(false);
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getCountry());
            if (cs.executeUpdate() > 0) {
                connection.commit();
                addStatus = true;
            } else {
                connection.rollback();
            }
            connection.setAutoCommit(true);
            connection.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return addStatus;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getSQLState());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
