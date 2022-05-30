package services;

import model.Products;

import java.util.List;

public interface IProductServices {
    List<Products> findAll();
    void save(Products products);

    Products findById(int id);

    void update(int id, Products products);

    void remove(int id);
}
