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
<c:import url="../temp/header_script.jsp"></c:import>
<style type="text/css">
#menuImg {
	width:750px;
	height:550px;
	margin:0 auto;
}
.collapse {
  &:not(.show) {
    display: none;
  }
}

.collapsing {
  height: 0;
  overflow: hidden;
  @include transition($transition-collapse);
}

</style>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="cateBanner">
	<c:import url="../common/categoryBenner.jsp"></c:import>
</div>	
	<div class="container">
		<div class="row mt-4 menuDetail">
			<h2 class="text-center fw-bolder">${vo.menuName}</h2>
			<h5 class="text-center text-muted">${vo.menuEng}</h5>

			<c:if test="${vo.menuFileVO.fileName ne null}">
				<img alt="" src="../resources/upload/menu/${vo.menuFileVO.fileName}" id="menuImg">
			
			</c:if>
			<h5 class="text-center text-muted">${vo.menuDetail}</h5>
						<c:if test="${member.userType eq 0}">
				<c:choose>
					<c:when test="${vo.menuSale eq 0}">
						<h5 class="text-center">*현재 판매중지</h5>								
					</c:when>
					<c:when test="${vo.menuSale eq 1}">
						<h5 class="text-center">*현재 판매중</h5>								
					</c:when>
					<c:otherwise>
						<h5 class="text-center">*현재 단종메뉴</h5>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
		
	


     <div class="accordion accordion-flush row" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        <h5 class="fw-bolder">영양정보</h5>
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><table class="table table-bordered">
				  <thead>
				    <tr>
				    	<th scope="col">영양소</th>
				    	<th scope="col">중량(g)</th>
				    	<th scope="col">중량(ml)</th>
				    	<th scope="col">열량</th>
				    	<th scope="col">당</th>
				    	<th scope="col">단백질</th>
				    	<th scope="col">포화지방</th>
				    	<th scope="col">나트륨</th>
				    	<th scope="col">카페인</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">함량</th>
				      <td>${vo.ingredientVO.weight_g}</td>
				      <td>${vo.ingredientVO.weight_ml}</td>
				      <td>${vo.ingredientVO.calory}</td>
				      <td>${vo.ingredientVO.sugar}</td>
				      <td>${vo.ingredientVO.protein}</td>
				      <td>${vo.ingredientVO.fat}</td>
				      <td>${vo.ingredientVO.sodium}</td>
				      <td>${vo.ingredientVO.caffeine}</td>
				    </tr>
				  </tbody>
				</table>
				<p>제품 별 사이즈 및 조각 수에 따라 영양정보가 달라지기 때문에 해당하는 제품페이지에서 영양정보를 확인해주세요.</p>
				</div>
    </div>
  </div>


</div>
	</div>
	<div class="footer">
<c:import url="../temp/footer.jsp"></c:import>
</div>
<script type="text/javascript">

</script>
</body>
</html>