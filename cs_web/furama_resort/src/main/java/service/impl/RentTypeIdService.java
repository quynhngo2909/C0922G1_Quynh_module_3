package service.impl;

import repository.IRentTypeRepository;
import repository.impl.RentTypeRepository;
import service.IRentTypeIdService;

import java.util.List;

public class RentTypeIdService implements IRentTypeIdService {
    private IRentTypeRepository rentTypeRepository = new RentTypeRepository();

    @Override
    public List<Integer> rentTypeID() {
        return rentTypeRepository.rentTypeID();
    }
}
