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
					<th scope="col" width="40%">메뉴명</th>
					<th scope="col">단가</th>
					<th scope="col" width="20%">개수</th>
					<th scope="col" width="20%">금액</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="vo">
					<tr>
						<th scope="row">${vo.menuVO.menuName}</th>
						<td> ${vo.menuVO.price} </td>
						<td>${vo.orderCount}</td>
						<td class="menuPrice">${vo.menuVO.price * vo.orderCount}</td>
					</tr>
				</c:forEach>

			</tbody>
			
			<tfoot>
				<tr>
					<td>총액</td>
					<td></td>
					<td></td>
					<td id="totalPrice"></td>
				</tr>
			</tfoot>
		</table>


	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script type="text/javascript">
		getPrice();
		function getPrice(){
			let price = 0;
			$(".menuPrice").each(function(idx,item){
				console.log(item.innerHTML);
				price = price+Number(item.innerHTML);
			})
			$("#totalPrice").html(price);
		}
	
	</script>
</body>
</html>