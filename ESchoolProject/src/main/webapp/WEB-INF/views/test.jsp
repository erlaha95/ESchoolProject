<%@page import="kz.ismailov.ESchoolProject.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
	User u = (User)request.getAttribute("user");
	if(u!=null){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello <% out.print(u.getName()); %></h1>
	<a href="profile.html">Profile</a>
	
	<c:if test="${not empty lists}">

		<ul>
			<c:forEach items="${lists}" var="listValue" >
				<li>${listValue}</li>
			</c:forEach>
		</ul>

	</c:if>
</body>
</html>
<% } %>