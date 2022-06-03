<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
		<div class="d-flex" style="height: 2000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container-fluid">
					<div class="row">
					<div class="col-1 mt-4">
						<button type="button" class="btn btn-primary addBtn" id="fileAdd">새로운 배너 이미지 추가</button>
					<!-- 	<button type="button" class="btn btn-warning" id="fileUpdate">배너 변경</button> -->
					</div>
					<div class="col-11 bannerResult mt-4" >
						<h4>현재 적용된 배너 이미지</h4>
					<c:choose>
	<c:when test="${not empty list}">
	<div class="imgContainer row">
		<c:forEach items="${list}" var="vo" varStatus="i">

				<%-- <h6>${i.index+1}번째 이미지</h6>
				<div>
					<img alt="" src="../upload/banner/${vo.fileName}" style="width:200px; height:200px;">
				</div> --%>
				<div class="card col-2 mx-2 my-2" style="width: 18rem;">
				  <img src="../resources/upload/banner/${vo.fileName}" class="card-img-top" style="height:120px;">
				  <div class="card-body">
				    <h5 class="card-title">${i.index+1}번째 이미지</h5>
					<button type="button" class="del btn btn-danger" data-num="${vo.fileNum}" data-name="${vo.fileName}">이미지 삭제</button>
				</div>
							
			</div>
		</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		현재 파일 없음
	</c:otherwise>	
</c:choose>


					<div class="row">
							<form action="./bannerAdd" method="post" enctype="multipart/form-data">
	<div class="fileResult col-4">
					
	</div>
		<c:if test="${fn:length(list) ne 5}">
		<button type="submit" class="btn btn-success">INSERT</button>
		</c:if>
		</form>
					</div>
					</div>
					</div>
					
				</div>
			</div>
		</div>
		</div>
<script type="text/javascript">

	
	let count = 0;
	if(${fn:length(list) != 0}) {
		count = ${fn:length(list)};
	}
	
	console.log(count);
	$(".addBtn").click(function() {
		if(count>4) {
			alert("최대 5개까지만 추가 가능합니다.");
			return;
		}
		let result = '<div class="input-group mb-2">';
		result = result + '<input name="files" type="file" class="form-control files" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">'
		result = result + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>'
		result = result + '</div>';
		$(".fileResult").append(result);
		count++;
	});
	
	$(".fileResult").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	} );
	
	$(".del").click(function() {
		let check = window.confirm("삭제하면 복구가 불가능합니다. 삭제하시겠습니까?")
		if (check) {
			let fileNum = $(this).attr("data-num");
			let fileName = $(this).attr("data-name");
			let select = $(this)
			console.log(select);
		 	$.ajax({
				type: "post",
				url: "./fileDelete",
				data: {
					fileNum: fileNum,
					fileName : fileName
				},
				success: function(data) {
					if (data.trim() == '1') {
						select.parent().parent().remove();
						alert("배너 이미지가 삭제되었습니다.");
						count--;
					} else {
						alert("파일 삭제 실패");
					}
				},
				error: function() {
					alert("파일 삭제 실패")
				}
			}); 
		}
	});
</script>
</body>
</html>