<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<c:if test="${empty sessionScope['loginUser']}">
    <c:redirect url="login.jsp" />
	</c:if>
	<meta http-equiv="Content-Type" http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
	<title>View File</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<script type="text/javascript" src="html5-boilerplate/js/vendor/Chart.js"></script>
<div class="container">
	<div class="page-header">
		<h1 class="text-center">File Details</h1>
	</div>
	<div>
        <c:if test="${empty param.fileid }">
            <c:redirect url="fileView.jsp" >
                <c:param name="errMsg" value="1" />
            </c:redirect>
        </c:if> 
<%-- 		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/file_mgmt" user="root" password="" /> --%>
		<sql:query dataSource="${snapshot}" var="result">
select fd.file_id, fd.file_name, fd.file_no, fd.file_type, fd.description, fd.owner_dept, fd.owner_sec, fd.owner, fd.priority, fd.created_date, fd.completed_date, fd.due_date, fd.is_active, fd.barcode_string, fd.tags, fd.remarks, fl.instance_id, fl.from_user, fl.to_user, fl.from_section, fl.to_section, concat(fl.priority,'') as priority_fl, concat(fl.remarks,'') as remarks_fl, fl.status, fl.forwarded_date, fl.received_date, fl.due_date from file_details fd, file_log fl where fd.file_id = fl.file_id and fd.file_id = ${param.fileid} and (fd.to_user = ( select user_id from user where user_name ='${sessionScope['loginUser']}' ) OR exists ( select 1 from user where user_name = '${sessionScope['loginUser']}' and role in ('admin','superuser'))) order by fl.instance_id desc;
		</sql:query>
		<div>
			<c:forEach items="${result.rows}" begin="0" end="0" var="row" varStatus="counter">
				<div class="panel-group" id="accordion1">
				    <div class="panel panel-default">
				      <div class="panel-heading">
				        <h4 class="panel-title">
				          <a data-toggle="collapse" data-parent="#accordion1" href="#collapsedetails">Click to View File Information <span class="caret"></span></a>
				        </h4>
				      </div>
				      <div id="collapsedetails" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<div style=" margin : 5px;">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">File Name</label>
									<input class="form-control" type="text" name="fileName" value="${row.file_name}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">File Number</label>
									<input class="form-control" type="text" name="fileNo" value="${row.file_no}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">File Type<span class="small"></span></label>
									<input class="form-control" type="text" name="fileType" value="${row.file_type}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Tags<span class="small"></span></label>
									<input class="form-control" type="text" name="tags" value="${row.tags}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Owning Department<span class="small"></span></label>
									<input class="form-control" type="text" name="ownerDept" value="${row.owner_dept}" disabled/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Owning Section<span class="small"></span></label>
									<input class="form-control" type="text" name="ownerSec" value="${row.owner_sec}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Owner<span class="small"></span></label>
									<input class="form-control" type="text" name="owner" value="${row.owner}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Created Date<span class="small"></span></label>
									<input class="form-control" type="text" name="createdDate" value="${row.created_date}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Is Active<span class="small"></span></label>
									<input class="form-control" type="text" name="isActive" value="${row.is_active}" disabled/>
								</div>
								<div class="form-group">
									<label class="control-label">Barcode String<span class="small"></span></label>
									<input class="form-control" type="text" name="barcodeString" value="${row.barcode_string}" disabled/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">Description<span class="small"></span></label>
									<textarea class="form-control" name="description" disabled>${row.description}</textarea>
								</div>
							</div>
						</div>
						</div>
						</div>
				      </div>
				    </div>
				</div>
				<div class="row">
					  <div class="panel-group" id="accordion">
						  <div class="col-md-6">
						    <div class="panel panel-default">
						      <div class="panel-heading">
						        <h4 class="panel-title">
						          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Click to View Barcode Image <span class="caret"></span></a>
						        </h4>
						      </div>
						      <div id="collapse1" class="panel-collapse collapse">
						        <div class="panel-body">
									<img class="col-md-4" alt=<c:out value="${param.fileid}"/> style="width: 200px; height: 200px;"  src=<c:out value="http://localhost:8080/barcode4j/gensvg?type=code128&msg=${param.fileid}"/> /> 
						        </div>
						      </div>
						    </div>
						   </div>
						   <div class="col-md-6">
						    <div class="panel panel-default">
						      <div class="panel-heading">
						        <h4 class="panel-title">
						          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Click to View File Time Chart <span class="caret"></span></a>
						        </h4>
						      </div>
						      <div id="collapse2" class="panel-collapse collapse in">
						        <div class="panel-body">
									<canvas class="col-md-4" id="myChart" class="chart" style="width: 200px; height: 200px;"></canvas> 
									<div class="progress">
									  <div class="progress-bar progress-bar-success" style="width: 35%">
									    <span class="sr-only">35% Complete (success)</span>
									  </div>
									  <div class="progress-bar progress-bar-info" style="width: 20%">
									    <span class="sr-only">20% Complete (info)</span>
									  </div>
									  <div class="progress-bar progress-bar-warning" style="width: 20%">
									    <span class="sr-only">20% Complete (warning)</span>
									  </div>
									  <div class="progress-bar progress-bar-danger" style="width: 10%">
									    <span class="sr-only">10% Complete (danger)</span>
									  </div>
									  <div class="progress-bar progress-bar-success progress-bar-striped" style="width: 10%">
									    <span class="sr-only">10% Complete (danger)</span>
									  </div>
									  <div class="progress-bar progress-bar-info progress-bar-striped" style="width: 5%">
									    <span class="sr-only">5% Complete (danger)</span>
									  </div>
									</div>   
						        </div>
						      </div>
						    </div>
						   </div>
					  </div> 
				</div>
			  	<div class="row">
	  				<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 35%">
					    <span>35 Ramesh</span>
					  </div>
					  <div class="progress-bar progress-bar-info" style="width: 20%">
					    <span>20 Suresh</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 20%">
					    <span>20 Neel</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 10%">
					    <span>10 Sunil</span>
					  </div>
					  <div class="progress-bar progress-bar-success progress-bar-striped" style="width: 10%">
					    <span>10 Lokesh</span>
					  </div>
					  <div class="progress-bar progress-bar-info progress-bar-striped" style="width: 5%">
					    <span>5 Pankaj</span>
					  </div>
					</div> 
			  	</div>
			</c:forEach>
		</div>

		<div class="table-responsive">
			<table id="example" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th colspan=1>Sl.no.</th>
						<th>From Section</th>
						<th>From User</th>
						<th>To Section</th>
						<th>To User</th>
						<th>Priority</th>
						<th>Status</th>
						<th>Forwarded Date</th>
						<th>Received Date</th>
						<th>Due Date</th>
						<th>Remarks</th>
					</tr>
				</thead>
				<c:forEach var="row" items="${result.rows}" varStatus="loopCount">
					<tbody>
						<tr>
							<td><c:out value="${loopCount.count}" /></td>
							<td><c:out value="${row.from_section}" /></td>
							<td><c:out value="${row.from_user}" /></td>
							<td><c:out value="${row.to_section}" /></td>
							<td><c:out value="${row.to_user}" /></td>
							<td><c:out value="${row.priority_fl}" /></td>
							<td><c:out value="${row.status}" /></td>
							<td><c:out value="${row.forwarded_date}" /></td>
							<td><c:out value="${row.received_date}" /></td>
							<td><c:out value="${row.due_date}" /></td>
							<td><c:out value="${row.remarks_fl}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div>
		<label class="control-label">To go back to File View click -></label>
		<a href="fileView.jsp" class="btn btn-primary" role="button">Back</a>	
	</div>
</div>
	<%@include file="footer.jsp"%>
</body>
<script>
//Get context with jQuery - using jQuery's .get() method.
// var ctx = $("#myChart").get(0).getContext("2d");
// This will get the first returned node in the jQuery collection.
//Chart.defaults.global.responsive = true;
//And for a Bar chart
	var data = {
		    labels: ["Ramesh", "Suresh Kumar", "Neel Shetty", "Sunil Das", "Pankaj Kapoor", "Lokesh", "Amarnath"],
		    datasets: [
		        {
		            label: "Timescale",
		            fillColor: "rgba(151,187,205,0.5)",
		            strokeColor: "rgba(151,187,205,0.8)",
		            highlightFill: "rgba(151,187,205,0.75)",
		            highlightStroke: "rgba(151,187,205,1)",
 		            data: [1, 2, 3, 4, 15, 6, 10]
		        }
		    ]
		};
	var canvas = document.getElementById("myChart");
	var ctx = canvas.getContext("2d");
	var myChart = new Chart(ctx).Bar(data, {
		scaleShowVerticalLines: true,
		scaleShowHorizontalLines: true
   });

$('#collapse2').collapse({
	  toggle: true
	})
</script>
<style type="text/css">
.row { padding-top : 5px; padding-bottom : 5px;}
.table { margin-top : 15px; margin-bottom : 15px;}
</style>
</html>
