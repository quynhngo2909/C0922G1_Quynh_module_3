package service.impl;

import repository.IIdListRepository;
import repository.impl.IdDivisionRepository;
import service.IIdListService;

import java.util.List;

public class IdDivisionService implements IIdListService {
    private IIdListRepository divisionRepository = new IdDivisionRepository();

    @Override
    public List<Integer> idList() {
        return divisionRepository.idList();
    }
}
