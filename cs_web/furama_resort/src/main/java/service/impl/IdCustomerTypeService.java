package service.impl;

import repository.IIdListRepository;
import repository.impl.IdCustomerTypeRepository;
import service.IIdListService;

import java.util.List;

public class IdCustomerTypeService implements IIdListService {
    private IIdListRepository customerTypeRepository = new IdCustomerTypeRepository();

    @Override
    public List<Integer> idList() {
        return customerTypeRepository.idList();
    }
}
