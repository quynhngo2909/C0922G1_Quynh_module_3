package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeServlet", value = "/HomeServlet")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }

        switch (action) {
            case "employee":
                getEmployeePage(request, response);
                break;
            case "customer":
                getCustomerPage(request, response);
                break;
            case "service":
                break;
            case "contact":
                break;
            default:
                getHomePage(request, response);
                break;
        }
    }

    private void getCustomerPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("CustomerServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getEmployeePage(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/EmployeeServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getHomePage(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }

        switch (action) {
            case "search":
                break;
            default:
                getHomePage(request, response);
                break;
        }
    }
}
