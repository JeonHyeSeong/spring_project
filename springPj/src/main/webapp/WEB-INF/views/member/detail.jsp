<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member detail Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Member Detail/Modify</h2>
	
	<form action="/member/detail" method="post">
		<div class="container">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Email</span>
			  <input type="email" class="form-control" name="email" value="${mvo.email }" readonly="readonly">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Password</span>
			  <input type="password" class="form-control" name="pwd" value="">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">NickName</span>
			  <input type="text" class="form-control" name="nickName" value="${mvo.nickName }">
			</div>
			<button type="submit" class="btn btn-outline-warning">회원정보수정</button>
			<a href="/member/remove?email=${mvo.email }"><button type="button" class="btn btn-outline-danger">탈퇴</button></a>
		</div>
	</form>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>