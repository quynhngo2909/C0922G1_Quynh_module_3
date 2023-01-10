package model;

public class FacilityVirtual extends Facility{
    //Villa, House attribute
    private String standardRoom;
    //Villa, House attribute
    private String descriptionOtherConvenience;
    //Villa, House attribute
    private int numberOfFloors;
    //Villa attribute
    private double poolArea;
    //Room attribute
    private String facilityFree;

    private String rentType;
    private String facilityType;

    public FacilityVirtual() {
    }

    public FacilityVirtual(int id, String name, int area, double cost, int maxPeople, String standardRoom,
                           String descriptionOtherConvenience, int numberOfFloors, double poolArea, String facilityFree,
                           String rentType, String facilityType) {
        super(id, name, area, cost, maxPeople);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
        this.poolArea = poolArea;
        this.facilityFree = facilityFree;
        this.rentType = rentType;
        this.facilityType = facilityType;
    }

    public FacilityVirtual(String name, int area, double cost, int maxPeople, String standardRoom,
                           String descriptionOtherConvenience, int numberOfFloors, double poolArea, String facilityFree,
                           String rentType, String facilityType) {
        super(name, area, cost, maxPeople);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
        this.poolArea = poolArea;
        this.facilityFree = facilityFree;
        this.rentType = rentType;
        this.facilityType = facilityType;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public String getFacilityType() {
        return facilityType;
    }

    public void setFacilityType(String facilityType) {
        this.facilityType = facilityType;
    }
}
