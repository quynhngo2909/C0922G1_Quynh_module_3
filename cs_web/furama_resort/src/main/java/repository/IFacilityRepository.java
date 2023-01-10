package repository;

import model.*;

import java.util.List;

public interface IFacilityRepository {
    List<FacilityVirtual> facilityList();
    List<FacilityVirtual> searchByNameRentTypeCost(String strName, String strType, String strCost);
    boolean create(FacilityVirtual facility);
    Facility findById(int id);
    boolean createVilla(Villa villa);
    boolean createHouse(House house);
    boolean createRoom(Room room);
    boolean update(int id, Facility facility);
    boolean delete(int id);
}
