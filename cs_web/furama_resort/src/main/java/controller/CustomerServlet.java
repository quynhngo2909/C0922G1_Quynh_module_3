package controller;

import model.Customer;
import service.IIdListService;
import service.impl.CustomerService;
import service.ICustomerService;
import service.impl.IdCustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private IIdListService customerTypeIdService = new IdCustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                getCustomerList(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "search":
                break;
            default:
                getCustomerList(request, response);
                break;
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("/view/customer/update.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Integer> customerTypeIdList = customerTypeIdService.idList();
        request.setAttribute("customerTypeIdList", customerTypeIdList);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = new ArrayList<>();
        customerList = customerService.customers();
        if (customerList.size() == 0) {
            request.setAttribute("message", "Customer list is empty");
        }
        try {
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "update":
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                getCustomerList(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        boolean deleteStatus = false;
        int id = Integer.parseInt(request.getParameter("deleteId"));
        deleteStatus = customerService.delete(id);
        if(!deleteStatus) {
            request.setAttribute("message","Error! Can not delete this customer!");
        } else {
            request.setAttribute("message","Customer was deleted!");
        }
        try {
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        boolean createStatus = false;
        int customerTypeID = Integer.parseInt(request.getParameter("customerTypeID"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        createStatus = customerService.create(new Customer(name, birthday, idCard, phoneNumber, email, address, customerTypeID, gender));
        if(!createStatus) {
            request.setAttribute("message","Error! New customer can not be created!");
        } else {
            request.setAttribute("message","New customer was created successfully!");
        }
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}