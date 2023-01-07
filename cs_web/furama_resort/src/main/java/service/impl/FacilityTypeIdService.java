package service.impl;

import repository.IFacilityTypeRepository;
import repository.impl.FacilityTypeRepository;
import service.IFacilityTypeIdService;

import java.util.List;

public class FacilityTypeIdService implements IFacilityTypeIdService {
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<Integer> facilityTypeID() {
        return facilityTypeRepository.facilityTypeID();
    }
}
