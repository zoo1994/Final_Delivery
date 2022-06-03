<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../temp/deli_header.jsp"></c:import>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<div class="container mt-1">
		<h1>Order</h1>
		<form action="./order" method="post">
			<div class="row">
				<div class="col-8 border rounded">

					<input type="hidden" name="id" id="id" value="${member.id}">
					<input type="hidden" name="name" id="name" value="${member.name}">
					<div class="align-items-center my-4" style="border-bottom: solid 2px; background-color: #f1f1f1;">
					<h5>주소</h5>
					</div>
					<input type="text" class="form-control mb-1" readonly id="postcode" name="postcode"
						value="${postcode}" style="width: 200px"> <input
						type="text" class="form-control" readonly id="address"
						name="address" value="${location} ${detailLocation}"> 
						
						<div class="align-items-center my-4" style="border-bottom: solid 2px; background-color: #f1f1f1;">
						<h5>전화번호</h5>
						</div>
						 <input class="form-control my-2"
						name="phone" id="phone" type="text" value="${member.phone}"
						style="width: 200px;"> 
						<div class="align-items-center my-4" style="border-bottom: solid 2px; background-color: #f1f1f1;">
						<h5>이메일</h5>
						</div>
						<input type="text" class="form-control" style="width: 50%" name="email"
						id="email" value="${member.email}"> 
						<div class="align-items-center my-4" style="border-bottom: solid 2px; background-color: #f1f1f1;">
						<h5>요청사항</h5>
						</div>
					<textarea class="form-control" id="request" name="request"
						cols="100%"></textarea>

					<div class="align-items-center my-4" style="border-bottom: solid 2px; background-color: #f1f1f1;">
						<h5>쿠폰 선택</h5>
						</div>
					<c:choose>
						<c:when test="${not empty coupon}">
								<div>
									<div class="row border rounded m-2">
							<c:forEach items="${coupon}" var="cp">
										<div class="col-sm-4 my-2">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title" id="couponName${cp.num}">${cp.couponVO.couponName}</h5>
													<p class="card-text" id="discount${cp.num}">${cp.couponVO.discount} </p>
													<p class="card-text">${cp.downDate} </p>
													<input type="checkbox" id="check${cp.num}" hidden="">
													<input type="hidden" id="couponNum${cp.num}" value="${cp.couponNum}">
													<button type="button" style="width: 100px" class="btn btn-primary couponButton" data-num="${cp.num}">선택</button>
												</div>
											</div>
										</div>
							</c:forEach>
									</div>
								</div>
						</c:when>
						<c:otherwise>
							<div id="coupon"
								class="d-flex justify-content-center align-items-center border rounded"
								style="height: 200px">
								<h3 class="d-flex align-items-center" style="display: block;">사용
									가능한 쿠폰이 없습니다.</h3>
							</div>
						</c:otherwise>
					</c:choose>

				</div>

				<div class="col-1"></div>
				<div class="col-3 border">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">메뉴명</th>
								<th scope="col">단가</th>
								<th scope="col">수량</th>
								<th scope="col">금액</th>
							</tr>
						</thead>
						<tbody id="receiptBody">
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
					<c:forEach items="${list}" var="cart">
						<input type="hidden" name="menuNum" value="${cart.menuNum}">
						<input type="hidden" name="shopNum" value="${cart.shopNum}">
						<input type="hidden" name="orderCount" value="${cart.count}">
						<input type="hidden" name="menuPrice" class="hiddenPrice" value="${cart.totalPrice}">
					</c:forEach>
					
					<div id="priceContainer"></div>
					<div id="discountContainer"></div>
					
					<button type="button" class="btn btn-warning mt-4"
						id="check_module" style="width: 100%">결제하기</button>
				</div>
			</div>

		</form>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script src="../js/cart.js"></script>
	<script src="../js/order.js">
		
	</script>

</body>
</html>
