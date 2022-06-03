<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<c:import url="../temp/header_script.jsp"></c:import>
<title>가게주문내역</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	.flex-nowrap a {
		color:white;
	}
	.title {
		color: gray!important;
		font-weight: bolder;
	}
	
</style>
</head>
<body>
	<div class="container-fluid">
		    <div class="row flex-nowrap">
		  <c:import url="../temp/shopHeader.jsp"></c:import> 

        <div class="col-6 py-3">
        <div class="row">
        	<h1>맥도날드 ${shopMaster.shopName}점, ${member.id}님</h1>
        </div>
      <table class="table table-hover">
	<thead>
		<tr class="table-primary">
			<th>Num</th>
			<th>결제번호</th>
			<th>구매자</th>
			<th>금액</th>
			<th>결제일자</th>
		</tr>	
	</thead>
	<tbody>
            <c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.deliNum}</td>
				<td><a href="./shopOrderDetail?deliNum=${vo.deliNum}" style="color: black; text-decoration: none;">${vo.payNum}</a></td>
				 <td>${vo.id}</td> 
				<td>${vo.totalPrice}원</td>
				<td>${vo.orderDate}</td>
			</tr>
		</c:forEach>  
	</tbody>
</table>
       		          </div> 
        </div>
    </div>

</body>
</html>