package com.example.customer_list.model;


public class Customer {
    private String name;
    private String birthday;
    private String address;
    private boolean gender;
    private String image;
    public Customer() {
    }
    public Customer(String name, String birthday, String address, boolean gender, String image) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.gender = gender;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
