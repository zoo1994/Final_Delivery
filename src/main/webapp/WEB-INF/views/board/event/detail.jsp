<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
<form action="./delete" method="post">
<input type="hidden" name="eventNum" value="${vo.eventNum}">
<div class="card" style="width: 18rem;">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">제목</li>
    <li class="list-group-item">${vo.title}</li>
    <li class="list-group-item">내용</li>
    <c:forEach items="${vo.filesVO}" var="i">
    	<img src="/resources/upload/board/event/${i.fileName}" class="img-thumbnail" alt="...">
    </c:forEach>
    <li class="list-group-item">${vo.contents}</li>
    <li class="list-group-item">작성자</li>
    <li class="list-group-item">${vo.id}</li>
  </ul>
</div>

 <a href="./update?eventNum=${vo.eventNum}" type="button" class="col-1 btn btn-outline-success ">수정</a>
  <button class="btn btn-outline-success" type="submit">삭제</button>
  </form>
<c:import url="../../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>