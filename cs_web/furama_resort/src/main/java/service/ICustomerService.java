package service;

import model.CustomerVirtual;

import java.util.List;

public interface ICustomerService {
    List<CustomerVirtual> customers();
    CustomerVirtual findById(int id);
    boolean create(CustomerVirtual customer);
    boolean update(int id, CustomerVirtual customer);
    boolean delete(int id);
    List<CustomerVirtual> searchByNameTypeAddress(String strName, String strType, String strAddress);
}
