package com.user.controller;

import com.user.model.User;
import com.user.service.IUserService;
import com.user.service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;


@WebServlet(name = "userServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                showUserList(req, resp);
                break;
            case "create":
                showCreateForm(req, resp);
                break;
            case "update":
                showUpdateForm(req, resp);
                break;
            case "delete":
                showDeleteForm(req, resp);
                break;
            case "sort":
                sortUserByNameDesc(req, resp);
                break;
            default:
                showUserList(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            case "search":
                searchByCountry(req, resp);
                break;
            default:
                showUserList(req, resp);
                break;

        }
    }

    private void showUserList(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.getUserList();
        RequestDispatcher requestDispatcher;
        if (userList.size() == 0) {
            req.setAttribute("message", "The user list is empty");
        } else {
            req.setAttribute("userList", userList);
        }
        requestDispatcher = req.getRequestDispatcher("user/list.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        boolean updateStatus = userService.updateUserSp(new User(id, name, email, country));
        RequestDispatcher requestDispatcher;
        if (!updateStatus) {
            req.setAttribute("message", "Error! Can not update user information!");
        } else {
            req.setAttribute("message", "User information was updated!");
        }
        requestDispatcher = req.getRequestDispatcher("user/update.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showUpdateForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUserById(id);
        RequestDispatcher requestDispatcher;
        if (user == null) {
            req.setAttribute("message", "The user is not exist");
        } else {
            req.setAttribute("user", user);
        }
        requestDispatcher = req.getRequestDispatcher("/user/update.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/create.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        RequestDispatcher requestDispatcher;
        boolean createStatus = userService.insertUser(new User(name, email, country));
        if (!createStatus) {
            req.setAttribute("message", "Error! Can not create new user");
        } else {
            req.setAttribute("message", "New user was created!");
        }
        requestDispatcher = req.getRequestDispatcher("user/update.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUserById(id);
        RequestDispatcher requestDispatcher;
        if (user == null) {
            req.setAttribute("message", "The user is not exist");
        } else {
            req.setAttribute("user", user);
        }
        requestDispatcher = req.getRequestDispatcher("user/delete.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean deleteStatus = userService.deleteUserSp(id);
        RequestDispatcher requestDispatcher;
        if (!deleteStatus) {
            req.setAttribute("message", "Error! Can not delete user!");
        } else {
            req.setAttribute("message", "User was delete!");
        }
        requestDispatcher = req.getRequestDispatcher("user/delete.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void sortUserByNameDesc(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.sortByNameDescending();
        RequestDispatcher requestDispatcher;
        if (userList.size() == 0) {
            req.setAttribute("message", "User list is empty!");
        } else {
            req.setAttribute("userList", userList);
        }
        requestDispatcher = req.getRequestDispatcher("/user/sort.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void searchByCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        List<User> userList = userService.selectUserByCountry(country);
        RequestDispatcher requestDispatcher;
        if (userList.size() == 0) {
            req.setAttribute("message", "There is no user in " + country);
        } else {
            req.setAttribute("userList", userList);
        }
        requestDispatcher = req.getRequestDispatcher("/user/search.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}