<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Member List(ADMIN)</h2>
	
	<div class="container">
		<table class="table table-primary table-hover">
			<thead>
				<tr>
					<th>Email</th>
					<th>Password</th>
					<th>NickName</th>
					<th>LastLogin</th>
					<th>Auth</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="mvo">
					<tr>
						<td>${mvo.email }</td>
						<td>${mvo.pwd }</td>
						<td>${mvo.nickName }</td>
						<td>${mvo.lastLogin }</td>
						<td>
							<c:forEach items="${mvo.authList }" var="authlist">
								${authlist.auth }
							</c:forEach>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>