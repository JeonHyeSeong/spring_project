<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Login Page</h2>
	
	<form action="/member/login" method="post">
		<div class="container">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Email</span>
			  <input type="email" class="form-control" name="email">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Password</span>
			  <input type="password" class="form-control" name="pwd">
			</div>
			
			<c:if test="${not empty param.errorMsg }">
				<div class="text-danger mb-3">
					<c:choose>
						<c:when test="${param.errorMsg eq 'Bad credentials' }">
							<c:set var="errText" value="이메일 & 비밀번호가 일치하지 않습니다." />
						</c:when>
						<c:otherwise>
							<c:set var="errText" value="관리자에게 문의해주세요." />
						</c:otherwise>
					</c:choose>
					${errText }
				</div>
			</c:if>
			
			<button type="submit" class="btn btn-outline-primary">로그인</button>
		</div>
	</form>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>