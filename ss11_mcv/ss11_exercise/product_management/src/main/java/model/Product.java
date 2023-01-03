package model;

public class Product {
    int id;
    String name;
    Double price;
    String description;
    String producer;

    private static int countProduct = 0;

    public Product() {
        countProduct++;
    }

    public Product(int id, String name, Double price, String description, String producer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.producer = producer;
        countProduct++;
    }

    public Product(String name, Double price, String description, String producer) {
        this.id = ++countProduct;
        this.name = name;
        this.price = price;
        this.description = description;
        this.producer = producer;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }
}
