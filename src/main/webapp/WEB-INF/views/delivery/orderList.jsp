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
	<div class="container mt-3">

		<table class="table">
			<thead>
				<tr>
					<th scope="col" width="10%">주문번호</th>
					<th scope="col" width="60%">결제번호</th>
					<th scope="col" width="20%">금액</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="vo">
					<tr>
						<th scope="row">${vo.deliNum}</th>
						<td><a href="./orderDetail?deliNum=${vo.deliNum}"> ${vo.payNum} </a></td>
						<td>${vo.totalPrice}</td>
						<td>${vo.orderDate}</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
		<c:if test="${empty list}">
		<div class="border rounded d-flex justify-content-center align-items-center" style="width: 100%; height: 300px;">
			<h1>결제내역이 없습니다.</h1>
		</div>
		</c:if>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						href="./orderList?pn=${pager.pre?pager.startNum-1:1}">&lt;</a></li>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link"
							href="./orderList?pn=${i}">${i}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="./orderList?pn=${pager.next? pager.lastNum+1:pager.lastNum}">&gt;</a></li>
				</ul>
			</nav>
		</div>

	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>