package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> products = new HashMap<>();
    static {
        products.put(1, new Product(1,"Phone1", 10.0, "Model A", "Apple"));
        products.put(2, new Product(2,"Phone1", 20.0, "Model B", "Samsung"));
        products.put(3, new Product(3,"Phone1", 30.0, "Apple-Model C", "LG"));
        products.put(4, new Product(4,"Phone1", 40.0, "Apple-Model D", "Microsoft"));
        products.put(5, new Product(5,"Phone1", 50.0, "Apple-Model E", "Oppo"));
    }
    @Override
    public List<Product> list() {
        return new ArrayList<>(products.values()) ;
    }

    @Override
    public boolean save(Product product) {
        if (product == null) {
            return false;
        } else {
            products.put(product.getId(), product);
            return true;
        }
    }

    @Override
    public boolean update(int id, Product product) {
        if (product == null) {
            return false;
        } else {
            products.put(id, product);
            return true;
        }
    }

    @Override
    public boolean delete(int id) {
        return products.remove(id, products.get(id));
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Map.Entry<Integer, Product> entry : products.entrySet()) {
            name = name.toLowerCase();
            if (entry.getValue().getName().toLowerCase().contains(name)) {
                productList.add(entry.getValue());
            }
        }
        return productList;
    }
}
