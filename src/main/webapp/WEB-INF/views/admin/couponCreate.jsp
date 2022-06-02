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
<style type="text/css">
 a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>

	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<div style="margin-top: 200px;"></div>
	
	<input id="couponId">
	<input id="number">
	
	<button id="createBtn">쿠폰생성</button>
	<button id="sendBtn">쿠폰발송</button>
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	<div class="d-flex" style="height: 2000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container">
					<div class="d-flex mb-3">
						<input hidden name="category" type="text" id="categoryResult" value="1">
						<span class="col-9  mt-5">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 개의</span> 쿠폰이 검색되었습니다.</legend>
						</span>
						<span class="col-2 mt-5"  style="margin-right:10px;">
							<input id="admin_coupon_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1 mt-5">
							<button class="btn btn-outline-success rounded-pill" id="admin_coupon_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					
					
					<div>
						
					</div>
					
					
					<div id="adminCouponListReusult">
						
					</div>	
				</div>
			</div>
		</div>
	</div>
	<div style="height: 1500px; width: 4000px;"></div>
<div style="margin-bottom: 200px;"></div>






<!-- Modal -->
<div class="modal  fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" id="modalHideX" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default2">쿠폰명　</span>
				  </div>
				  <input type="text" id="couponName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default3">할인가격</span>
				  </div>
				  <input type="text" id="couponDis" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default4">쿠폰기간</span>
				  </div>
				  <input type="text" id="couponValiTerm" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave" class="btn btn-primary">Add</button>
      </div>
    </div>
  </div>
</div>


<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/couponCreate.js"></script>
</body>
</html>