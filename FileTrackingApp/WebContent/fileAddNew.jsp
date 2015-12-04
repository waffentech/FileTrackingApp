<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty sessionScope['loginUser']}">
	<c:redirect url="login.jsp" />
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New File</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<form class="form-horizontal" role="form" id="form" method="post" action="AddNewFileServlet">
			<div id="">
				<div class="page-header"><h1 class="text-center">Add New File</h1>
					<p class="text-center">To add new file enter the following information</p>
				</div>
				<div class="form-group">
					<label class="control-label">File Name</label> 
					<input type="text" class="form-control" placeholder="Enter File Name" name="fileName" id="fileName" autofocus required/>
				</div>
				<div class="form-group">
					<label class="control-label">File Number</label> 
					<input type="text" class="form-control" placeholder="Enter File Number" name="fileNo" id="fileNo" required/>
				</div>
				<div class="form-group">
					<label class="control-label">File Type</label> <input type="text"
						class="form-control" placeholder="Enter File Type" name="fileType" id="fileType" required/>
				</div>
				<div class="form-group">
					<label class="control-label">Description</label>
					<textarea class="form-control" rows="3"
						placeholder="Enter Brief Description" name="description" id="description" required></textarea>
				</div>
				<div class="form-group">
					<label class="control-label">Owning Department</label> <input
						type="text" class="form-control"
						placeholder="Enter Owning Department" name="ownerDept" id="ownerDept" required/>
				</div>
				<div class="form-group">
					<label class="control-label">Owning Section</label> <input
						type="text" class="form-control" placeholder="Enter Owning Section" name="ownerSec" id="ownerSec" required/>
				</div>
				<div class="form-group">
					<label class="control-label">Owner</label> <input type="text"
						class="form-control" placeholder="Enter Owner" name="owner" id="owner" required/>
				</div>
				<!--                     <label>From Section<span class="small">Enter From Section</span></label> -->
				<!--                     <input type="text" name="fromSection" id="" /> -->
				<!--                     <label>To Section<span class="small">Enter To Section</span></label> -->
				<!--                     <input type="text" name="toSection" id="" /> -->
				<!--                     <label>From User<span class="small">Enter From User</span></label> -->
				<!--                     <input type="text" name="fromUser" /> -->
				<!--                     <label>To User<span class="small">Enter To User</span></label> -->
				<!--                     <input type="text" name="toUser" /> -->
				<div class="form-group">
					<label class="control-label">Priority</label> <input type="text"
						class="form-control" placeholder="Enter Priority" name="priority" id="priority" required/>
				</div>
	            <div class="form-group">
	            	<label class="control-label">Created Date <small>(DD/MM/YYYY)</small></label>
	                <div class='input-group date' id='datetimepicker1'>
	                    <input type='text' class="form-control" placeholder="Enter Created Date" name="createdDate" id="createdDate" required/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
				<!--                     <label>Status<span class="small">Enter Status</span></label> -->
				<!--                     <input type="text" name="status" id="" /> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label">Due Date</label> <input -->
<!-- 						class="form-control" data-provide="datepicker-inline" -->
<!-- 						data-date-format="dd/mm/yyyy" placeholder="Enter Due Date" -->
<!-- 						id="dueDate" /> -->
<!-- 				</div> -->
	            <div class="form-group">
	            	<label class="control-label">Due Date <small>(DD/MM/YYYY)</small></label>
	                <div class='input-group date' id='datetimepicker2'>
	                    <input type='text' class="form-control" placeholder="Enter Due Date" name="dueDate" id="dueDate" required/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
				<div class="form-group">
					<label class="control-label">Tags</label> <input type="text"
						class="form-control" placeholder="Enter Search Tags" name="tags" id="tags" />
				</div>
				<div class="form-group">
					<label class="control-label">Remarks</label> <input type="text"
						class="form-control" placeholder="Enter Remarks" name="remarks" id="remarks" required/>
				</div>
				<button type="submit" class="btn btn-primary">Add New File</button>
				<div class="spacer"></div>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
   <script type="text/javascript">
       $(function () {
           $('#datetimepicker1').datetimepicker({
               format: 'DD/MM/YYYY',
               inline: true,
               useCurrent: false,
               calendarWeeks: true,
               showTodayButton: true,
               showClear: true,
               showClose: true,
               toolbarPlacement: 'top'
           });
           $('#datetimepicker2').datetimepicker({
               format: 'DD/MM/YYYY',
               inline: true,
               useCurrent: false,
               calendarWeeks: true,
               showTodayButton: true,
               showClear: true,
               showClose: true,
               toolbarPlacement: 'top'
           });
       });
   </script>
</html>
