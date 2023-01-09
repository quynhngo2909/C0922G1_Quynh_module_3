package service.impl;

import repository.IIdListRepository;
import repository.impl.IdRentTypeRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdRentTypeService implements IIdListService {
    private IIdListRepository rentTypeRepository = new IdRentTypeRepository();

    @Override
    public List<Integer> idList() {
        return rentTypeRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return rentTypeRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return rentTypeRepository.typeId();
    }
}
