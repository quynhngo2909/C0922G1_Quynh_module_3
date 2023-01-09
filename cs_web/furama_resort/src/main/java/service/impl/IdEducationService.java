package service.impl;

import repository.IIdListRepository;
import repository.impl.IdEducationRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdEducationService implements IIdListService {
    private IIdListRepository educationRepository = new IdEducationRepository();
    @Override
    public List<Integer> idList() {
        return educationRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return educationRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return educationRepository.typeId();
    }
}
