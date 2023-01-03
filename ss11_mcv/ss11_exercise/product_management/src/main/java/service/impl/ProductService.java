package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> list() {
        return productRepository.list();
    }

    @Override
    public boolean save(Product product) {
       return productRepository.save(product);
    }

    @Override
    public boolean update(int id, Product product) {
       return productRepository.update(id, product);
    }

    @Override
    public boolean delete(int id) {
       return productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
       return productRepository.searchByName(name);
    }
}
