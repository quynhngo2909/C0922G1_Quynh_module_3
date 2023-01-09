package service;

import java.util.List;
import java.util.Map;

public interface IIdListService {
    List<Integer> idList();
    List<String> typeNameList();
    Map<String, Integer> typeId();
}
