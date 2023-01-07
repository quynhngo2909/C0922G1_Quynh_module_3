package model;

public class Room extends  Facility{
    private String facilityFree;

    public Room() {
    }

    public Room(int id, String name, int area, double cost, int maxPeople, int rentTypeId, int facilityTypeId, String facilityFree) {
        super(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId);
        this.facilityFree = facilityFree;
    }

    public Room(String name, int area, double cost, int maxPeople, int rentTypeId, int facilityTypeId, String facilityFree) {
        super(name, area, cost, maxPeople, rentTypeId, facilityTypeId);
        this.facilityFree = facilityFree;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}

