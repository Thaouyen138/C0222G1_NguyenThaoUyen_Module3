package service.impl;

import model.Customer;
import repository.CustomerRepositoryImpl;
import repository.ICustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void insertOne(Customer customer) {
        customerRepository.insertOne(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void upDate(Customer customer) {
        customerRepository.upDate(customer);
    }

    @Override
    public void remove(Integer id) {
        customerRepository.remove(id);
    }
}
