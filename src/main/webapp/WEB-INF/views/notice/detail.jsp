<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title }</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
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
		    <li class="list-group-item">내용</li>
		    <div class="container">
			<div style="padding: 0 25%;">
				<img style="width: 100%" alt="" src="../resources/upload/notice/${vo.noticeFilesVO.fileName}">
			</div>
		</div>
		<%--     <c:forEach items="${vo.filesVO}" var="i">
		    	<img src="/resources/upload/notice/${i.fileName}" class="img-thumbnail" alt="...">
		    </c:forEach> --%>
		    <li class="list-group-item">${vo.contents}</li>
		  </ul>
		</div>
		<c:if test="${member.userType == 0}">
			<a href="./update?num=${vo.num}" type="button" class="col-1 btn btn-outline-success ">수정</a>
			<button class="btn btn-outline-success" type="submit">삭제</button>		
		</c:if>

		</form>
		
</div>		
<c:import url="../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
