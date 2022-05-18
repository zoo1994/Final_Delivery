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
		<%--  <c:import url="../temp/ceoHeader.jsp"></c:import>  --%>
        <div class="col py-3">
        <div class="row">
        	<h1>${shopMaster.shopName}, ${member.id}님</h1>
        </div>
      <table class="table table-hover">
	<thead>
		<tr class="table-success">
			<th>Num</th>
			<th>메뉴이름</th>
			<th>가격</th>
			<th>판매상태</th>
			<th>변경</th>
		</tr>	
	</thead>
	<tbody>
            <c:forEach items="${allMenuList}" var="vo">
			<tr>
				<td>${vo.menuNum}</td>
				<td class="detail" data-num="${vo.menuNum}">${vo.menuVO.menuName}</td>
				<td>${vo.menuVO.price}원</td>	

				<%-- <td>
				<c:choose>
					<c:when test="${vo.sale eq 1}">
						판매중
					</c:when>
					<c:otherwise>
						판매중지
					</c:otherwise>
				</c:choose>
				</td>
 --%>
				 <td>
					<select id="menuSale" name="menuSale${vo.menuNum}" class="form-select menuSale${vo.menuNum}" aria-label="Default select example">
					  <option value="1" <c:if test="${vo.sale eq 1}">selected</c:if>>판매중</option>
					  <option value="0" <c:if test="${vo.sale eq 0}">selected</c:if>>판매중지</option>
					</select>
				</td> 
				
				<td>
					<button type="button" class="btn btn-outline-success updateBtn" data-num="${vo.menuNum}">변경</button>
				</td>
			</tr>
		</c:forEach>  
	</tbody>
</table>
       
        </div>
    </div>
<script type="text/javascript">
	$(".updateBtn").click(function() {
		let menuNum = $(this).attr("data-num");
		//console.log($('select[name='+menuSale+'] option:selected').val()); 확인		
		let txt = 'menuSale'+menuNum;
		let menuSale = $('select[name='+txt+'] option:selected').val();
		let shopNum = ${shopMaster.shopNum};
		$.ajax({
			type:"post",
			url:"./ceoMenu",
			data:{
				sale:menuSale,
				menuNum:menuNum,
				shopNum:shopNum
			},
			success:function(data) {
				if(data.trim() ==1) {
					alert("변경되었습니다. ");
				}else {
					alert("변경에 실패했습니다.");
				}
			}
		
		});
	
	});
	
	
</script>
</body>
</html>