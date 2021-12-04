<%@ page language="java" contentType="text; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.Util" %>
    
<%
	try {		
		Util.addAccount(request.getParameter("userName"), request.getParameter("email"), request.getParameter("password"));
		response.setStatus(200);
		response.getWriter().print("success");
	} catch (Exception e) {
		response.setStatus(400);
	}
%>