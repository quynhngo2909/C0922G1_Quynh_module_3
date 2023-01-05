package com.user.service.impl;

import com.user.model.User;
import com.user.repository.IUserRepository;
import com.user.repository.impl.UserRepository;
import com.user.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public User selectUserById(int id) {
        return userRepository.selectUserById(id);
    }

    @Override
    public boolean insertUser(User user) {
        return userRepository.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return userRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> sortByNameDescending() {
        return userRepository.sortByNameDescending();
    }
}
