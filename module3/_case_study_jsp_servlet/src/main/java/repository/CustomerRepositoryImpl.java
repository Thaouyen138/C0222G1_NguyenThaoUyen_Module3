package repository;

import model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL = " Select * from furama.customer";
    private static final String INSERT = " Insert into furama.customer (customer_id,customer_type_id,customer_code,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) Values (?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_BY_ID = "select * from furama.customer where customer_id=?";
    private static final String UP_DATE = "Update furama.customer Set customer_id=?,customer_type_id=?,customer_code=?,customer_name=?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=? where customer_id=?";
    private static final String DELETE = "Delete furama.customer where customer_id=?";

    //customer_id INT PRIMARY KEY,
    //customer_type_id INT,
    //customer_code VARCHAR(45),
    //customer_name VARCHAR(45) NOT NULL,
    //customer_birthday DATE NOT NULL,
    //customer_gender BIT(1) NOT NULL,
    //customer_id_card VARCHAR(45) NOT NULL,
    //customer_phone VARCHAR(45) NOT NULL,
    //customer_email VARCHAR(45),
    //customer_address VARCHAR(45),
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        try
                (Connection connection = baseRepository.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            ResultSet rs = preparedStatement.executeQuery();
            Customer customer = null;
            while (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setTypeId(rs.getInt("customer_type_id"));
                customer.setCode(rs.getString("customer_code"));
                customer.setName(rs.getString("customer_name"));
                customer.setDayOfBirth(rs.getString("customer_birthday"));
                customer.setGender(rs.getInt("gender"));
                customer.setPassport(rs.getString("customer_id_card"));
                customer.setPhone(rs.getString("customer_phone"));
                customer.setEmail(rs.getString("customer_email"));
                customer.setAddress(rs.getString("customer_address"));
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    //    private Integer id;
    //    private Integer typeId;
    //    private String code;
    //    private String name;
    //    private String dayOfBirth;
    //    private Integer gender;
    //    private String passport;
    //    private String phone;
    //    private String email;
    //    private String address;
    @Override
    public void insertOne(Customer customer) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getCode());
            preparedStatement.setString(4, customer.getName());
            preparedStatement.setString(5, customer.getDayOfBirth());
            preparedStatement.setInt(6, customer.getGender());
            preparedStatement.setString(7, customer.getPassport());
            preparedStatement.setString(8, customer.getPhone());
            preparedStatement.setString(9, customer.getEmail());
            preparedStatement.setString(10, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Customer findById(int id) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
        ) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setTypeId(rs.getInt("customer_type_id"));
                customer.setCode(rs.getString("customer_code"));
                customer.setName(rs.getString("customer_name"));
                customer.setDayOfBirth(rs.getString("customer_birthday"));
                customer.setGender(rs.getInt("gender"));
                customer.setPassport(rs.getString("customer_id_card"));
                customer.setPhone(rs.getString("customer_phone"));
                customer.setEmail(rs.getString("customer_email"));
                customer.setAddress(rs.getString("customer_address"));
                return customer;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public void upDate(Customer customer) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UP_DATE)
        ) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getCode());
            preparedStatement.setString(4, customer.getName());
            preparedStatement.setString(5, customer.getDayOfBirth());
            preparedStatement.setInt(6, customer.getGender());
            preparedStatement.setString(7, customer.getPassport());
            preparedStatement.setString(8, customer.getPhone());
            preparedStatement.setString(9, customer.getEmail());
            preparedStatement.setString(10, customer.getAddress());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void remove(Integer id) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE)) {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
