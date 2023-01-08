package service.impl;

import repository.IIdListRepository;
import repository.impl.IdFacilityTypeRepository;
import service.IIdListService;

import java.util.List;

public class IdFacilityTypeService implements IIdListService {
    private IIdListRepository facilityTypeRepository = new IdFacilityTypeRepository();
    @Override
    public List<Integer> idList() {
        return facilityTypeRepository.idList();
    }
}
