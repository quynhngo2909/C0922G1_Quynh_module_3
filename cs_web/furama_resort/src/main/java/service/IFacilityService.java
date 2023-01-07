package service;

import model.Facility;
import model.House;
import model.Room;
import model.Villa;

import java.util.List;

public interface IFacilityService {
    List<Facility> facilityList();
    Facility findById(int id);
    boolean createVilla(Villa villa);
    boolean createHouse(House house);
    boolean createRoom(Room room);
    boolean update(int id, Facility facility);
    boolean delete(int id);
}

