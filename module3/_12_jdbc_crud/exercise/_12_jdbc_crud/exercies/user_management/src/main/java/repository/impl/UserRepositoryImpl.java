package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
  private final   BaseRepository baseRepository=new BaseRepository();

  @Override
  public List<User> list() throws SQLException {
    return null;
  }

  @Override
  public void removeUser(int id) {

  }

  @Override
  public void createUser(User user) {

  }

  @Override
  public User findUserById(Integer id) {
    return null;
  }

  @Override
  public List<User> findUserByCountry(String searchText) {
    return null;
  }

  @Override
  public List<User> sortUserByName() {
    return null;
  }
}
