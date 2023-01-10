package service.impl;

import repository.IIdListRepository;
import repository.impl.IdDivisionRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdDivisionService implements IIdListService {
    private IIdListRepository divisionRepository = new IdDivisionRepository();

    @Override
    public List<Integer> idList() {
        return divisionRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return divisionRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return divisionRepository.typeIdMap();
    }
}
