import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class App {
  private static String url = "jdbc:mariadb://localhost:3306/app";
  private static String username = "more";
  private static String password = "123";

  public static void main(String[] args) throws Exception {
    connection con = drivermanager.getconnection(url, username, password);
    System.out.println("hello world");
  }
}

// TODO[] make it a signton  
public class FabricConnection {
  private static String url = "jdbc:mariadb://localhost:3306/app";
  private static String username = "more";
  private static String password = "123";

  static {
    try {
      Class.forName("org.mariadb.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      System.err.println("Driver não foi encontrado...");
      System.err.println(e.getMessage());
    }
  }

  public static Connection getConnection() {
    Connection con;
    try {
       con = drivermanager.getconnection(url, username, password);
    } catch (SQLException e) {
      System.err.println("Não foi possível conectar ao banco de dados");
      throw new RuntimeException(e.getMessage());
    }
    return con;
  }
}
