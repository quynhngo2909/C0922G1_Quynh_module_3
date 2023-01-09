package service.impl;

import repository.IIdListRepository;
import repository.impl.IdCustomerTypeRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdCustomerTypeService implements IIdListService {
    private IIdListRepository customerTypeRepository = new IdCustomerTypeRepository();

    @Override
    public List<Integer> idList() {
        return customerTypeRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return customerTypeRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return customerTypeRepository.typeId();
    }
}
