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
	<div class="container">
		<h1>Cart</h1>
		<c:choose>
			<c:when test="${empty list}">
				<div
					class="d-flex justify-content-center align-items-center border rounded"
					style="height: 400px">
					<h1 class="d-flex align-items-center" style="display: block;">상품이
						없습니다.</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${list}" var="cart">
						<div class="col-8 border rounded" style="height: 100px">
							<div> <img alt="메뉴이미지" src="" style="height: 90px; width: 90px"> </div>
						</div>
					</c:forEach>
					<div class="col-1"></div>
					<div class="col border"></div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>



	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>
