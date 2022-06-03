<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<button type="button" class="btn btn-info addBtn">새로운 배너 이미지 추가</button>
<h3>현재 배너 파일</h3>
<c:choose>
	<c:when test="${not empty list}">
	<div class="imgContainer row">
		<c:forEach items="${list}" var="vo" varStatus="i">

				<%-- <h6>${i.index+1}번째 이미지</h6>
				<div>
					<img alt="" src="../upload/banner/${vo.fileName}" style="width:200px; height:200px;">
				</div> --%>
				<div class="card col-2" style="width: 18rem;">
				  <img src="../upload/banner/${vo.fileName}" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${i.index+1}번째 이미지</h5>

				</div>
							
			</div>
		</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		현재 파일 없음
	</c:otherwise>	
</c:choose>

		<form action="./bannerAdd" method="post" enctype="multipart/form-data">
	<div class="fileResult col-4">
					
	</div>
		<c:if test="${fn:length(list) ne 5}">
		<button type="submit" class="btn btn-success">추가</button>
		</c:if>
		</form>
	
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
</script>
