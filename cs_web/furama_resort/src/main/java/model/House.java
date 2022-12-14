package model;

public class House extends Facility{
    private String standardRoom;
    private String descriptionOtherConvenience;
    private int numberOfFloors;

    public House() {
    }

    public House(int id, String name, int area, double cost, int maxPeople, int rentTypeId, int facilityTypeId,
                 String standardRoom, String descriptionOtherConvenience, int numberOfFloors) {
        super(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
    }

    public House(String name, int area, double cost, int maxPeople, int rentTypeId, int facilityTypeId,
                 String standardRoom, String descriptionOtherConvenience, int numberOfFloors) {
        super(name, area, cost, maxPeople, rentTypeId, facilityTypeId);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
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
}
