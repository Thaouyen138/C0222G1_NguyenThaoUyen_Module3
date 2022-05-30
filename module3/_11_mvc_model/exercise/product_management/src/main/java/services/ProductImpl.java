package services;

import model.Products;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.

public class ProductImpl implements  IProductServices{
    private static Map<Integer, Products> productsHashMap =new HashMap<>();
    static {
        productsHashMap.put(1,new Products(1,"drink",15.500, "new", "mirinda"));
        productsHashMap.put(2,new Products(2,"drink",15.500, "new", "coca"));
        productsHashMap.put(3,new Products(3,"drink",20.500, "new", "sting"));
        productsHashMap.put(4,new Products(4,"drink",25.000, "new", "red bull"));
        productsHashMap.put(5,new Products(5,"drink",20.000, "new", "pepsi"));
    }

    @Override
    public List<Products> findAll() {
        return new ArrayList<>(productsHashMap.values());    }

    @Override
    public void save(Products products) {
        productsHashMap.put(products.getId(), products);
    }

    @Override
    public Products findById(int id) {
        return productsHashMap.get(id);
    }

    @Override
    public void update(int id, Products products) {
        productsHashMap.put(id, products);
    }

    @Override
    public void remove(int id) {
        productsHashMap.remove(id);
    }
}
