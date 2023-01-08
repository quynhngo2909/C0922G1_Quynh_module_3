package service.impl;

import repository.IIdListRepository;
import repository.impl.IdRentTypeRepository;
import service.IIdListService;

import java.util.List;

public class IdRentTypeService implements IIdListService {
    private IIdListRepository rentTypeRepository = new IdRentTypeRepository();

    @Override
    public List<Integer> idList() {
        return rentTypeRepository.idList();
    }
}
