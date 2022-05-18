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
<%-- <form action="./delete" method="post">
<input type="hidden" name="eventNum" value="${vo.eventNum}">

 <a href="./update?eventNum=${vo.eventNum}" type="button" class="col-1 btn btn-outline-success ">수정</a>
  <button class="btn btn-outline-success" type="submit">삭제</button>
  </form> --%>
  
  
<div id="container">
	<div class="content">			
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<div class="my-4" style="text-align: center; position: relative;">
					<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;" >
					<div class="inner">
						<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">프로모션</h1>
					</div>
				</div>	
				
				
				
				<div class="container" style="margin-top: 100px;">
					<div class="d-flex mb-5" style="border-bottom: 5px solid; ">
						<span class="col-1"></span>
							<span class="col-8 mb-4">
								${vo.title}
							</span>
						
						<span class="date col-2" style="display:flex; position:relative;  justify-content: center; height: 50px;">
							<em><b class="hide">등록일 :</b>${vo.regDate}</em> 
						</span>	
						<span class="date col-1" style="display:flex; position:relative;  justify-content: center; height: 50px;">
							<em><b class="hide">조회수 :</b>${vo.hit}</em>
						</span>
					</div>
					<div class="">
						<article class="bbsCon">
							<div class="bannerImg" style="text-align: center;">
							    <c:forEach items="${vo.filesVO}" var="i">
							    	<img src="/resources/upload/board/event/${i.fileName}" class="img-thumbnail" alt="...">
							    </c:forEach>
							    <li class="list-group-item">${vo.contents}</li>
							</div>
						</article>
					</div>
					<div class="btnArea" style="border-top: 5px solid; margin-top: 50px;">
						<div class="row" style="margin-top: 50px;">
						<span class="col-4"></span>
						<span class="col-4"></span>
						<span class="col-4" style="text-align: center;"><a href="./list" role="button" class="btnMC btnM"><span>목록보기</span></a></span>
						</div>
					</div>
				</div>
				
				
				
																										
			</div>
		</div>
		<!-- //contArea -->
	</div>			
</div>  
  
  
  
  
<c:import url="../../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>