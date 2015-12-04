<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Tracking Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- <link href="html5-boilerplate/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="html5-boilerplate/js/vendor/jquery-1.11.3.min.js"></script>
<!-- <script src="html5-boilerplate/js/vendor/bootstrap.min.js"></script> -->
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
<!-- 		<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>  
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>                
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>                        
			      </button>
				<a class="navbar-brand" href="#">File Tracking App</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="dashboard.jsp">Home</a></li>
			        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage Files <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="fileAddNew.jsp">Add New File</a></li>
			            <li><a href="fileView.jsp">View My Files</a></li>
			          </ul>
        			</li>
					<li><a href="#">Manage Users</a></li>
					<li><a href="#">Reports</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="navbar-form" method="post" role="search" action="fileDetails.jsp?fileid=" id="searchform" name="searchform" onsubmit="submitsearchform()">
						  <div class="form-group">
						    <input type="text" class="form-control" placeholder="Search File" id="Search_field1" name="Search_field1">
						  <button type="submit" class="btn btn-primary">Search</button>
<!-- 							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> -->
						  </div>

						</form>
					</li>
					<li class="disabled"><a href="#">Logged in User : 
						<c:out value="${sessionScope['loginUser']}" />
						<c:if test="${empty sessionScope['loginUser']}">
							<c:redirect url="login.jsp" />
						</c:if>
						</a>
					</li>
        			<li><a href="index.jsp?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      			</ul>
			</div>
		</div>
	</nav>
</body>
<script type="text/javascript">
function submitsearchform() {
  document.getElementById("searchform").action = "fileDetails.jsp?fileid=" + document.getElementById("Search_field1").value;
  return true;
}
</script>
</html>
