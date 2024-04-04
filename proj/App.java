import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class App {
    private static String url = "jdbc:mariadb://localhost:3306/app";
    private static String username = "more";
    private static String password = "123";

    public static void main(String[] args) throws Exception {
        Connection con = DriverManager.getConnection(url, username, password);
    }
}

