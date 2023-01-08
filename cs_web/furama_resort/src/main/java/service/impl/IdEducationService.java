package service.impl;

import repository.IIdListRepository;
import repository.impl.IdEducationRepository;
import service.IIdListService;

import java.util.List;

public class IdEducationService implements IIdListService {
    private IIdListRepository educationRepository = new IdEducationRepository();
    @Override
    public List<Integer> idList() {
        return educationRepository.idList();
    }
}
