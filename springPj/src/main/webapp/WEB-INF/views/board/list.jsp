<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List Page</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	.container{
		width: 700px;
		margin-top: 25px;
	}
	.nav{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	
	<h2>Board List Page</h2>
	
	<div class="container">
		<table class="table table-info table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Title</th>
					<th>Writer</th>
					<th>RegDate</th>
					<th>ReadCount</th>
					<th>CmtCount</th>
					<th>FileCount</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="bvo">
					<tr>
						<td><a href="/board/cntDetail?bno=${bvo.bno }">${bvo.bno }</a></td>
						<td><a href="/board/cntDetail?bno=${bvo.bno }">${bvo.title }</a></td>
						<td>${bvo.writer }</td>
						<td>${bvo.regDate }</td>
						<td>${bvo.readCount }</td>
						<td>${bvo.cmtCount }</td>
						<td>${bvo.fileCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 페이지네이션 -->
	<nav aria-label="Page navigation example" class="nav">
		<ul class="pagination">
			<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
				<a class="page-link" href="/board/list?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}">Previous</a>
			</li>
			<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
				   <li class="page-item">
					    <a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
				   </li>
			</c:forEach>
			<li class="page-item ${(ph.next eq false) ? 'disabled' : '' }">
				<a class="page-link" href="/board/list?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}">Next</a>
			</li>
  		</ul>
	</nav>
	
	<script type="text/javascript">
		let isOk = <c:out value="${isOk}" />;
		if(parseInt(isOk)){
			alert('게시글 등록 성공!!');
		}else{
			alert('게시글 등록 실패!!');
		}
	</script>
	
	<script type="text/javascript">
		let isDel = <c:out value="${isDel}" />;
		if(parseInt(isDel)){
			alert('게시글 삭제 성공!!');
		}else{
			alert('게시글 삭제 실패!!');
		}
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>