package service.impl;

import model.*;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<FacilityVirtual> facilityList() {
        return facilityRepository.facilityList();
    }

    @Override
    public List<FacilityVirtual> searchByNameRentTypeCost(String strName, String strType, String strCost) {
        return facilityRepository.searchByNameRentTypeCost(strName, strType, strCost);
    }

    @Override
    public boolean create(FacilityVirtual facility) {
        return facilityRepository.create(facility);
    }

    @Override
    public FacilityVirtual findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public boolean update(int id, FacilityVirtual facility) {
        return facilityRepository.update(id, facility);
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }
}
