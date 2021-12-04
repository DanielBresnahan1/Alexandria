<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="application/json; charset=UTF-8"%>
<%
	System.out.println("Backend spool");
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://ec2-18-217-199-195.us-east-2.compute.amazonaws.com:3306/";
	String database = "library";
	String userid = "library";
	String password = "fQEHq9xZ";
	String bookTitle = request.getParameter("Title");
	String bookGenre = request.getParameter("Genre");
    String bookIsbn = request.getParameter("ISBN");
	String bookAuthor = request.getParameter("Author");
	try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	JSONArray json_array= new JSONArray();
	try{
			connection = DriverManager.getConnection(connectionUrl+database+"?useSSL=false", userid, password);
			System.out.println("Connection formed");
			statement=connection.createStatement();
			String sql =  String.format( "SELECT title, genre, ISBN, author "
					                   + "FROM books WHERE title LIKE \"%%%s%%\" "
					                   + "AND genre LIKE \"%%%s%%\" "
					                   + "AND ISBN LIKE \"%%%s%%\" "
					                   + "AND author LIKE \"%%%s%%\"", 
					                   bookTitle, bookGenre, bookIsbn, bookAuthor);
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()){
				ArrayList<String> currentBook = new ArrayList<String>();
				
				currentBook.add(resultSet.getString("title"));
				currentBook.add(resultSet.getString("genre"));
				currentBook.add(resultSet.getString("isbn"));
				currentBook.add(resultSet.getString("author"));
				
				json_array.put(currentBook);
					
			}
				
			
			String json_string = json_array.toString();
			
			response.getWriter().write(json_string); 
			response.getWriter().flush(); 
			response.getWriter().close();
			
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
	}
%>
