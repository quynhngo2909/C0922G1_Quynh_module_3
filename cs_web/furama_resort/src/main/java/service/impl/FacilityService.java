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
    public Facility findById(int id) {
        return null;
    }

    @Override
    public boolean createVilla(Villa villa) {
        return facilityRepository.createVilla(villa);
    }

    @Override
    public boolean createHouse(House house) {
        return facilityRepository.createHouse(house);
    }

    @Override
    public boolean createRoom(Room room) {
        return facilityRepository.createRoom(room);
    }

    @Override
    public boolean update(int id, Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }
}
