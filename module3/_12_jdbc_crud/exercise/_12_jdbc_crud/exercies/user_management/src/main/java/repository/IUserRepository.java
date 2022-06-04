package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> list() throws SQLException;

    void removeUser(int id);
    void createUser(User user);

    User findUserById(Integer id);

    List<User> findUserByCountry(String searchText);

    List<User> sortUserByName();

}
