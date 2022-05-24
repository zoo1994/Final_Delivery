		$("#check_module").click(function () {
		const IMP = window.IMP; // 생략가능
		IMP.init('imp53756830'); // 가맹점 식별 코드
		let amount = Number($("#pay").html()); //총 가격 불러오기
		let request = $("#request").val(); //요청사항 불러오기
		IMP.request_pay({
			pg: 'inicis', // version 1.1.0부터 지원.
			pay_method: 'card', // 결제 타입
			merchant_uid: 'merchant_' + new Date().getTime(), //결제 구분
			
			name: '맥딜리버리', //상품명
			amount: amount, //가격 입력
			buyer_email: $("#email").val(), //이메일 주소 입력
			buyer_name: $("#name").val(), // 결제자 이름 입력
			buyer_tel: $("#phone").val(), // 전화번호 입력
			buyer_addr: $("#address").val(), // 전체주소 입력
			buyer_postcode: $("#postcode").val(), // 우편번호 입력 
			m_redirect_url: '127.0.0.1/delivery/orderComplite', //결제 종료후 도착할 주소
			custom_data:{buyer_request:request} // 요청사항 입력

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
						formData2.append("coupon",0);
						formData2.append("totalPrice",rsp.paid_amount);
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
	    
		
		});
		