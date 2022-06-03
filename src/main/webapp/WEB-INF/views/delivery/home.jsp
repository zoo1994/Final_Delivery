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
	<div class="wrap">

		<div class="container">
			<div class="row col-12">
			<div class="sidebar-menu col-2">
				<div class="food-menu">

							<ul class="secondary-menu">
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home"> <span>전체메뉴</span></a></li>
									
								<li class="secondary-menu-item ">
									<a class="secondary-menu-item-target" href="./home?category=1">
										<i class="fa fa-circle"></i> 
											<span>버거</span>
									</a>
								</li>
								
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=2"><i
										class="fa fa-circle"></i> <span>맥런치</span></a></li>
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=3"><i
										class="fa fa-circle"></i> <span>맥모닝</span></a></li>
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=4"><i
										class="fa fa-circle"></i> <span>해피스낵</span></a></li>
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=5"><i
										class="fa fa-circle"></i> <span>사이드 & 디저트</span></a></li>
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=6"><i
										class="fa fa-circle"></i> <span>맥카페 & 음료</span></a></li>
								<li class="secondary-menu-item "><a
									class="secondary-menu-item-target" href="./home?category=7"><i
										class="fa fa-circle"></i> <span>해피밀®</span></a></li>	
					</ul>
				</div>
			</div>

			<div class="row menuResult col-10 col-xs-1" style="margin-top:230px;">
<%-- 			<div class="row">
				<h1>Delivery</h1>
				<p>∘ ${list.size()} Products</p>
			</div> --%>
				<div class="row mt-4 justify-content-left">
					<input type="hidden" id="shopNum" value="${shop.shopNum}">
					<c:forEach items="${list}" var="vo">
						<c:if test="${vo.sale==1}">

							<div class="card col-4 detail mx-5 mb-3" data-num="${vo.menuNum}"
								style="width: 320px; height: 400px">
								<img src="../resources/upload/menu/${vo.menuFileVO.fileName}"
									class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">${vo.menuVO.menuName}</p>
									<p class="card-text price" id="menu${vo.menuNum}">가격 ₩
										${vo.menuVO.price}</p>
									<c:if test="${not empty member}">
										<button class="btn btn-success cartAdd"
											data-num="${vo.menuNum}">카트에 담기</button>
									</c:if>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>

			</div>
		</div>
		</div>
		<c:import url="../temp/footer.jsp"></c:import>
	</div>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script type="text/javascript">
		$('.cartAdd').click(function() {
			let menuNum = $(this).attr('data-num');
			let price = '#menu' + $(this).attr('data-num');
			let formData = new FormData();
			formData.append("menuNum", menuNum);
			formData.append("totalPrice", $(price).html());
			formData.append("shopNum", $("#shopNum").val());

			$.ajax({
				method : 'POST',
				url : './cartAdd',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					if (data.trim() == '1') {
						alert("상품을 장바구니에 추가했습니다.");
					}
					if (data.trim() == '0') {
						alert("장바구니에 이미 상품이 있습니다.");
					}
				},
				error : function() {
					alert("다시 시도해주세요.");
				}

			})
		})
	</script>
</body>
</html>
