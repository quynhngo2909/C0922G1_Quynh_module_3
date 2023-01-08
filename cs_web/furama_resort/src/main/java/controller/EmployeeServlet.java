package controller;

import model.Employee;
import service.IEmployeeService;
import service.IIdListService;
import service.impl.EmployeeService;
import service.impl.IdDivisionService;
import service.impl.IdEducationService;
import service.impl.IdPositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    private IIdListService divisionService = new IdDivisionService();
    private IIdListService educationService = new IdEducationService();
    private IIdListService positionService = new IdPositionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                getEmployeeList(request, response);
                break;
            default:
                getEmployeeList(request, response);
                break;
        }
    }

    private void getEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.employeeList();
        if(employeeList.size() == 0) {
            request.setAttribute("message", "The employee list is empty");
        } else {
            request.setAttribute("employeeList", employeeList);
        }
        try {
            request.getRequestDispatcher("/view/employee/listEmployee.jsp").forward(request,response);
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
            case "create":
                break;
            case "update":
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                getEmployeeList(request, response);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        boolean deleteStatus = false;
        int id = Integer.parseInt(request.getParameter("deleteId"));
        deleteStatus = employeeService.delete(id);
        if(!deleteStatus) {
            request.setAttribute("message", "Can not delete the employee!");
        } else {
            request.setAttribute("message", "The employee was deleted!");
        }

        try {
            request.getRequestDispatcher("/view/employee/listEmployee.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
