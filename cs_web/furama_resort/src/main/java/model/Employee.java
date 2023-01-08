package model;

public class Employee extends  Person{
    private double salary;
    private int positionId;
    private int educationDegree;
    private int divisionId;
    private String  username;

    public Employee() {
    }

    public Employee(int id, String name, String birthday, String idCard, String phoneNumber, String email, String address,
                    double salary, int positionId, int educationDegree, int divisionId, String username) {
        super(id, name, birthday, idCard, phoneNumber, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationDegree = educationDegree;
        this.divisionId = divisionId;
        this.username = username;
    }

    public Employee(String name, String birthday, String idCard, String phoneNumber, String email, String address,
                    double salary, int positionId, int educationDegree, int divisionId, String username) {
        super(name, birthday, idCard, phoneNumber, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationDegree = educationDegree;
        this.divisionId = divisionId;
        this.username = username;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(int educationDegree) {
        this.educationDegree = educationDegree;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
