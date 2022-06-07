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
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
	
	<div class="d-flex" style="min-height : 1000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container" style=" margin-bottom: 200px;">
					<div class="d-flex mb-3">
						<input hidden name="category" type="text" id="categoryResult" value="1">
						<span class="col-9  mt-5">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 명의</span> 회원이 검색되었습니다.</legend>
						</span>
						<span class="col-2 mt-5"  style="margin-right:10px;">
							<input id="admin_member_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1 mt-5">
							<button class="btn btn-outline-success rounded-pill" id="admin_member_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>
					<div id="adminMemberListReusult">
						
					</div>
				
				

					
					
					
					
				</div>
			</div>
		</div>
	</div>
	<div style=""></div>
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
      <div class="modal-body text-center" style="margin: 50px auto;">
      		<div>
	      		<div class="text-start">아이디 : <span id="modal_memberID"></span> </div>
	      		<div class="text-start">이름 : <span id="modal_memberNAME"></span></div>
		        <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <label class="input-group-text" for="inputGroupSelect01">회원등급</label>
				  </div>			  
				  <select class="custom-select" id="inputGroupSelect01">
				    <option>선택하세요</option>
				    <option name="options" value="2">일반회원</option>
				    <option name="options" value="1" selected>점주회원</option>
				    <option name="options" value="0">관리자</option>
				  </select>
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript">
 
</script>
<script src="../resources/js/adminMemberList.js"></script>
</body>
</html>