package service.impl;

import model.CustomerVirtual;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<CustomerVirtual> customers() {
        return customerRepository.customers();
    }

    @Override
    public CustomerVirtual findById(int id) {
        return null;
    }

    @Override
    public boolean create(CustomerVirtual customer) {
        return customerRepository.create(customer);
    }

    @Override
    public boolean update(int id, CustomerVirtual customer) {
        return customerRepository.update(id, customer);
    }

    @Override
    public boolean delete(int id) {
        return customerRepository.delete(id);
    }
}
