<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<c:import url="../temp/deli_header.jsp"></c:import>
	<h1>Delivery</h1>
	<div class="row">
		<p>∘ ${list.size()} Products</p>
	</div>
	<div class="row menuResult">
	  	<div class="row mt-4 justify-content-left">
			<c:forEach items="${list}" var="vo">
		
				<div class="card col-3 detail mx-5 mb-3" data-num="${vo.menuNum}">
				  <img src="../resources/upload/menu/${vo.menuFileVO.fileName}" class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">${vo.menuName}</p>
				    <p class="card-text">${vo.menuEng}</p>
				    <c:if test="${not empty member}">
				    <button class="btn btn-success">카트에 담기</button>
				    </c:if>
				  </div>
				</div>
			
			</c:forEach>
			 
			
		</div> 
		
	</div>
		<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
<!-- 	<script type="text/javascript">
		$('.cartAdd').click(function(){
			let menuNum = 
			$.ajax({
				method:'POST',
				url:'./cartAdd',
				data:{
					menuNum:menuNum;
				},
				success:function(data){
					if(data.trim()=='1'){
						alert("상품을 장바구니에 추가했습니다.");
					}
				},
				error:function(){
					alert("다시 시도해주세요.");
				}
				
			})
		})
	</script> -->
</body>
</html>
