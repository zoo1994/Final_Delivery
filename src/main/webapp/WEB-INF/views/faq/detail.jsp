<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>

<!-- <div class="container mt-5"></div> -->
<div style="margin-top: 200px;"></div>

<div class="container justify-content-center"  style="width: 1000px;">

		<form action="./delete" method="post">
		<input type="hidden" name="num" value="${vo.num}">
		<div class="card"><!--  style="width: 18rem;" -->
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">제목</li>
		    <li class="list-group-item">${vo.title}</li>
		    <li class="list-group-item">작성자</li>
		    <li class="list-group-item">${vo.id}</li>
		    <li class="list-group-item">카테고리</li>
		    <li class="list-group-item">
		    <c:choose>
			    <c:when test="${vo.category eq 1}">
			    	주문접수
			    </c:when>
			    <c:when test="${vo.category eq 2}">
			    	주문확인
			    </c:when>
			    <c:when test="${vo.category eq 3}">
			    	주문취소/변경
			    </c:when>
			    <c:when test="${vo.category eq 4}">
			    	서비스 이용
			    </c:when>
			    <c:when test="${vo.category eq 5}">
			    	결제
			    </c:when>
			    <c:when test="${vo.category eq 6}">
			    	가맹 및 기타
			    </c:when>			    			    			    
		    </c:choose>

		    
		    
		    </li>
		    <li class="list-group-item">내용</li>
		    <li class="list-group-item">${vo.contents}</li>
		  </ul>
		</div>

		<a href="./update?num=${vo.num}" type="button" class="col-1 btn btn-outline-success ">수정</a>
		<button class="btn btn-outline-success" type="submit">삭제</button>		


		</form>
		
</div>		
		<c:import url="../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
