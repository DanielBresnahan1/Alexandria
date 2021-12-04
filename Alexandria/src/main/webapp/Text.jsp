<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="application/json; charset=UTF-8"%>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://ec2-18-217-199-195.us-east-2.compute.amazonaws.com:3306/";
	String database = "library";
	String userid = "library";
	String password = "fQEHq9xZ";
    String bookIsbn = request.getParameter("ISBN");
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
			statement=connection.createStatement();
			String sql =  String.format( "SELECT text "
					                   + "FROM text WHERE ISBN LIKE \"%s\"", bookIsbn);
			
			resultSet = statement.executeQuery(sql);
			resultSet.next();
			
			String urlString = resultSet.getString("text");
			json_array.put(urlString);
			String json_string = json_array.toString();
			
			
			response.getWriter().write(json_string); 
			response.getWriter().flush(); 
			response.getWriter().close();
			
			
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
	}
%>