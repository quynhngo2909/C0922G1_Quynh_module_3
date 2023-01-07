package service.impl;

import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypeRepository;
import service.ICustomerTypeIdService;

import java.util.List;

public class CustomerTypeIdService implements ICustomerTypeIdService {
    private ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<Integer> customerTypeID() {
        return customerTypeRepository.customerTypeID();
    }
}
