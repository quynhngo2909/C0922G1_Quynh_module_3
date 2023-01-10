package service;

import model.*;
import repository.impl.FacilityRepository;

import java.util.List;

public interface IFacilityService {
    List<FacilityVirtual> facilityList();
    List<FacilityVirtual> searchByNameRentTypeCost(String strName, String strType, String strCost);
    boolean create(FacilityVirtual facility);

    FacilityVirtual findById(int id);

    boolean update(int id, FacilityVirtual facility);
    boolean delete(int id);

}
