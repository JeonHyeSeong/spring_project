<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Modify Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	
	.mBtn{
		margin-top: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Board Modify Page</h2>

	<form action="/board/modify" method="post">
		<div class="container">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">#</span>
			  <input type="text" class="form-control" name="bno" value="${bvo.bno }" readonly="readonly">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Title</span>
			  <input type="text" class="form-control" name="title" value="${bvo.title }">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Writer</span>
			  <input type="text" class="form-control" name="writer" value="${bvo.writer }" readonly="readonly">
			</div>
			<div class="input-group">
			  <span class="input-group-text">Content</span>
			  <textarea class="form-control" name="content">${bvo.content }</textarea>
			</div>
			<button type="submit" class="btn btn-outline-warning mBtn">수정완료</button>
		</div>
	</form>
		
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>