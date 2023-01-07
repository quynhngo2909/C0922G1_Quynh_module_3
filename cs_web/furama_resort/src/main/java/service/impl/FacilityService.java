package service.impl;

import model.Facility;
import model.House;
import model.Room;
import model.Villa;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> facilityList() {
        return facilityRepository.facilityList();
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
        return false;
    }
}
