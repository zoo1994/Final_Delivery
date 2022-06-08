<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="../css/notification.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
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
							이메일 알림
						</p>	
						<div class="d-flex mb-3">
							<input hidden name="category" type="text" id="categoryResult" value="1">
							<span class="col-7">
								<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 개의</span> 메일이 검색되었습니다.</legend>
							</span>
							<span class="col-1" style="margin-right:5px;">
								<c:if test="true"><!-- ${member.userType == 0} -->
						  			<!-- Button trigger modal -->
									<button style="margin: 0 auto; font-weight: 500;" type="button" id="modalBtn" data-name="" class="modalBtn btn btn-primary" data-toggle="modal" data-target="#modal">
									  메일발송
									</button>
								</c:if>
							</span>
							<span class="col-1" style="margin-right:5px;">
								<select id="admin_email_kind" name="kind" class="form-select" style="display: block;" aria-label="Default select example">
								  <option selected value="col1">수신자</option>
								  <option value="col2">제목</option>
								  <option value="col3">내용</option>
								</select>
							</span>
							<span class="col-2"  style="margin-right:10px;">
								<input id="admin_email_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getList();}" placeholder="Search" aria-label="Search">
							</span>
							<span class="col-1">
								<button class="btn btn-outline-success rounded-pill" id="admin_email_search_btn"  style="width: 80px;" type="submit">검색</button>
							</span>
						</div>
						<div id="adminEmailListReusult">
							
						</div>
					</div>
		
		
		
<!-- 					<div id="toDiv" style="cursor:text;" class="mInput_holder mInput_over" onclick="ccr(this, 'wrh.toaddress', event)">
                		<ul id="toUL" class="list_addrobj _droppable">
                			
							<li id="to$0" class="addressObj draggable">
								<div class="_addressObjView">

	
									<div class="addr_obj blue" style="border: 3px solid #cbe6ff;  background-color: #e5f3ff; display: inline-block;">				
										<span class="blue_email" title="">홍길동 &lt;honggildong@naver.com&gt;</span>
										<button style="border: 0; padding:0; background-color:#e5f3ff; ">
											<span class="material-symbols-outlined" style="font-size: 18px; color: rgb(147,181,213);">edit</span>
										</button>
										<button style="border: 0; padding:0; background-color:#e5f3ff; ">
											<span class="material-symbols-outlined" style="font-size: 18px; color: rgb(147,181,213);">close</span>										
										</button>
									</div>
									
					
 									<div class="addr_input">
										<input id="to$0_editInput" type="text" title="메일주소" value="" style="width:110px">
									</div>
									<span class="drag_guide"></span>
								</div>
							</li>
							
							<li id="to$1" class="addressObj draggable invalid">
								<div class="_addressObjView">
								
								
									<div class="addr_obj red" style="border: 3px solid #f8d5ce;  background-color: #fde3de; color: #d77965; display: inline-block;">				
										<span class="red_email" title="메일주소 형식이 올바르지 않습니다.">ab</span>
										<button style="border: 0; padding:0; background-color:#fde3de; ">
											<span class="material-symbols-outlined" style="font-size: 18px; color: #d77965;">edit</span>
										</button>
										<button style="border: 0; padding:0; background-color:#fde3de; ">
											<span class="material-symbols-outlined" style="font-size: 18px; color: #d77965;">close</span>										
										</button>
									</div>


								</div>
							</li>
	
							<li class="new_addr _addressObj" style="cursor:text;">
								<div class="" style="cursor:text;">																		
									<div class="addr_input">
										<label for="toInput" class="blind">d</label>
										<textarea id="toInput" autocomplete="toInput" style="width: 74px; border: 0px; overflow: hidden; resize: none; display: inline;" rows="1" tabindex="1" sn="" officer="" grouptype=""></textarea>
									</div>									
									<span class="drag_guide"></span>
									<div style="position:absolute;top:-1000px;left:-1000px;">
										<span id="toInputMeasure">mi</span>
									</div>
								</div>
							</li>
							
							
							
						</ul>
						<div class="btn_recentaddr">
							
							<a id="atcp_suggest_layer_show_to" class="on" href="#" onclick="if(!$Element(this).hasClass('on')){ccr(null, 'wrh.searchaddress', event);}else{ccr(null, 'wrh.closeaddr', event);}" title="최근 사용한 주소/중요 연락처"><img width="20" height="21" alt="최근 사용한 주소/중요 연락처" src="https://ssl.pstatic.net/static/pwe/nm/b.gif"></a>
						</div>
					</div>
					<textarea id="to" name="to" autocomplete="false" style="display:none;" title="받는사람"></textarea> -->
		
		
		
<!-- 					<div class="mb-3 container d-flex justify-content-around" style="height: 500px;">
						<div class="" style="position: relative; width: 40%; min-width:500px; border: 1px solid; background-color: #f8f9fa;">1</div>
						<div class="" style="position: relative;  width: 40%; min-width:500px; border: 1px solid; background-color: #f8f9fa; ">2</div>
					</div>	 -->				
				</div>
			</div>
		</div>
	</div>
	<div style=""></div>
<!-- Modal -->
<div class="modal  fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content" style="height: 100%; width: 1000px;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메일 발송</h5>
        <button type="button" id="modalHideX" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
      		
      		
      			<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" style="height: 100%;" id="inputGroup-sizing-default3">수신자</span>
				  </div>
				  <div type="text" class="form-control" style="padding: 0;" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				  	<input hidden id="receivers" value="">
				  	
				  	
				  	<div id="toDiv" style="cursor:text;" class="mInput_holder mInput_over" onclick="$(this).children().children().last().children().children().children().focus(); console.log('hi'); ">
                		　전체<input type="radio" class="receiver_type" name="receiver_type" value="all">
                		셀러<input type="radio" class="receiver_type" name="receiver_type" value="seller">
                		일반회원<input type="radio" class="receiver_type" name="receiver_type" value="user">
                		개별선택<input checked="checked" type="radio" class="receiver_type" name="receiver_type" value="select">
                		<ul id="toUL" class="list_addrobj _droppable" style="padding: 0;">
                			<input hidden id="edit">
                			
							<li class="new_addr _addressObj" style="cursor:text;">
								<div class="" style="cursor:text;">																		
									<div class="addr_input">
										<label for="toInput" class="blind"></label>
										<textarea id="toInput" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {getAddr_obj();closeKeywords();}" onclick="event.stopPropagation();" style="width: 74px; border: 0px; overflow: hidden; resize: none; display: inline;" rows="1" tabindex="1" sn="" officer="" grouptype=""></textarea>
									</div>									
									<span class="drag_guide"></span>
									<div style="position:absolute;top:-1000px;left:-1000px;">
										<span id="toInputMeasure"></span>
									</div>
								</div>
							</li>	
											
						</ul>

						<div class="keywords" id="keywords">
							
   						</div>
					</div>

				  </div>
				  
				  
				  
				</div>
      			
      			<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default2">제목　</span>
				  </div>
				  <input type="text" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
      		
      		
     			<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label" id="content"></label>
					<textarea path="contents" id="contents" cssClass="form-control"></textarea>
					<div>

					</div>
				</div>								
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave" class="btn btn-primary">발송</button>
      </div>
    </div>
  </div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/adminEmailList.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
	
<script type="text/javascript">
	//summernote
	$('#contents').summernote({
		height : 400
	});
</script>
<script src="../resources/js/footerNoMargin.js"></script>
</body>
</html>