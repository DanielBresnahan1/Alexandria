package account;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

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
	static String url = "jdbc:mysql://ec2-18-217-199-195.us-east-2.compute.amazonaws.com:3306/library?useSSL=false";
	static String dbUser = "library";
	static String dbPassword = "fQEHq9xZ";
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
	        	 acct.setCheckedOutString(rs.getString("checkedOutBooks"));
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
	         String selectSQL = "INSERT into account(userName, email, checkedOutBooks, password) values('" 
	   + userName + "','" + email + "'," + "'{\"checkedOut\": []}'," + "'" + password + "')";
	         System.out.println(selectSQL);
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         preparedStatement.executeUpdate();
	         connection.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
   }
   
   public static void addCheckedOutBook(String userName, JSONArray bookJSON) throws Exception {
	   if (userName == null) {
		   throw new Exception("no username");
	   }
	   String title = (String) bookJSON.get(0);
	   Account acct = getAccountByUsername(userName);
	   acct.deserialize();
	   if (acct.getSerialized().contains(title)) {
		   throw new Exception("book already present");
	   }
	   
		acct.deserialize();
		ArrayList<ArrayList<String>> checkedOutBooks = (ArrayList<ArrayList<String>>) acct.getCheckedOutBooks().get("checkedOut");
		ArrayList<String> newBook = new ArrayList<String>();
		bookJSON.forEach(string -> newBook.add(string.toString()));
		checkedOutBooks.add(newBook);
		JSONArray arrayToSave = new JSONArray();
		checkedOutBooks.forEach(book -> arrayToSave.put(book));
	  	System.out.println(arrayToSave);
	   
	   
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
	         String sql = "UPDATE account SET checkedOutBooks = '{\"checkedOut\": " + arrayToSave.toString() + "}'" + "WHERE userName = '" + userName + "'"; 
	         PreparedStatement preparedStatement = connection.prepareStatement(sql);
	         preparedStatement.executeUpdate();
	         connection.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   
   }
   
   private static Account getAccountByUsername(String userName) throws Exception {
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
	         String selectSQL = "SELECT * FROM account WHERE userName='" + userName + "'";
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();
	         while (rs.next()) {
	        	 acct.setCheckedOutString(rs.getString("checkedOutBooks"));
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
}