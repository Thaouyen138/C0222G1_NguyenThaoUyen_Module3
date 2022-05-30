package customer_management.service;

import customer_management.models.Customer;

import java.util.List;

public interface ICustomerService {
    //Hiển thị danh sách sản phẩm
    //Tạo sản phẩm mới
    //Cập nhật thông tin sản phẩm
    //Xoá một sản phẩm
    //Xem chi tiết một sản phẩm
    //Tìm kiếm sản phẩm theo tên
    List<Customer> findAll();
    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id);

}
