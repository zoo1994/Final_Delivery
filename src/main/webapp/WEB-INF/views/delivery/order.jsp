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
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<div class="container">
		<h1>Order</h1>
				<form action="./order" method="post">
				<div class="row">
					<div class="col-8 border rounded">
					
					<input type="hidden" name="id" id="id" value="${member.id}">
					<input type="hidden" name="name" id="name" value="${member.name}">
					<c:choose>
					<c:when test="${not empty address}">					
					<label class="mt-4">주소</label>
					<input type="text" readonly id="address" name="address" value="${address}">
					</c:when>
					<c:otherwise>					
					<label class="mt-4">주소</label>
					<input type="text" id="roadAddress" class="form-control my-2" readonly value="${member.roadAddress}">
					<input type="text" id="detailAddress" class="form-control my-2" readonly value="${member.detailAddress}">
					<input type="hidden" id="address" name="address">
					</c:otherwise>
					</c:choose>
					<label class="mt-4">전화번호</label>
					<input class="form-control my-2" name="phone" id="phone" type="text" value="${member.phone}" style="width: 200px;">
					<label class="mt-4">이메일</label>					
					<input type="text" class="form-control" style="width: 50%" name="email" id="email" value="${member.email}">
					<label class="mt-4">요청사항</label>
					<textarea class="form-control" id="request" name="request" cols="100%"></textarea>
					
					<label class="mt-4">사용할 쿠폰을 선택하세요.</label>
					
					<div id="coupon" class="d-flex justify-content-center align-items-center border rounded"
					style="height: 200px">
					<h3 class="d-flex align-items-center" style="display: block;">사용 가능한 쿠폰이 없습니다.</h3>
				
					
					</div>
					
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
						<c:forEach items="${list}" var="cart">
						<input type="hidden" name="menuNum" value="${cart.menuNum}">
						<input type="hidden" name="shopNum" value="${cart.shopNum}">
						<input type="hidden" name="orderCount" value="${cart.count}">
						<input type="hidden" name="menuPrice" value="${cart.totalPrice}">
						</c:forEach>
						<input type="hidden" name="price" class="totalPrice">
						<button type="button" class="btn btn-warning mt-4" id="check_module" style="width: 100%">결제하기</button>
					</div>
				</div>

				</form>
	</div>

		



	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script src="../js/cart.js"></script>
	<script type="text/javascript">
		getAddress();
		
		function getAddress(){
			$("#address").val($("#roadAddress").val()+" "+$("#detailAddress").val());
		}
		
		$("#roadAddress").change(function(){
			getAddress();
			console.log($("#address").val());
		})
		$("#detailAddress").change(function(){
			getAddress();
			console.log($("#address").val());
		})
		
		$(".totalPrice").val($("#pay").html());
		
		
		
	</script>
	<script>
		$("#check_module").click(function () {
		const IMP = window.IMP; // 생략가능
		IMP.init('imp53756830');
		let amount = Number($("#pay").html()); 
		IMP.request_pay({
			pg: 'inicis', // version 1.1.0부터 지원.
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			
			name: '맥딜리버리',
			amount: amount,
			buyer_email: $("#email").val(),
			buyer_name: $("#name").val(),
			buyer_tel: $("#phone").val(),
			buyer_addr: $("#address").val(),
			buyer_postcode: '',
			m_redirect_url: '127.0.0.1/delivery/orderComplite',
			custum_data: $("#request").html()

			}, 
			function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					let msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
					
					let formData = new FormData();
					let formData2 = new FormData();
					let type=0;
					if(rsp.pay_method=='card'){
						type=1;
					}
					formData.append("payNum",rsp.merchant_uid);
					formData.append("type",type);
					formData.append("price",rsp.paid_amount);
					
					function order(){
						formData2.append("payNum",rsp.merchant_uid);
						console.log(rsp.merchant_uid);
						formData2.append("address",rsp.buyer_addr);
						console.log(rsp.buyer_addr);
						formData2.append("phone",rsp.buyer_tel);
						console.log(rsp.buyer_tel);
						formData2.append("request",rsp.custum_data);
						console.log(rsp.custum_data);
						formData2.append("coupon",0);
						formData2.append("totalPrice",rsp.paid_amount);
						console.log(rsp.paid_amount);
						$.ajax({
							method:"POST",
							url:"./order",
							data:formData2,
							processData : false,
							contentType : false,
							success:function(){
								alert("결제 성공");
								window.location.assign("./orderComplite");
							},
							error:function(){
								alert("에러");
							}
							
						})
					}
					
					$.ajax({
						method:"POST",
						url:"./payment",
						data:formData,
						processData : false,
						contentType : false,
						success:function(data){
							if(data.trim()=='1'){
								order();
							}
							else{
								alert("실패");
							}
						},
						error:function(){
							alert("error");
						}
					})
				} 
				else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
				
				
			});
	    
		
		});
	</script>

</body>
</html>
