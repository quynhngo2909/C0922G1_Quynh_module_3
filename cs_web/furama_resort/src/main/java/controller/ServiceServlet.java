package controller;

import model.*;
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
    private IIdListService idFacilityTypeService = new IdFacilityTypeService();
    private IIdListService idRentTypeService = new IdRentTypeService();

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
                getRentTypeFacilityType(request, response);
                break;
            case "update":
                getUpdateForm(request, response);
                break;
            default:
                getFacilityList(request, response);
                break;
        }
    }

    private void getUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        FacilityVirtual facility = facilityService.findById(id);
        List<String> rentTypeList = idRentTypeService.typeNameList();
        List<String> facilityTypeList = idFacilityTypeService.typeNameList();
        request.setAttribute("facility", facility);
        if(facility == null) {
            request.setAttribute("message", "The facility is not exist!");
        }
        try {
            request.setAttribute("rentTypeList", rentTypeList);
            request.setAttribute("facilityTypeList", facilityTypeList);
            request.getRequestDispatcher("/view/service/update.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void getRentTypeFacilityType(HttpServletRequest request, HttpServletResponse response) {
        List<String> rentTypeList = idRentTypeService.typeNameList();
        List<String> facilityTypeList = idFacilityTypeService.typeNameList();
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        try {
            request.getRequestDispatcher("/view/service/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Integer> facilityTypeIdList = idFacilityTypeService.idList();
        List<Integer> rentTypeIdList = idRentTypeService.idList();
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
                dispatcher = "/view/service/list.jsp";
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
        List<FacilityVirtual> facilityList = facilityService.facilityList();
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
                updateFacility(request, response);
                break;
            case "search":
                searchByNameRentTypeCost(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            default:
                getFacilityList(request, response);
                break;
        }
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        boolean updateStatus = false;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        Double cost = Double.valueOf(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String rentType = request.getParameter("rentType");
        String facilityType = request.getParameter("facilityType");
        String facilityFree = request.getParameter("facilityFree");
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Double poolArea = Double.valueOf(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        updateStatus = facilityService.update(id, new FacilityVirtual(name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, numberOfFloors, poolArea, facilityFree, rentType, facilityType));
        if (!updateStatus) {
            request.setAttribute("message", "Can not update the facility!");
        } else{
            request.setAttribute("message", "The facility was updated!");
        }
        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        boolean deleteStatus = false;
        int id = Integer.parseInt(request.getParameter("deleteId"));
        deleteStatus = facilityService.delete(id);
        if (!deleteStatus) {
            request.setAttribute("message", "Error! Can not delete this facility!");
        } else {
            request.setAttribute("message", "The facility was deleted!");
        }
        try {
            request.getRequestDispatcher("/view/service/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        boolean createStatus = false;
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        Double cost = Double.valueOf(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String rentType = request.getParameter("rentType");
        String facilityType = request.getParameter("selectFacilityType");
        String facilityFree = request.getParameter("facilityFree");
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Double poolArea = Double.valueOf(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        createStatus = facilityService.create(new FacilityVirtual(name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, numberOfFloors, poolArea, facilityFree, rentType, facilityType));
        if (!createStatus) {
                request.setAttribute("message", "Can not create new facility!");
        } else{
            request.setAttribute("message", "New facility was created!");
        }
        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchByNameRentTypeCost(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String rentType = request.getParameter("rentType");
        String cost = request.getParameter("cost");
        List<FacilityVirtual> facilityList = facilityService.searchByNameRentTypeCost(name, rentType, cost);
        if (facilityList.size() == 0) {
            request.setAttribute("message", "There is no matched facility!");
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
}