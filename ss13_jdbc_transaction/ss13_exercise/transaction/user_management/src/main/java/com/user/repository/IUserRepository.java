package com.user.repository;

import com.user.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUsers();
    User selectUserById(int id);
    boolean insertUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(int id);

    List<User> selectUserByCountry(String country);
    List<User> sortByNameDescending();

   boolean addUserTransaction(User user);
}
