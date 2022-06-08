<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
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
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
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
							<input id="faq_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1">
							<button class="btn btn-outline-success rounded-pill" id="faq_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					<div id="faqResult">

					</div>
				</div>																				
			</div>
		</div>

	</div>			
</div>
<div style="margin-bottom: 200px;"></div>
<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/faqList.js"></script>
</body>
</html>
