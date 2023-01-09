package model;

public class CustomerVirtual extends Person {
    private CustomerTypeId customerTypeId;
    private boolean gender;

    public CustomerVirtual(int id, String name, String birthday, String idCard, String phoneNumber, String email,
                           String address, CustomerTypeId customerTypeId, boolean gender) {
        super(id, name, birthday, idCard, phoneNumber, email, address);
        this.customerTypeId = customerTypeId;
        this.gender = gender;
    }

    public CustomerVirtual(String name, String birthday, String idCard, String phoneNumber, String email,
                           String address, CustomerTypeId customerTypeId, boolean gender) {
        super(name, birthday, idCard, phoneNumber, email, address);
        this.customerTypeId = customerTypeId;
        this.gender = gender;
    }

    public CustomerTypeId getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(CustomerTypeId customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
