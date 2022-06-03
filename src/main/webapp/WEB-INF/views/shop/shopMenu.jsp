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
<title>메뉴관리</title>
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

	<div class="container" style="margin-left:220px; margin-top:20px;">
        <div class="col-8 py-3">
        <div class="row">
        	<h1>[맥도날드] ${shopMaster.shopName}점, ${member.id}님</h1>
        </div>
        <div class="d-grid gap-3">
 			 <div class="p-2 bg-light border" style="margin-bottom:15px;">프랜차이즈 본사 메뉴판이 연동되어 있는 점포로, 메뉴 판매 상태 변경만 가능합니다.</div>
		</div>
      <table class="table table-hover ">
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
				<td class="detail fw-bolder" data-num="${vo.menuNum}">${vo.menuVO.menuName}</td>
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
			url:"./shopMenu",
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