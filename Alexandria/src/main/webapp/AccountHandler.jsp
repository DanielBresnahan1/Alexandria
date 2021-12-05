<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList" %>
<%@page import="account.Util"%>>
<%@page contentType="application/json; charset=UTF-8"%>
<%

		Cookie cookie = null;
	    Cookie[] cookies = null;
	         
	    // Get an array of Cookies associated with the this domain
	    cookies = request.getCookies();
	         
	    String accountName = "";
	         
	    if( cookies != null ) {
	    	for (int i = 0; i < cookies.length; i++) {
	 	       cookie = cookies[i];
		       if (cookie.getName().equals("loggedIn")){
	  	       accountName = cookie.getValue();
		       }
		    }
		} 
	    
	    if(accountName == null || accountName.equals("")){
	    	System.out.println("No Account Cookie");
	    	return;
	    }
	         
	    String bookTitle = request.getParameter("title");
	    String genre = request.getParameter("genre");
	    String isbn = request.getParameter("isbn");
	    String author = request.getParameter("author");
	    
	    JSONArray json_array= new JSONArray();
	    
	    json_array.put(bookTitle);
	    json_array.put(genre);
	    json_array.put(isbn);
	    json_array.put(author);
	    
	    Util.addCheckedOutBook(accountName, json_array);
			
         
%>