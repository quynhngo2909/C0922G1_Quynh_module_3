package service.impl;

import repository.IIdListRepository;
import repository.impl.IdPositionRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdPositionService implements IIdListService {
    private IIdListRepository positionRepository = new IdPositionRepository();
    @Override
    public List<Integer> idList() {
        return positionRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return positionRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return positionRepository.typeIdMap();
    }
}
