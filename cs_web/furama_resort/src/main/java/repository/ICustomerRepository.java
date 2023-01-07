package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> customers();
    Customer findById(int id);
    boolean create(Customer customer);
    boolean update(int id, Customer customer);
    boolean delete(int id);
}
