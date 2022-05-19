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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<input id="admin_shop_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1 mt-5">
							<button class="btn btn-outline-success rounded-pill" id="admin_shop_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					<div id="adminShopListReusult">
						
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
        <h5 class="modal-title" id="exampleModalLabel">추가하기</h5>
        <button type="button" id="modalHideX" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default1">점주</span>
				  </div>
				  <input type="text" id="shop_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default2">매장이름</span>
				  </div>
				  <input type="text" id="shop_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default3">매장위치</span>
				  </div>
				  <input type="text" id="shop_location" class="form-control"  readonly="readonly" placeholder="도로명 주소" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				  <input class="col-2 btn btn-outline-success dropdown-toggle" type="button" id="addBtn" data-bs-toggle="dropdown" aria-expanded="false" onclick="showPostcode()" value="주소변경">
				  <span id="guide" style="color: #999; display: none"></span>
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default4">매장전화번호</span>
				  </div>
				  <input type="text" id="shop_phone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
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

 <!-- Modal2 -->
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
        <button type="button" id="modalHideX2" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default11">매장번호</span>
				  </div>
				  <input readonly type="text" id="shopNum2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default22">점주　　</span>
				  </div>
				  <input type="text" id="shop_id2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default33">매장이름1</span>
				  </div>
				  <input type="text" id="shop_name2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default3">매장위치</span>
				  </div>
				  <input type="text" id="shop_location2" class="form-control"  readonly="readonly" placeholder="도로명 주소" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				  <input class="col-2 btn btn-outline-success dropdown-toggle" type="button" id="addBtn" data-bs-toggle="dropdown" aria-expanded="false" onclick="showPostcode1()" value="주소변경">
				  <span id="guide1" style="color: #999; display: none"></span>
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default55">전화번호</span>
				  </div>
				  <input type="text" id="shop_phone2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
<!-- 				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default666">오픈여부</span>
				  </div>
				  <input type="text" id="shop_sale2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default777">운영여부</span>
				  </div>
				  <input type="text" id="shop_open2"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div> -->
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default66">오픈여부</span>
				  </div>
				  	<div class="form-control">
				  		<div style="display: inline-block; width: 20%">
				  			판매가능</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_sale2" value="1"  name="shop_sale2" aria-label="Radio button for following text input">				  		
				  		</div>
				  		<div style="display: inline-block; width: 20%">
				 		판매종료</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_sale2" value="0"  name="shop_sale2" aria-label="Radio button for following text input">
						</div>
				  	</div>
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default77">운영여부</span>
				  </div>
				  	<div class="form-control">
				  		<div style="display: inline-block; width: 20%">
				  		운영</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_open2" value="0" name="shop_open2" aria-label="Radio button for following text input">
				 		</div>
				 		<div style="display: inline-block; width: 20%">
				 		폐업</div><div style="display: inline-block; width: 20%"><input type="radio" class="shop_open2" value="1" name="shop_open2" aria-label="Radio button for following text input">				  		
				  		</div>
				  	</div>
				</div>				
				<!-- id="shopUpdateBtn${vo.shopNum}" data-id="${vo.id}" data-name="${vo.shopName}" data-location="${vo.location}" data-phone="${vo.shopPhone}" data-open="${vo.open}" -->
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide2" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave2" class="btn btn-primary">수정하기</button>
      </div>
    </div>
  </div>
</div>
<input type="hidden" id="postcode">
<input type="hidden" id="jibunAddress"> 
<input type="hidden"id="extraAddress">
<input type="hidden"id="detailAddress">
<input type="hidden"id="x_axis">
<input type="hidden"id="y_axis">

<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript">



</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a58574ac7b94ffdb63ca1f5c17c22c7&libraries=services"></script>
<script src="../resources/js/map2.js"></script>
<script src="../resources/js/map3.js"></script>
<script src="../resources/js/adminShopList.js"></script>
</body>
</html>