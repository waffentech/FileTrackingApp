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
<%-- 	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/file_mgmt" user="root" password="" /> --%>

					<sql:update dataSource="${snapshot}" var="count">
					insert into file_log ( file_id, from_section, from_user, to_section, to_user, priority, remarks, status, forwarded_date, received_date)
					values ( ?, ?,?, ?, ?, ?, ?, 2, sysdate(), NULL );
					    <sql:param value="${param.fileid}" />
					    <sql:param value="${param.fromSection}" />
						<sql:param value="${param.fromUser}" />
						<sql:param value="${param.toSection}" />
						<sql:param value="${param.toUser}" />
						<sql:param value="${param.priority}" />
						<sql:param value="${param.remarks}" />
					</sql:update>
					<sql:update dataSource="${snapshot}" var="count">
					UPDATE file_details set from_section=?, from_user=?,  to_section=?, to_user=?, priority=?, status=?,remarks=?, forwarded_date=sysdate(), received_date=NULL where file_id = ${param.fileid};
					    <sql:param value="${param.fromSection}" />
						<sql:param value="${param.fromUser}" />
						<sql:param value="${param.toSection}" />
						<sql:param value="${param.toUser}" />
						<sql:param value="${param.priority}" />
						<sql:param value="2" />
						<sql:param value="${param.remarks}" />
					</sql:update>
	<div class="container">		
        <c:if test="${count>=1}">
            <div class="alert alert-success" role="alert"> Success!! File <span class="label label-success">${param.fileid}</span> is forwarded successfully.</div>
              <a class="btn btn-primary" href="fileView.jsp">Go to File View</a>          
        </c:if>
        <c:if test="${count==0}">
            <div class="alert alert-warning" role="alert">Warning!! File <span class="label label-warning">${param.fileid}</span> could not be forwarded now. Please try again or contact support team</div>
              <a class="btn btn-primary" href="fileForward.jsp?fileid=${param.fileid}">Go Back</a>   
        </c:if>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
