<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	.cmtContainer{
		width: 500px;
		position: relative;
		left: 310px;
	}
	.btnContainer{
		display: flex;
		justify-content: center;
	}
	.btn-outline-warning, .btn-outline-danger{
		margin-left: 20px;
		margin-right: 20px;
	}
	.text-center{
		width: 500px;
		position: relative;
		left: 310px;
	}
	.cmtBox{
		margin-bottom: 10px;
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
		
		<!-- 파일 표시 -->
		<c:set value="${BoardDTO.flist }" var="flist"></c:set>
		<div>
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist }" var="fvo">
					<li class="list-group-item">
						<c:choose>
							<c:when test="${fvo.fileType > 0 }">
								<div>
									<img alt="그림없음." src="/upload/${fn:replace(fvo.saveDir,'\\','/')}/
									${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
						</c:choose>
						<div>
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge rounded-pill text-bg-info">${fvo.regDate }</span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="btnContainer">
			<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-outline-warning">수정</button></a>
			<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-outline-danger">삭제</button></a>
		</div>
	</div>
	
	<!-- 댓글 등록 -->
	<div class="cmtContainer">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.mvo.email" var="authEmail"/>
			<div class="input-group mb-3">
				<span class="input-group-text" id="cmtWriter">${authEmail }</span>
				<input type="text" class="form-control" id="cmtText" placeholder="Test Comment...">
				<button type="button" class="btn btn-success" id="cmtPostBtn">등록</button>
			</div>
		</sec:authorize>
	</div>
	
	<!-- 댓글 표시 -->
	<div id="cmtListArea">
	
	</div>
	
	
	
	<script type="text/javascript">
		const bnoVal = `<c:out value="${bvo.bno}" />`;
		console.log(bnoVal);
	</script>
	
	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	
	<script type="text/javascript">
	CommentList(bnoVal);
	</script>
	
	<script type="text/javascript">
		const isMod = <c:out value="${isMod}" />;
		if(parseInt(isMod)){
			alert('게시글 수정 성공!!');
		}else{
			alert('게시글 수정 실패!!');
		}
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>