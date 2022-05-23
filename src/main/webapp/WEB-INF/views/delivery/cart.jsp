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
					<div class="col-8 border rounded ">
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="checkAll"></th>
									<th scope="col"></th>
									<th scope="col">Menu</th>
									<th scope="col">Count</th>
									<th scope="col">Price</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="cart">
									<tr id="cart${cart.cartNum}">
										<th scope="row" data-num="${cart.cartNum}"><input
											type="checkbox" class="checkbox"></th>
										<td>
											<div style="width: 80px; height: 60px;">
												<img alt="${cart.menuVO.menuName}"
													src="../resources/upload/menu/${cart.menuVO.menuFileVO.fileName}"
													style="width: 80px; height: 60px; object-fit: cover;">
											</div>
										</td>
										<td>${cart.menuVO.menuName}</td>
										<td><input type="number" class="border cartCount"
											data-num="${cart.cartNum}" id="cartCount${cart.cartNum}"
											style="text-align: right" value="${cart.count}"></td>
										<td id="cartPrice${cart.cartNum}">${cart.totalPrice}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<button class="btn btn-danger" id="delete">삭제하기</button>

					</div>
					<div class="col-1"></div>
					<div class="col">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">메뉴명</th>
									<th scope="col">단가</th>
									<th scope="col">수량</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="cart">
									<tr id="receipt${cart.cartNum}">
										<th scope="row">${cart.menuVO.menuName}</th>
										<td data-num="${cart.cartNum}" id="price${cart.cartNum}">${cart.menuVO.price}</td>
										<td id="receiptCount${cart.cartNum}">${cart.count}</td>
										<td id="receiptPrice${cart.cartNum}" class="count">${cart.totalPrice}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td>총 금액</td>
									<td></td>
									<td></td>
									<td id="pay"></td>
								</tr>
							</tfoot>
						</table>
						<a href="./order" class="btn btn-success" style="width: 100%">주문하기</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>



	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script src="../js/cart.js"></script>

</body>
</html>
