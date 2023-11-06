<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member SignUp Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Member SignUp Page</h2>
	
	<form action="/member/signup" method="post">
		<div class="container">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Email</span>
			  <input type="email" class="form-control" name="email">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Password</span>
			  <input type="password" class="form-control" name="pwd">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">NickName</span>
			  <input type="text" class="form-control" name="nickName">
			</div>
			<button type="submit" class="btn btn-outline-primary">가입완료</button>
		</div>
	</form>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>