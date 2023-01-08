package controller;

import model.Facility;
import model.House;
import model.Room;
import model.Villa;
import service.IFacilityService;
import service.IIdListService;
import service.impl.FacilityService;
import service.impl.IdFacilityTypeService;
import service.impl.IdRentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/ServiceServlet")
public class ServiceServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IIdListService facilityTypeIdService = new IdFacilityTypeService();
    private IIdListService rentTypeIdService = new IdRentTypeService();

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
        List<Integer> facilityTypeIdList = facilityTypeIdService.idList();
        List<Integer> rentTypeIdList = rentTypeIdService.idList();
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
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        Double cost = Double.valueOf(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeID"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom;
        String descriptionOtherConvenience;
        Double poolArea;
        int numberOfFloors;
        String facilityFree;
        String dispatcher;
        switch (facilityId) {
            case 1:
                standardRoom = request.getParameter("standardRoom");
                descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
                poolArea = Double.valueOf(request.getParameter("poolArea"));
                numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
                Villa villa = new Villa(name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                        descriptionOtherConvenience, poolArea, numberOfFloors);
                if (!facilityService.createVilla(villa)) {
                    request.setAttribute("message", "Can not create new villa!");
                } else {
                    request.setAttribute("message", "New villa was created!");
                }
                dispatcher = "/view/service/createVilla.jsp";
                break;
            case 2:
                standardRoom = request.getParameter("standardRoom");
                descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
                numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
                House house = new House(name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                        descriptionOtherConvenience, numberOfFloors);
                if (!facilityService.createHouse(house)) {
                    request.setAttribute("message", "Can not create new house!");
                } else {
                    request.setAttribute("message", "New house was created!");
                }
                dispatcher = "/view/service/createHouse.jsp";
                break;
            case 3:
                facilityFree = request.getParameter("facilityFree");
                Room room = new Room(name, area, cost, maxPeople, rentTypeId, facilityTypeId, facilityFree);
                if (!facilityService.createRoom(room)) {
                    request.setAttribute("message", "Can not create new room!");
                } else {
                    request.setAttribute("message", "New room was created!");
                }
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
