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
<title>점주페이지</title>
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
		<%-- <c:import url="../temp/ceoHeader.jsp"></c:import> --%>
        <div class="col py-3">
      <table class="table table-hover">
	<thead>
		<tr class="table-warning">
			<th>Num</th>
			<th>메뉴이름</th>
			<th>가격</th>
			<th>판매상태</th>
			<th>추가</th>
			<th>변경</th>
		</tr>	
	</thead>
	<tbody>
            <c:forEach items="${allMenuList}" var="vo">
			<tr>
				<td>${vo.menuNum}</td>
				<td class="detail" data-num="${vo.menuNum}">${vo.menuName}</td>
				<td>${vo.price}원</td>	

				<td>
				<c:choose>
					<c:when test="${vo.menuSale eq 1}">
						판매중
					</c:when>
					<c:otherwise>
						판매중지
					</c:otherwise>
				</c:choose>
				</td>
				<td>
					<button type="button" class="btn btn-outline-success" data-num="${vo.menuNum}">추가</button>
				</td>
				 <td>
					<select class="form-select" aria-label="Default select example">
					  <option value="1">판매중</option>
					  <option value="0">판매중지</option>
					</select>
				</td> 
			</tr>
		</c:forEach>  
	</tbody>
</table>
       
        </div>
    </div>
	
</body>
</html>