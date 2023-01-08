package model;


public class Customer extends Person {
    private int customerTypeId;
    private boolean gender;

    public Customer() {
    }

    public Customer(int id, String name, String birthday, String idCard, String phoneNumber, String email,
                    String address, int customerTypeId, boolean gender) {
        super(id, name, birthday, idCard, phoneNumber, email, address);
        this.customerTypeId = customerTypeId;
        this.gender = gender;
    }

    public Customer(String name, String birthday, String idCard, String phoneNumber, String email,
                    String address, int customerTypeId, boolean gender) {
        super(name, birthday, idCard, phoneNumber, email, address);
        this.customerTypeId = customerTypeId;
        this.gender = gender;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
