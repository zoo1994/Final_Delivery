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
	<!-- <div style="margin-top: 200px;"></div> -->
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
	
	<div class="d-flex" style="min-height: 1000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container" style=" margin-bottom: 200px;">
				
					<div>
						<p class="" style="padding-bottom: 20px; padding-top: 40px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
							쿠폰생성
						</p>	
						<div class="d-flex mb-3">
							<input hidden name="category" type="text" id="categoryResult" value="1">
							<span class="col-9">
								<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 개의</span> 쿠폰이 검색되었습니다.</legend>
							</span>
							<span class="col-2"  style="margin-right:10px;">
								<input id="admin_coupon_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
							</span>
							<span class="col-1">
								<button class="btn btn-outline-success rounded-pill" id="admin_coupon_search_btn"  style="width: 80px;" type="submit">검색</button>
							</span>
						</div>
						<div id="adminCouponListReusult">
							
						</div>	
					</div>
					<div>
						<p class="" style="padding-bottom: 20px; padding-top: 40px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
							쿠폰발급
						</p>	
 						<div class="d-flex mb-3">
							
							<span class="col-9">
								<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count1"></span> 개의</span> 쿠폰이 검색되었습니다.</legend>
							</span>
							<span class="col-2"  style="margin-right:10px;">
								<input id="couponIssuance_search" class="form-control me-2 rounded-pill" type="search" name="search1" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList1();}" placeholder="Search" aria-label="Search">
							</span>
							<span class="col-1">
								<button class="btn btn-outline-success rounded-pill" id="couponIssuance_search_btn"  style="width: 80px;" type="submit">검색</button>
							</span>
						</div>
						<div id="couponIssuanceListReusult">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style=""></div>
<!-- <div style="margin-bottom: 200px;"></div> -->






<!-- Modal -->
<div class="modal  fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">쿠폰생성</h5>
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
				  <input type="text" id="couponDis" onkeypress='return checkNumber(event)' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default4">쿠폰기간</span>
				  </div>
				  <input type="text" id="couponValiTerm" onkeypress='return checkNumber(event)' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave" class="btn btn-primary">생성</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 2 - coupon issuance -->
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">쿠폰발급</h5>
        <button type="button" id="modalHideX2" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
      		
      		
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default5">쿠폰ID　</span>
				  </div>
				  <input type="text" id="couponId" onkeypress='return checkNumber(event)' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div id="couponId_error" style="margin-left: 60px;"></div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default6">발급갯수</span>
				  </div>
				  <input type="text" id="count" onkeypress='return checkNumber(event)' class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default7">발급사유</span>
				  </div>
				  <input type="text" id="couponDetail" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide2" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave2" class="btn btn-primary">발급</button>
      </div>
    </div>
  </div>
</div>


<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript">



</script>
<script src="../resources/js/adminCouponList.js"></script>
<script src="../resources/js/adminCouponIssuanceList.js"></script>
</body>
</html>