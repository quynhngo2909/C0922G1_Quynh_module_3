package service.impl;

import repository.IIdListRepository;
import repository.impl.IdPositionRepository;
import service.IIdListService;

import java.util.List;

public class IdPositionService implements IIdListService {
    private IIdListRepository positionRepository = new IdPositionRepository();
    @Override
    public List<Integer> idList() {
        return positionRepository.idList();
    }
}
