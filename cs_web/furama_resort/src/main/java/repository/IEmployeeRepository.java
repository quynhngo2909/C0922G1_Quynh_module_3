package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> employeeList();
    boolean create(Employee employee);
    boolean update(int id, Employee employee);
    boolean delete(int id);
    Employee find(String string);
}
