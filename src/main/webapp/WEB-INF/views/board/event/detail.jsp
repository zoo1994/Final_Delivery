<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">
<title>${vo.title}</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>

<input hidden id="member" value="${member.id}">
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
						
						<span class="date col-2" style="display:flex; position:relative;  justify-content: end; height: 50px;">
							<em><b class="hide"></b>${vo.regDate}</em> 
						</span>	
						<span class="date col-1" style="display:flex; position:relative;  justify-content: center; height: 50px;">
							<em><b class="hide"></b>${vo.hit}</em>
						</span>
					</div>
					<div class="">
						<article class="bbsCon">
							<div class="bannerImg" style="text-align: center;">
							    <c:forEach items="${vo.filesVO}" var="i">
							    	<img src="/resources/upload/board/event/${i.fileName}" class="img-thumbnail" alt="...">
							    </c:forEach>
							    <div></div>
							    
							    <c:choose>
							    	<c:when test="${compare != null}">
							    		<input id="eventScheduleCompare" value="${compare}" hidden>
							    	</c:when>
							    	<c:otherwise>
							    		<input id="eventScheduleCompare" value="" hidden>
							    	</c:otherwise>
							    </c:choose>
							    
								<c:if test="${vo.ecVO.couponId != null}">
									<div class="" style=" display:inline-block; width: 30%; min-width:300px; min-height: 180px; border: rgb(224,228,232) solid 2px; line-height: 66px; border-radius :5px; ">
										<div class="d-flex justify-content-around" style="line-height: 60px;">
											<input hidden id="couponId" value="${vo.couponVO.couponId}">
											<strong style="width: 50%; text-align: left; margin: 0 20px; ">${vo.couponVO.couponName}</strong>
<%-- 											<c:set var="oneDayAfter" value="<%=new Date(60*60*24*1000*1)%>"/>
 											<fmt:formatDate value="${vo.ecVO.eventSchedule}" pattern="EEE MMM d HH:mm:ss Z yyyy" var="oneDayAfterStr"/>
											<div style="border: 1px solid;">${oneDayAfterStr},${oneDayAfter}</div>		 
											<c:if test="${vo.ecVO.eventSchedule != null}"></c:if> --%>									
											<div>~${vo.ecVO.eventSchedule}</div><!-- 이벤트 스케줄러 -->
										</div>
										<div class="d-flex justify-content-start mb-4" style="">
											<div style="display: block; text-align:left; line-height: 33px;">
												<p style=" margin: -10px 25px;">할인금액 : ${vo.couponVO.discount}원</p>
												<p style=" margin: -10px 25px;">유효기간 : ${vo.couponVO.activeDate}일 (발급날로 부터) </p>
												
											</div>

										</div>
										<div class="d-flex justify-content-end">								
											<button id="couponClick" class="btn btn-light" style="margin: 0 25px; border: 1px solid rgb(221,59,74); color: rgb(221,59,74);">발급받기</button>
										</div>
									</div>
								</c:if>	
								
								<c:if test="${vo.contents != '　'}">
									<li class="list-group-item">${vo.contents}</li>
								</c:if>
							    
							</div>
						</article>
					</div>
					<div class="btnArea" style="border-top: 5px solid; margin-top: 50px;">
						<div class="row" style="margin-top: 30px; justify-content: end;">
						<span class="col-4"></span>
						<span class="col-3"></span><!-- display:flex; position:relative;   -->
						<span class="col-2" style="line-height: 70px;">
						<input type="hidden" id="eventNum1" value="${vo.eventNum}">
							<c:if test="${member.userType == 0}">
					  			<!-- Button trigger modal -->
					  			<form action="./update" method="get" style="display: inline-block;">
					  				<input type="hidden" name="eventNum" id="eventNum" value="${vo.eventNum}">
						  			<button style="margin: 0 auto; font-weight: 500;"  type="submit" id="eventDetailUpdateBtn" class="updateBtn btn btn-success">
									  	수정
									</button>					<!--   onclick="javascript:{getDeleteBtn();}" -->
					  			</form>
								<button style="margin: 0 auto; font-weight: 500;" type="button" id="eventDetailDeleteBtn" class="deleteBtn btn btn-danger">
								  	삭제
								</button>
						  	</c:if>
						</span>
						<span class="col-2" class="rounded-pill" style="background-color: #ffbc0d; color: black; text-align: center; font-weight:bold; width: 100px; height: 30px; border-radius: 70px; margin-right: 50px; min-width: 172px; height: 70px; align-content: center; line-height: 70px;"><a href="./list" role="button" class="btnMC btnM"><span>목록보기</span></a></span>
						</div>
					</div>
				</div>
																	
			</div>
		</div>
	</div>			
</div>  
  
<c:import url="../../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/eventDetail.js"></script>
</body>
</html>