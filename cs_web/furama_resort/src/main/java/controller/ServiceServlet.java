package controller;

import model.Facility;
import model.Villa;
import service.IFacilityService;
import service.IFacilityTypeIdService;
import service.IRentTypeIdService;
import service.impl.FacilityService;
import service.impl.FacilityTypeIdService;
import service.impl.RentTypeIdService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/ServiceServlet")
public class ServiceServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IFacilityTypeIdService facilityTypeIdService = new FacilityTypeIdService();
    private IRentTypeIdService rentTypeIdService = new RentTypeIdService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                getFacilityList(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                break;
            case "search":
                break;
            default:
                getFacilityList(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Integer> facilityTypeIdList = facilityTypeIdService.facilityTypeID();
        List<Integer> rentTypeIdList = rentTypeIdService.rentTypeID();
        int facilityId = Integer.parseInt(request.getParameter("id"));
        String dispatcher = "";
        switch (facilityId) {
            case 1:
                dispatcher = "/view/service/createVilla.jsp";
                break;
            case 2:
                dispatcher = "/view/service/createHouse.jsp";
                break;
            case 3:
                dispatcher = "/view/service/createRoom.jsp";
                break;
            default:
                dispatcher= "/view/service/list.jsp";
                break;
        }
        request.setAttribute("facilityTypeIdList", facilityTypeIdList);
        request.setAttribute("rentTypeIdList", rentTypeIdList);
        try {
            request.getRequestDispatcher(dispatcher).forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getFacilityList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.facilityList();
        if (facilityList.size() == 0) {
            request.setAttribute("message", "The facility list is empty!");
        }
        try {
            request.setAttribute("facilityList", facilityList);
            request.getRequestDispatcher("/view/service/list.jsp").forward(request, response);
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
                createFacility(request, response);
                break;
            case "update":
                break;
            default:
                getFacilityList(request, response);
                break;
        }
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        int facilityId = Integer.parseInt(request.getParameter("id"));

        String dispatcher = "";
        switch (facilityId) {
            case 1:
                dispatcher = "/view/service/createVilla.jsp";
                Facility villa = new Villa();
                break;
            case 2:
                dispatcher = "/view/service/createHouse.jsp";
                break;
            case 3:
                dispatcher = "/view/service/createRoom.jsp";
                break;
            default:
                dispatcher= "/view/service/list.jsp";
                break;
        }

        try {
            request.getRequestDispatcher(dispatcher).forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
