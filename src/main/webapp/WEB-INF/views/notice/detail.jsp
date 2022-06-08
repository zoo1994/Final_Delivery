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
<div class="my-4" style="text-align: center; position: relative;">
	<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;">
	<div class="inner">
		<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">공지사항</h1>
	</div>
</div>

<div class="container justify-content-center"  style="width: 1000px;">

		<form action="./delete" method="post">
		<input type="hidden" name="num" value="${vo.num}">
		<div class="card" style="min-height: 700px;"><!--  style="width: 18rem;" -->
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item" style="font-weight: bold;">제목</li>
		    <li class="list-group-item">${vo.title}</li>
		    <li class="list-group-item" style="font-weight: bold;">작성자</li>
		    <li class="list-group-item">${vo.id}</li>
		    <li class="list-group-item" style="font-weight: bold;">내용</li>
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
			<div class="btnArea" style="">
				<div class="row" style="margin-top: 20px; justify-content: end;">
					<span class="col-4"></span>
					<span class="col-3"></span><!-- display:flex; position:relative;   -->
					<span class="col-2" style="line-height: 70px;">
						<input type="hidden" id="eventNum1" value="51">	
		  				<input type="hidden" name="eventNum" id="eventNum" value="51">
		  				<a href="./update?num=${vo.num}" class="updateBtn btn btn-success" style="margin: 0 auto; font-weight: 500; width: 45%;">
		  					수정
		  				</a>
						<button style="margin: 0 auto; font-weight: 500; width: 45%;" type="submit" class="deleteBtn btn btn-danger">
						  	삭제
						</button>				  	
					</span>
					<span class="col-2" style="background-color: #ffbc0d; color: black; text-align: center; font-weight:bold; width: 100px; height: 30px; border-radius: 70px; margin-right: 10px; min-width: 172px; height: 70px; align-content: center; line-height: 70px;">
						<a href="./list" role="button" class="btnMC btnM">
							<span>목록보기</span>
						</a>
					</span>
				</div>
			</div>
		</c:if>

		</form>
		
</div>		
<c:import url="../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
