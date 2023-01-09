package repository;

import java.util.List;
import java.util.Map;

public interface IIdListRepository {
    List<Integer> idList();
    List<String> typeNameList();

    Map<String, Integer> typeId();
}
