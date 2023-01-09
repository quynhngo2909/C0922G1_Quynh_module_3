package service.impl;

import repository.IIdListRepository;
import repository.impl.IdFacilityTypeRepository;
import service.IIdListService;

import java.util.List;
import java.util.Map;

public class IdFacilityTypeService implements IIdListService {
    private IIdListRepository facilityTypeRepository = new IdFacilityTypeRepository();
    @Override
    public List<Integer> idList() {
        return facilityTypeRepository.idList();
    }

    @Override
    public List<String> typeNameList() {
        return facilityTypeRepository.typeNameList();
    }

    @Override
    public Map<String, Integer> typeId() {
        return facilityTypeRepository.typeId();
    }
}
