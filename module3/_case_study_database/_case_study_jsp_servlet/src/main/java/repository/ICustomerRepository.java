package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    void insertOne(Customer customer);
    Customer findById(int id);
    void upDate(Customer customer);
    void remove(Integer id);
}
