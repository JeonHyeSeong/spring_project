<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	<form action="/board/modify" method="post" enctype="multipart/form-data">
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
								<button type="button" class="btn btn-outline-danger fileDel" data-uuid=${fvo.uuid }>X</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="mb-3">
		  		<input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  		<!-- input button trigger 용도의 button -->
		  		<button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
			</div>
			<div class="mb-3" id="fileZone">
				<!-- 첨부파일 표시될 영역 -->
			</div>
			<button type="submit" class="btn btn-outline-warning mBtn" id="regBtn">수정완료</button>
		</div>
	</form>
		
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>