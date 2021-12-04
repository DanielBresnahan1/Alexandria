<%@ page import="account.Util" %>
<%@page import="account.Account" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page contentType="application/json; charset=UTF-8" %>
<%
		ObjectMapper objectMapper = new ObjectMapper();
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		if (username != null && password != null) {			
			Account acct = Util.getAccount(username, password);
			if (acct != null) {
				acct.deserialize();
				response.getWriter().print(objectMapper.writeValueAsString(acct));
				Cookie cookie = new Cookie("loggedIn", acct.getUserName());
				response.addCookie(cookie);
		} else {
			response.getWriter().print("");
		}
		}
%>