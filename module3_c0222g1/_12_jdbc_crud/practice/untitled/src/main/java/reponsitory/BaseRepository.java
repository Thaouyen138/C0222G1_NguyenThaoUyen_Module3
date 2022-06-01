package reponsitory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

    public class BaseRepository {
        private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
        private String jdbcUserName = "root";
        private String jdbcPassword = "thaouyen123";
        private Connection connection;

        public BaseRepository() {
        }

        public Connection getConnection() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                this.connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
                return connection;
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            return null;
        }
    }

