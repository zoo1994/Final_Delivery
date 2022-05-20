		$("#check_module").click(function () {
		const IMP = window.IMP; // 생략가능
		IMP.init('imp53756830');
		let amount = Number($("#pay").html()); 
		let request = $("#request").val();
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
			buyer_postcode: $("#postcode").val(),
			m_redirect_url: '127.0.0.1/delivery/orderComplite',
			custom_data:{buyer_request:request}

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
		