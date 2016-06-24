<%@page import="kz.ismailov.ESchoolProject.model.UserLogin"%>
<%@page import="kz.ismailov.ESchoolProject.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UserLogin user = null; 
	user = (UserLogin)request.getAttribute("user");
	if(user!=null){
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>eSchool</title>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<link href="starter-template.css" rel="stylesheet">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="jquery-3.0.0.min.js"></script>
        
        <script type="text/javascript">
	        $(document).ready(function(){
	        	hideForm();
	        });

        	function showForm(){
        		if ($("#formBtn").text() == "Add user") { 
        			$("#formBtn").text("Hide form"); 
        		} else { 
        			$("#formBtn").text("Add user"); 
        		}
				$("#showUserForm").toggle();				
    		}	
        	
        	function hideForm(){
        		$("#showUserForm").hide();
        	}
    		
        </script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="profile.html">eSchool</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="profile.html">Home</a></li>
            <li><a href="signup.html">Add user</a></li>
            <li><a href="logout.html">Log out</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <div class="starter-template">
      	
      	<h1>Admin page</h1>
      	<h2>Hello ${user.login}</h2>
      	
      	<a class="btn btn-default" onclick="showForm()" id="formBtn" role="button">Add user</a>
      	
      	<div id="showUserForm">
      		<form:form class="form-horizontal" commandName="new_user" action="signup.html" method="POST">
		  <div class="form-group">
		    <form:label path="login" for="inputEmail3" class="col-sm-2 control-label">Login</form:label>
		    <div class="col-sm-5">
		      <form:input path="login" type="text" class="form-control" id="inputEmail3" placeholder="Username"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label path="password" for="inputPassword3" class="col-sm-2 control-label">Password</form:label>
		    <div class="col-sm-5">
		      <form:input path="password" type="password" class="form-control" id="inputPassword3" placeholder="Password"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label path="name" for="inputEmail3" class="col-sm-2 control-label">Name</form:label>
		    <div class="col-sm-5">
		      <form:input path="name" type="text" class="form-control" id="inputEmail3" placeholder="Name"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label path="surname" for="inputEmail3" class="col-sm-2 control-label">Surname</form:label>
		    <div class="col-sm-5">
		      <form:input path="surname" type="text" class="form-control" id="inputEmail3" placeholder="Surname"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <form:label path="group" for="inputEmail3" class="col-sm-2 control-label">Group</form:label>
		    <div class="col-sm-5">
		      <form:input path="group" type="text" class="form-control" id="inputEmail3" placeholder="Group"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <form:button type="submit" class="btn btn-default">Add</form:button>
		    </div>
		  </div>
		</form:form>
      	</div>
      	
      	<c:if test="${not empty users}">
      		<h3>Students</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Surname</th>
						<th>Group</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.name}</td>
						<td>${user.surname}</td>
						<td>${user.group}</td>
						<td>
							
							<form:form commandName="user_del" action="delete_user.html" method="POST">
								
								<form:hidden path="id" value="${user.id}"/>
								<form:button type="submit" class="btn btn-default">Delete</form:button>
							</form:form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<%}else response.sendRedirect("index.jsp"); %>
