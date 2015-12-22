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
		<sql:query dataSource="${snapshot}" var="dept_result">
		SELECT dept_id, dept_name, concat(dept_name, ' -> Location : ' , location , ' | Ministry : ' ,ministry) AS dept_detail FROM department; 
		</sql:query>
		<sql:query dataSource="${snapshot}" var="section_result">
		SELECT section_id, section_name, concat(section_name, ' -> Location : ' , location , ' | Contact Person : ' ,contact_person) AS section_detail FROM section; 
		</sql:query>
		<sql:query dataSource="${snapshot}" var="user_result">
		SELECT user_id, concat(first_name, ' ' , middle_name , ' ' ,last_name) AS user_detail FROM user; 
		</sql:query>
	<div class="container">
		<form class="form-horizontal col-md-10 col-md-offset-1 " role="form" id="form" method="post" action="AddNewFileServlet">
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
					<label class="control-label">File Type</label> 
<!-- 					<input type="text"	class="form-control" placeholder="Enter File Type" name="fileType" id="fileType" required/> -->
					<select class="form-control selectpicker show-tick" name="fileType" id="fileType" title="Select File Type" data-header="Select File Type" data-style="btn-info" data-live-search="true" required>
						<option value="1">Internal</option>
						<option value="2">External</option>
						<option value="3">Tender</option>
						<option value="4">Person</option>
						<option value="5">Section</option>
						<option value="6">Department</option>
						<option value="7">Ministry</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">Description</label>
					<textarea class="form-control" rows="3"
						placeholder="Enter Brief Description" name="description" id="description" required></textarea>
				</div>
				<div class="form-group">
					<label class="control-label">Owning Department</label> 
<!-- 					<input	type="text" class="form-control" placeholder="Enter Owning Department" name="ownerDept" id="ownerDept" required/> -->
					<select class="form-control selectpicker show-tick" name="ownerDept" id="ownerDept" title="Select Owning Department" data-header="Select Owning Department" data-style="btn-info" data-live-search="true" required>
						<c:forEach var="dept_row" items="${dept_result.rows}">
							<option title="${dept_row.dept_name}" value="${dept_row.dept_id}"><c:out value="${dept_row.dept_detail}" /></option>
						</c:forEach>
					</select>					
				</div>
				<div class="form-group">
					<label class="control-label">Owning Section</label> 
<!-- 					<input type="text" class="form-control" placeholder="Enter Owning Section" name="ownerSec" id="ownerSec" required/> -->
					<select class="form-control selectpicker show-tick" name="ownerSec" id="ownerSec" title="Select Owning Section" data-header="Select Owning Section" data-style="btn-info" data-live-search="true" required>
						<c:forEach var="section_row" items="${section_result.rows}">
							<option title="${section_row.section_name}" value="${section_row.section_id}"><c:out value="${section_row.section_detail}" /></option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">Owner</label> 
<!-- 					<input type="text" class="form-control" placeholder="Enter Owner" name="owner" id="owner" required/> -->
					<select class="form-control selectpicker show-tick" name="owner" id="owner" title="Select Owner" data-header="Select Owner" data-style="btn-info" data-live-search="true" required>
						<c:forEach var="user_row" items="${user_result.rows}">
							<option value="${user_row.user_id}"><c:out value="${user_row.user_detail}" /></option>
						</c:forEach>
					</select>
					
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
					<label class="control-label">Priority</label> 
<!-- 					<input type="text"	class="form-control" placeholder="Enter Priority" name="priority" id="priority" required/> -->
					<select class="form-control selectpicker show-tick" name="priority" title="Select Priority" data-header="Select Priority" id="priority" data-style="btn-info" data-live-search="true" required>
						<option value="1">High</option>
						<option value="2">Medium</option>
						<option value="3">Low</option>
					</select>
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
