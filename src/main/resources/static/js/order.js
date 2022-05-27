
		let couponCount = 0;
		let couponNum = '';
		$(".couponButton").each(function(idx,item){
			let num = item.getAttribute("data-num");
			let check = "#check"+num;
			$(item).click(function(){
				let discount = "#discount"+num;
					if($(check).is(":checked")){						
						$(check).prop("checked",false);	
						item.innerHTML="선택";
						couponNum = '';
						$("#pay").html(Number($("#pay").html())+Number($(discount).html()));
						$("#discountCoupon").remove();
						couponCount--;
					}
					else{
						if(couponCount>0){
							alert("쿠폰은 한장만 사용가능합니다.");
							return;
						}
						if(Number($("#pay").html())<=Number($(discount).html())){
							alert("상품 가격 이상 할인받을 수 없습니다.");
							return;
						}
						let coupon = "#couponNum"+num;
						$("#pay").html(Number($("#pay").html())-Number($(discount).html()));
						$(check).prop("checked",true);
						item.innerHTML="선택해제";
						couponNum = $(coupon).val();
						let couponName = "#couponName"+num;
						$("#receiptBody").html($("#receiptBody").html() 
								+"<tr id='discountCoupon'><th>"
								+$(couponName).html()
								+"</th><td></td><td></td><td>-"
								+$(discount).html()
								+"</td></tr>" 
						);
						couponCount++;
						}		
			});
		})
		
		$("#check_module").click(function () {
			let finalPrice = 0; //최종 가격 초기화
			let discount = 0;   //할인 가격 초기화
			let coupon = 0;     //쿠폰 선택 초기화
			$.ajax({
				method:"POST",
				url:"./getPrice", //물품 가격을 DB에서 불러와서 Controller에서 계산
				success:function(data){
					finalPrice = Number(data.trim()); 
					if(couponCount>0){	//쿠폰이 활성화 되었을 때 실행					
						couponActive();
					}
					else{						
					startPayment();		//쿠폰이 활성화 되지 않았을 때 결제 모듈 바로 실행
					}
				},
				error:function(){
					alert("price 실패");
				}
				
			})
			function couponActive(){
				$.ajax({
					method:"POST",
					url:"./couponActive", //쿠폰의 할인 가격을 계산
					data:{
						couponNum:couponNum
						},
					success:function(data){
						discount = Number(data.trim());
						
						console.log(finalPrice);
						console.log(discount);
						finalPrice = (finalPrice-discount); // 할인 이후 최종 가격
						console.log(finalPrice);
						couponGet(); 					//입력될 쿠폰의 ID 불러오기 
					},
					error:function(){
						alert("쿠폰 에러");
						return;
					}
					
				})
			}
			
			function couponGet(){
				$.ajax({
					method:"POST",
					url:"./couponGet",   //DB에서 COUPONID를 불러옴
					data:{
						couponNum:couponNum
						},
					success:function(data){
						coupon = Number(data.trim()); //coupon에 사용한 쿠폰의 COUPONID 입력
						startPayment();				//결제 모듈 실행
					},
					error:function(){
						alert("쿠폰 에러");
						return;
					}
					
				})
			}
			
			function startPayment(){
				
			const IMP = window.IMP; // 생략가능
			IMP.init('imp53756830'); // 가맹점 식별 코드
			let request = $("#request").val(); //요청사항 불러오기
			
			IMP.request_pay({
				pg: 'inicis', // version 1.1.0부터 지원.
				pay_method: 'card', // 결제 타입
				merchant_uid: 'merchant_' + new Date().getTime(), //결제 구분
				
				name: '맥딜리버리', //상품명
				amount: finalPrice, //가격 입력
				buyer_email: $("#email").val(), //이메일 주소 입력
				buyer_name: $("#name").val(), // 결제자 이름 입력
				buyer_tel: $("#phone").val(), // 전화번호 입력
				buyer_addr: $("#address").val(), // 전체주소 입력
				buyer_postcode: $("#postcode").val(), // 우편번호 입력 
				m_redirect_url: '127.0.0.1/delivery/orderComplite', //결제 종료후 도착할 주소
				custom_data:{buyer_request:request,	// 요청사항 입력
							 coupon:coupon		//불러온 COUPONID를 rsp에 입력
							 } 
	
				}, 
				function (rsp) {
					console.log(rsp);
					if (rsp.success) {	//결제 성공시 실행
						let msg = '결제가 완료되었습니다.'; 
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);
						
						let formData = new FormData(); //DB PAYMENT TABLE에 입력할 데이터
						let formData2 = new FormData(); // DB ORDERS TABLE예 입력할 데이터
						let type=0;
						if(rsp.pay_method=='card'){
							type=1;
						}
						formData.append("payNum",rsp.merchant_uid); // 결제 번호 입력
						formData.append("type",type); // 결제 타입 입력
						formData.append("price",rsp.paid_amount); // 가격 입력
						
						function order(){ // ORDERS TABLE에 입력할 데이터 입력
							formData2.append("payNum",rsp.merchant_uid); 
							formData2.append("address",rsp.buyer_addr);
							formData2.append("phone",rsp.buyer_tel);
							formData2.append("request",rsp.custom_data.buyer_request);
							formData2.append("coupon",rsp.custom_data.coupon);
							formData2.append("totalPrice",rsp.paid_amount);
							$.ajax({
								method:"POST",
								url:"./order",
								data:formData2,
								processData : false,
								contentType : false,
								success:function(){
									alert("결제 성공");
									if(couponCount>0){
										$.ajax({
											url:"./userCouponDelete",
											method:"POST",
											data:{
												couponNum:couponNum
											},
											success:function(data){
												if(data.trim()=='1'){
													return;
												}
												alert("DB 쿠폰 삭제 실패");
											},
											error:function(){
												alert("쿠폰 삭제 실패");
											}
										})
									}
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
									order();	// PAYMENT를 DB에 저장 성공시 바로 ORDERS를 DB에 저장
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
	    
			}
		
		});
		