<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
 a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

.strongColor {
	background-color: rgb(240,145,0);
}

</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
<input hidden id="faqId" value="${member.id}">
<div id="container">
	<div class="content">			
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<div class="my-4" style="text-align: center; position: relative;">
					<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;" >
					<div class="inner">
						<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">자주 묻는 질문</h1>
					</div>
				</div>
				
				
				
				
				<div class="container">
				
					<div id="categorySelect" class="mb-3">
						
						<table class="table" style="">
						  <tbody>
						    <tr style="border: hidden;">
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category1" autocomplete="off">
									<label id="category1" style="width: 100%; font-weight: bold;" class="btn btn-warning strongColor" for="category1">주문접수</label>		
								</td>
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category2" autocomplete="off">
									<label id="category2" style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category2">주문확인</label>		
								</td>
								<td class="col-4">
									<input style="width: 100%;" type="radio" class="btn-check" name="category" id="category3" autocomplete="off">
									<label id="category3" style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category3">주문취소/변경</label>		
								</td>
						    </tr>
						    <tr style="border: hidden;">
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category4" autocomplete="off">
									<label id="category4" style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category4">서비스 이용</label>		
								</td>
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category5" autocomplete="off">
									<label id="category5" style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category5">결제</label>			
								</td>
								<td>
									<input style="width: 100%;" type="radio" class="btn-check" name="categorys" id="category6" value="6">
									<label id="category6" style="width: 100%; font-weight: bold;" class="btn btn-warning" for="category6">가맹 및 기타</label>			
								</td>		
								<!-- background-color:rgb(240,145,0); -->
						    </tr>
						  </tbody>
						</table>
					</div>
					<!-- <form class="d-flex mb-3" action="./list" method="get"></form> -->
					<div class="d-flex mb-3">
						<input hidden name="category" type="text" id="categoryResult" value="1">
						<span class="col-9">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 건의</span> 게시물이 있습니다.</legend>
						</span>
						<span class="col-2"  style="margin-right:10px;">
							<input id="faq_search" class="form-control me-2" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1">
							<button class="btn btn-outline-success" id="faq_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					<div id="faqResult">
					
<%--
					<div class="accordion" id="accordionExample" style="border-top: 1px solid black;">
						<c:forEach items="${list}" var="vo" varStatus="i">
			  				<div class="accordion-item" style="border-bottom: 1px solid black;">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button bg-light collapsed " style="font-weight: bold; background-color: rgb(190,194,199);" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i.count}" aria-expanded="false" aria-controls="collapseOne">
						        <span class="col-1" style="color: #da0000!important; text-align: center; font-weight: bold;">Q　　　</span> 
						        <span class="col-8">${vo.title}</span> 
						        <span class="col-1"></span>
						      </button>
						    </h2>
						    <div id="collapse${i.count}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						      <div class="accordion-body d-flex">
						        <span class="col-1" style="color: #fd7e14; text-align: center; font-weight: bold;">A　</span>
						        <span class="col-8">${vo.contents}</span>
						        <strong></strong> 
						      </div>
						    </div>
						  </div>
					  	</c:forEach>
					</div>
					

							<nav aria-label="Page navigation example mt-5 bs-warning" style="">
							<span class="col-2" style="display: inline-block;"></span>
							<span class="col-8" style="display: inline-block;">
							  <ul class="pagination justify-content-center" style="display: flex; width: 90%; margin: 0 auto;">
							  	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}"><<</a></li>
							  	<c:if test="${pager.pre}">
							    	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}">prev</a></li>
							    </c:if>
							   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							   	</c:forEach>
							    <c:if test="${pager.next}">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">next</a></li>
							    </c:if>
							    <li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">>></a></li>
							  </ul> 
							  </span> 
							  <span class="col-2" style="display: inline-block; text-align: end; width: 15%;"><a href="./add" class="btn btn-primary" style="display: inline-block; ">ADD</a></span>
							</nav> --%>
					</div>
				</div>																				
			</div>
		</div>
		<!-- //contArea -->
	</div>			
</div>
<div style="margin-bottom: 200px;"></div>
<script src="../resources/js/faqList.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
