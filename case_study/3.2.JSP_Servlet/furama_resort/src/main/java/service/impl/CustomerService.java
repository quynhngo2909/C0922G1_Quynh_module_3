package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> customers() {
        return customerRepository.customers();
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public boolean create(Customer customer) {
        return customerRepository.create(customer);
    }

    @Override
    public boolean update(int id, Customer customer) {
        return customerRepository.update(id, customer);
    }

    @Override
    public boolean delete(int id) {
        return customerRepository.delete(id);
    }
}
