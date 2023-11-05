<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Register Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	
	.container{
		margin: 20px;
	}
	
	.rBtn{
		margin-top: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />


	<h2>Board Register Page</h2>
	
	<form action="/board/register" method="post" enctype="multipart/form-data">
		<div class="container">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Title</span>
			  <input type="text" class="form-control" name="title" placeholder="title 입력...">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Writer</span>
			  <input type="text" class="form-control" name="writer" placeholder="writer 입력...">
			</div>
			<div class="input-group">
			  <span class="input-group-text">Content</span>
			  <textarea class="form-control" name="content"></textarea>
			</div>
			<div class="mb-3">
		  		<input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  		<!-- input button trigger 용도의 button -->
		  		<button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
			</div>
			<div class="mb-3" id="fileZone">
				<!-- 첨부파일 표시될 영역 -->
			</div>
			<button type="submit" class="btn btn-outline-primary rBtn" id="regBtn">등록</button>
		</div>
	</form>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>