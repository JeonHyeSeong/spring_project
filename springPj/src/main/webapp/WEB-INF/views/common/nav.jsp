<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Menu</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/board/list">Board List</a>
	        </li>     
	        <sec:authorize access="isAuthenticated()">
	        
	        	<sec:authentication property="principal.mvo.email" var="authEmail"/>
			    <sec:authentication property="principal.mvo.nickName" var="authNick"/>
			    <sec:authentication property="principal.mvo.authList" var="auths"/>
			    
			    <c:choose>
			      	<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
			        	<li class="nav-item">
			        		<a class="nav-link" href="/member/list">ADMIN > ${authNick }(${authEmail })</a>
			        	</li>
			        </c:when>
			        <c:otherwise>
			        	<li class="nav-item">
			        		<a class="nav-link" href="/member/detail?email=${authEmail }">${authNick }(${authEmail })</a>
			        	</li>
			        </c:otherwise>
			    </c:choose>
			    
		        <li class="nav-item">
		          <a class="nav-link" href="/board/register">Board Register</a>
		        </li>   
			    
		        <li class="nav-item">
		          <a class="nav-link" href="/member/logout">Logout</a>
		        </li>     
		        
		        <form action="/member/logout" method="post" id="logoutForm">
				  <input type="hidden" name="email" value="${authEmail }">
				</form> 
	        </sec:authorize>  
	        <sec:authorize access="isAnonymous()">
		        <li class="nav-item">
		          <a class="nav-link" href="/member/signup">Sign Up</a>
		        </li>     
		        <li class="nav-item">
		          <a class="nav-link" href="/member/login">Login</a>
		        </li> 
		    </sec:authorize>    
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<script type="text/javascript">
		document.getElementById('logoutLink').addEventListener('click',(e)=>{
			e.preventDefault();
			document.getElementById('logoutForm').submit();
		})
	</script>
	
</body>
</html>