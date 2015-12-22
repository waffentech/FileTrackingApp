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
<link href="style.css" rel="stylesheet" type="text/css" />
<title>Forward File</title>
</head>
<body>
		<%@include file="header.jsp"%>
	<c:if test="${empty param.fileid }">
		<c:redirect url="fileView.jsp">
			<c:param name="errMsg" value="1" />
		</c:redirect>
	</c:if>
	<c:if test="${param.fileid eq 'Accept/Reject'}">
		<c:redirect url="fileView.jsp">
			<c:param name="errMsg" value="1" />
		</c:redirect>
	</c:if>
<%-- 	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/file_mgmt" user="root" password="" /> --%>

	<sql:query dataSource="${snapshot}" var="result">
SELECT * from file_details where file_id = ${param.fileid} and (to_user = ( select user_id from user where user_name ='${sessionScope['loginUser']}' ) OR exists ( select 1 from user where user_name = '${sessionScope['loginUser']}' and role in ('admin','superuser')));
		</sql:query>
<div class="container">
	<form class="form-horizontal" role="form" id="form" method="post" action="fileForwardDb.jsp">
		<div class="page-header">
			<h1 class="text-center">File</h1>
			<p class="text-center">To forward the File to an employee fill the empty fields and click Forward button</p>
		</div>
			<c:forEach items="${result.rows}" begin="0" end="0" var="row" varStatus="counter">
			<div class="panel-group" id="accordion">
				    <div class="panel panel-default">
				      <div class="panel-heading">
				        <h4 class="panel-title">
				          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Click to View File Information <span class="caret"></span></a>
				        </h4>
				      </div>
				      <div id="collapse1" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<div style=" margin : 5px;">
								<div class="form-group">
									<input type="hidden" name="fileid" value="${row.file_id}" />
									<label class="control-label">File Name<span class="small"></span></label>
									<input type="text" class="form-control" name="fileName" value="${row.file_name}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">File Number<span class="small"></span></label>
									<input type="text" class="form-control" name="fileNo" value="${row.file_no}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">File Type<span class="small"></span></label>
									<input type="text" class="form-control" name="fileType" value="${row.file_type}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Description<span class="small"></span></label>
									<textarea class="form-control" name="description" readonly >${row.description}</textarea>
								</div>
								<div class="form-group">
									<label class="control-label">Owning Department<span class="small"></span></label>
									<input type="text" class="form-control" name="ownerDept" value="${row.owner_dept}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Owning Section<span class="small"></span></label>
									<input type="text" class="form-control" name="ownerSec" value="${row.owner_sec}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Owner<span class="small"></span></label>
									<input type="text" class="form-control" name="owner" value="${row.owner}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">From Section<span class="small"></span></label>
									<input type="text" class="form-control" name="fromSection" value="${row.to_section}" id="" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">From User<span class="small"></span></label>
									<input type="text" class="form-control" name="fromUser" value="${row.to_user}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Created Date<span class="small"></span></label>
									<input type="text" class="form-control" name="createdDate" value="${row.created_date}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Due Date(YYYY-MM-DD)</label>
									<input type="date" class="form-control" name="dueDate" value="${row.due_date}" id="" readonly  />
								</div>
								<div class="form-group">
									<label class="control-label">Is Active<span class="small"></span></label>
									<input type="text" class="form-control" name="isActive" value="${row.is_active}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Status<span class="small">Update Status</span></label>
									<input type="text" class="form-control" name="status" value="${row.status}" id="" readonly/>
								</div>
								<div class="form-group">
									<label class="control-label">Barcode String<span class="small"></span></label>
									<input type="text" class="form-control" name="barcodeString" value="${row.barcode_string}" readonly />
								</div>
								<div class="form-group">
									<label class="control-label">Tags<span class="small"></span></label>
									<input type="text" class="form-control" name="tags" value="${row.tags}" readonly />
								</div>
							</div>
						</div>
				      </div>
				    </div>
				</div>
				<div style="margin : 10px; margin-top : 15px;">
					<div class="form-group">
						<label class="control-label">To Section</label>
						<input type="text" class="form-control" name="toSection" placeholder="Enter To Section" value="" id="" required />
					</div>
					<div class="form-group">
						<label class="control-label">To User</label>
						<input type="text" class="form-control" name="toUser" placeholder="Enter To User"value="" required />
					</div>
					<div class="form-group">
						<label class="control-label">Priority</label>
						<input type="text" class="form-control" name="priority" value="${row.priority}" id="" required />
					</div>
					<div class="form-group">
						<label class="control-label">Remarks</label>
						<textarea class="form-control" name="remarks" placeholder="Enter Remarks" id="" required ></textarea>
					</div>
					<label class="control-label">Click to forward the File -></label>
					<button class="btn btn-primary" type="submit">Forward</button>
					<label class="control-label">Click to Go Back to File View -></label>
					<a href="fileView.jsp" class="btn btn-primary" role="button">Back</a>	
				</div>			
			</c:forEach>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
