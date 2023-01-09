package repository;

import model.CustomerVirtual;

import java.util.List;

public interface ICustomerRepository {
    List<CustomerVirtual> customers();
    CustomerVirtual findById(int findId);
    boolean create(CustomerVirtual customer);
    boolean update(int id, CustomerVirtual customer);
    boolean delete(int id);
}
