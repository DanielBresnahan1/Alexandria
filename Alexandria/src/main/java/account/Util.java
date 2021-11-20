package account;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @since JavaSE-1.8
 */
public class Util {
	static String driver = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://ec2-3-135-191-199.us-east-2.compute.amazonaws.com:3306/library?useSSL=false";
	static String dbUser = "connector";
	static String dbPassword = "Sempron12!";
	static Connection connection = null;

   public static Account getAccount(String userName, String password) throws Exception {
	   try {
		   Class.forName(driver);
	   } catch (ClassNotFoundException e) {
		   e.printStackTrace();
	   }
	   Account acct = new Account();
	   try {
		   
		   connection = DriverManager.getConnection(url, dbUser, dbPassword);
	   } catch (Exception e) {
		   e.printStackTrace();
		   throw e;
	   }
	   
	   try {
	         String selectSQL = "SELECT * FROM account WHERE userName='" + userName + "' AND password='" + password + "'";
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();
	         while (rs.next()) {
	        	 acct.setCheckedOutString(rs.getString("checkedOut"));
	        	 acct.setEmail(rs.getString("email"));
	        	 acct.setPassword(rs.getString("password"));
	        	 acct.setUserName(rs.getString("userName"));
	        	 connection.close();
	        	 break;
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   return acct;
}
   
   public static void addAccount(String userName, String email, String password) throws Exception {
	   try {
		   Class.forName(driver);
	   } catch (ClassNotFoundException e) {
		   e.printStackTrace();
	   }
	   try {
		   connection = DriverManager.getConnection(url, dbUser, dbPassword);
	   } catch (Exception e) {
		   e.printStackTrace();
		   throw e;
	   }
	   
	   try {
	         String selectSQL = "INSERT into account(userName, email, checkedOut, password) values('" 
	   + userName + "','" + email + "'," + "null," + "'" + password + "')";
	         System.out.println(selectSQL);
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         preparedStatement.executeUpdate();
	         connection.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
}
}