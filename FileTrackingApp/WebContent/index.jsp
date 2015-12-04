<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Authentication</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!-- <link href="html5-boilerplate/css/bootstrap.min.css" rel="stylesheet"> -->
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
		<script src="html5-boilerplate/js/vendor/jquery-1.11.3.min.js"></script>
		<!-- <script src="html5-boilerplate/js/vendor/bootstrap.min.js"></script> -->
		<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
    <div class="container">
        <c:if test="${ param.action eq 'logout' }">
		<div class="alert alert-success" role="alert">Successfully Logged Out</div>
		            <c:set scope="session"
                   var="loginUser"
                   value=""/>
    	</c:if>
    	<div>
    		<div>
    			<h1 class="text-center jumbotron" >File Tracking App <small><sub>by WaffenTech</sub></small></h1>
    		</div>
		  <form class="form-signin col-md-4 col-md-offset-4" role="form" id="form" method="post" action="login.jsp">
		        <h3 class="form-signin-heading text-center" style="margin-bottom : 20px; margin-top : 10px" >Sign in to continue</h3>
		        <label for="inputusername" class="sr-only">User Name</label>
		        <input type="text" id="inputusername" class="form-control" name="username" placeholder="Enter User Name" required autofocus>
		        <label for="inputPassword" class="sr-only">Password</label>
		        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Enter Password" required>
		        <div class="checkbox">
		          <label>
		            <input type="checkbox" value="remember-me" disabled> Remember me
		          </label>
		        </div>
		        <button class="btn btn-primary btn-block" type="submit">Sign in</button>
	      </form>
	     </div>
        	    <c:if test="${not empty param.errMsg}">
	            <c:out value="${param.errMsg}" />
	            </c:if>
       </div>
    </body>
</html>
