package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> list();
    boolean save(Product product);
    boolean update(int id, Product product);
    boolean delete(int id);
    Product findById(int id);
    List<Product>  searchByName(String name);
}
