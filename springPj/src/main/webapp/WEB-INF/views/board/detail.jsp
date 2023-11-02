<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	.container{
		width: 600px;
		margin-top: 25px; 
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h2>Board Detail Page</h2>
	
	<div class="container">
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th>#</th>
					<td>${bvo.bno }</td>
				</tr>
				<tr>
					<th>Title</th>
					<td>${bvo.title }</td>
				</tr>
				<tr>
					<th>Writer</th>
					<td>${bvo.writer }</td>
				</tr>
				<tr>
					<th>Content</th>
					<td>${bvo.content }</td>
				</tr>
				<tr>
					<th>RegDate</th>
					<td>${bvo.regDate }</td>
				</tr>
				<tr>
					<th>ModDate</th>
					<td>${bvo.modDate }</td>
				</tr>
				<tr>
					<th>ReadCount</th>
					<td>${bvo.readCount }</td>
				</tr>
			</thead>
		</table>
		<div class="btnContainer">
			<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-outline-warning">수정</button></a>
			<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-outline-danger">삭제</button></a>
		</div>
	</div>
	
	
	<script type="text/javascript">
		let isMod = <c:out value="${isMod}" />;
		if(parseInt(isMod)){
			alert('게시글 수정 성공!!');
		}else{
			alert('게시글 수정 실패!!');
		}
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>