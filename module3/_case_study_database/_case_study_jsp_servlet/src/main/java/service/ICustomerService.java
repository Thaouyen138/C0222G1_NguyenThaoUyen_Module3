package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void insertOne(Customer customer);
    Customer findById(int id);
    void upDate(Customer customer);
    void remove(Integer id);
}
