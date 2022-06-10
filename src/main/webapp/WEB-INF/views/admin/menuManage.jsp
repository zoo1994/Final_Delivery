<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<style type="text/css">
 a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}

.menuClick {
cursor:pointer;
}

thead tbody {
	text-align: center;
}




</style>
<link rel="stylesheet" href="../css/tableRadius.css" />
</head>
<body>

	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
	<div class="container">
	<div class="row mt-4"> 
	
		<p class="fs-3 fw-bolder">메뉴 관리</p>
	</div>
	
	<!-- 검색 창 -->
		<div class="row mb-4 searchForm">
			<form action="./menuManage" method="get" class="d-flex">

				<select name="kind" class="col-1 me-1">
					<option value="col1">메뉴이름</option>
					<option value="col2">메뉴설명</option>
				</select> 
				<input type="search" name="search" value="${pager.search}" placeholder="검색어를 입력하세요." class="col-2 me-2">
				<button type="submit" class="btn btn-outline-success">Search</button>

			</form>
		</div>
	<div class="row">

<table class="table table-hover">
	<thead>
		<tr class="table-warning">
			<th class="col-1">Num</th>
			<th class="col-1">카테고리</th>
			<th class="col-3">메뉴이름</th>
			<th class="col-1">가격</th>
			<th class="col-2">판매상태</th>
			<th class="col-2">변경</th>
		</tr>	
	</thead>
	<tbody>
 		 <c:forEach items="${list}" var="vo" varStatus="i">
			<tr title="자세히 보기" class="menuClick">
				<td>${vo.menuNum}</td>
				<td>
					<c:choose>
						<c:when test="${vo.category eq 1}">버거</c:when>
						<c:when test="${vo.category eq 2}">맥런치</c:when>
						<c:when test="${vo.category eq 3}">맥모닝</c:when>
						<c:when test="${vo.category eq 4}">해피스낵</c:when>
						<c:when test="${vo.category eq 5}">사이드&디저트</c:when>
						<c:when test="${vo.category eq 6}">맥카페&음료</c:when>
						<c:otherwise>해피밀</c:otherwise>
					</c:choose>
				
				</td>
				<td class="detail" data-num="${vo.menuNum}">${vo.menuName}</td>
				<td>${vo.price}원</td>	

				<td>
					<div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="1" id="saleOn" <c:if test="${vo.menuSale eq 1}">checked</c:if>>
							  <label class="saleOn" for="flexRadioDefault1">
							    판매중
							  </label>
						</div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="0" id="saleOff" <c:if test="${vo.menuSale eq 0}">checked</c:if>>
							  <label class="saleOff" for="flexRadioDefault2">
							    판매중지
							  </label>
						</div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="2" id="seasonOff" <c:if test="${vo.menuSale eq 2}">checked</c:if>>
							  <label class="seasonOff" for="flexRadioDefault2">
							    단종
							  </label>
						</div>
						</div>
				</td>
				<td>
					<button type="button" class="btn btn-success updateBtn" data-num="${vo.menuNum}">변경</button>
					<button type="button" class="btn btn-danger deleteBtn" data-num="${vo.menuNum}">삭제</button>
				</td>
			</tr>
		</c:forEach>  
	</tbody>
</table>
			<div class="d-flex justify-content-center">
               <nav aria-label="Page navigation example">
                  <ul class="pagination">
                     <li class="page-item"><a class="page-link"
                        href="./menuManage?pn=${pager.pre?pager.startNum-1:1}&kind=${kind}&search=${search}">&lt;</a></li>
                     <c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
                        var="i">
                        <li class="page-item"><a class="page-link"
                           href="./menuManage?pn=${i}&kind=${kind}&search=${search}">${i}</a></li>
                     </c:forEach>

                     <li class="page-item"><a class="page-link"
                        href="./menuManage?pn=${pager.next? pager.lastNum+1:pager.lastNum}&kind=${kind}&search=${search}">&gt;</a></li>
                  </ul>
               </nav>
            </div>
	
		<div class="col-2">
			<a href="../menu/add" type="button" class="btn btn-primary">메뉴 추가</a>
		</div>

	</div>
</div>
<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../js/menu.js"></script>
</body>
</html>