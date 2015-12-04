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
<title>View File</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container-fluid">
		<div class="page-header">
			<h1 class="text-center">View My Files</h1>
		</div>
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/file_mgmt" user="root" password="" />

		<c:choose>
			<c:when test="${param.action == 'reject'}">
				<sql:update dataSource="${snapshot}" var="count">
		update file_log set received_date=sysdate(), status=4, remarks='${param.fileReject}' where file_id = ${param.fileid } order by instance_id desc limit 1;
		</sql:update>
				<sql:query dataSource="${snapshot}" var="result">
		SELECT * from file_log where file_id = ${param.fileid } order by instance_id desc limit 1;
		</sql:query>
				<c:forEach var="row" items="${result.rows}">
					<sql:update dataSource="${snapshot}" var="count">
							insert into file_log ( file_id, from_user, from_section, to_user, to_section, priority, remarks, status, forwarded_date, due_date)
					values ( ${row.file_id}, ${row.to_user},${row.to_section}, ${row.from_user}, ${row.from_section}, ${row.priority}, '${row.remarks}', 4, sysdate(), sysdate() );
							</sql:update>
					<sql:update dataSource="${snapshot}" var="count">
					UPDATE file_details set from_user=?, from_section=?, to_section=?, to_user=?, priority=?, status=?, remarks=? where file_id = ${param.fileid};
					    <sql:param value="${row.to_section}" />
						<sql:param value="${row.to_user}" />
						<sql:param value="${row.from_section}" />
						<sql:param value="${row.from_user}" />
						<sql:param value="${row.priority}" />
						<sql:param value="${row.status}" />
						<sql:param value="${row.remarks}" />
					</sql:update>
				</c:forEach>
			</c:when>
			<c:when test="${param.action == 'accept'}">
				<sql:update dataSource="${snapshot}" var="count">
		update file_log set received_date=sysdate(), status=3, remarks='${param.fileAccept}' where file_id = ${param.fileid } order by instance_id desc limit 1;
		</sql:update>
		<sql:update dataSource="${snapshot}" var="count">
					UPDATE file_details set status=3, received_date=sysdate() where file_id = ${param.fileid};
		</sql:update>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>

		<sql:query dataSource="${snapshot}" var="result">
		SELECT * from file_details where to_user = ( select user_id from user where user_name ='${sessionScope['loginUser']}' ) OR exists ( select 1 from user where user_name = '${sessionScope['loginUser']}' and role in ('admin','superuser'));
		</sql:query>
		<div class="table-responsive">
			<table id="FileListTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>File Id</th>
						<th>File Name</th>
<!-- 						<th>File Number</th> -->
<!-- 						<th>File Type</th> -->
						<th>Description</th>
						<th>Owning Department</th>
<!-- 						<th>Owning Section</th> -->
<!-- 						<th>Owner</th> -->
						<th>From Section</th>
						<th>From User</th>
						<th>To Section</th>
						<th>To User</th>
						<th>Priority</th>
<!-- 						<th>Created Date</th> -->
						<th>Status</th>
<!-- 						<th>Completed Date</th> -->
						<th>Due Date</th>
						<th>Forwarded Date</th>
						<th>Received Date</th>
<!-- 						<th>Is Active</th> -->
<!-- 						<th>Tags</th> -->
						<th>Remarks</th>
						<th>Click to View Details</th>
						<th>Click to Accept/Reject/Forward File</th>
					</tr>
				</thead>
				<c:forEach var="row" items="${result.rows}">
					<tbody>
						<tr>
							<td><c:out value="${row.file_id}" /></td>
							<td><c:out value="${row.file_name}" /></td>
<%-- 							<td><c:out value="${row.file_no}" /></td> --%>
<%-- 							<td><c:out value="${row.file_type}" /></td> --%>
							<td><c:out value="${row.description}" /></td>
							<td><c:out value="${row.owner_dept}" /></td>
<%-- 							<td><c:out value="${row.owner_sec}" /></td> --%>
<%-- 							<td><c:out value="${row.owner}" /></td> --%>
							<td><c:out value="${row.from_section}" /></td>
							<td><c:out value="${row.from_user}" /></td>
							<td><c:out value="${row.to_section}" /></td>
							<td><c:out value="${row.to_user}" /></td>
							<td><c:out value="${row.priority}" /></td>
<%-- 							<td><c:out value="${row.created_date}" /></td> --%>
							<td><c:out value="${row.status}" /></td>
<%-- 							<td><c:out value="${row.completed_date}" /></td> --%>
							<td><c:out value="${row.due_date}" /></td>
							<td><c:out value="${row.forwarded_date}" /></td>
							<td><c:out value="${row.received_date}" /></td>
<%-- 							<td><c:out value="${row.is_active}" /></td> --%>
<%-- 							<td><c:out value="${row.tags}" /></td> --%>
							<td><c:out value="${row.remarks}" /></td>
							<td>
								<div>
									<form method="post"
										action="fileDetails.jsp?fileid=${row.file_id}">
										<input type="hidden" id="fileDetails" name="fileDetails"
											value="${row.file_id}" /> <button class="btn btn-primary btn-block" type="submit" value="Details" >Details</button>
									</form>
								</div>
							</td>
							<td>
								<div>
									<c:choose>
										<c:when test="${empty row.received_date}">
										<div>
											<form method="post"	action="fileView.jsp?fileid=${row.file_id}&action=accept">
												<input type="hidden" id="fileAccept" name="fileAccept" value="${row.file_id}" /> 
												<button class="btn btn-primary btn-block" type="submit" value="Accept" onclick="return getRemarks('fileAccept')">Accept</button>
											</form>
											<form method="post" action="fileView.jsp?fileid=${row.file_id}&action=reject&remarks=">
												<input type="hidden" id="fileReject" name="fileReject" value="${row.file_id}" /> 
												<button class="btn btn-danger btn-block" type="submit" value="Reject" onclick="return getRemarks('fileReject')">Reject</button>
											</form>
										</div>
										</c:when>
										<c:otherwise>
											<form method="post"	action="fileForward.jsp?fileid=${row.file_id}&action=forward">
												<input type="hidden" id="fileForward" name="fileForward" value="${row.file_id}" /> 
												<button class="btn btn-primary btn-block" type="submit" value="Forward">Forward</button>
											</form>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function getRemarks(action) {
			var remarks = prompt("Please enter your Remarks if any and click OK", "")
			document.getElementById(action).value = remarks;
			if (remarks == null) {
			    return false;
			}
		}
	</script>
	<%@include file="footer.jsp"%>
</body>
</html>
