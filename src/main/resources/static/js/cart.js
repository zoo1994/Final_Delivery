		getReceipt();

		function getReceipt() {
			let pay = document.getElementById('pay');
			let count = 0;
			console.log(pay.innerHTML);
			$('.count').each(function(index, item) {
				console.log(item.innerHTML);
				count = count + Number(item.innerHTML);
			})
			pay.innerHTML = count;
		}

		$('.cartCount').each(
			function() {
				$('.cartCount').change(
					function() {
						let cartCount = '#cartCount'+ $(this).attr("data-num");
						let price = '#price'+ $(this).attr("data-num");
						let cartPrice = '#cartPrice'+ $(this).attr("data-num");
						let receiptCount = '#receiptCount'+ $(this).attr("data-num");
						let receiptPrice = '#receiptPrice'+ $(this).attr("data-num");
						if($(cartCount).val()<=0){
							alert("0이나 음수를 입력할 수 없습니다.");
							$(cartCount).val(1);
							return;
						}
						let formData = new FormData();
						formData.append("cartNum", $(this).attr("data-num"));
						formData.append("count", $(cartCount).val());
						formData.append("totalPrice",Number($(price).html())* Number($(cartCount).val()));
						$.ajax({
							method : "POST",
							url : "./update",
							data : formData,
							processData : false,
							contentType : false,
							success : function(data) {
								if (data.trim() == '1') {
								$(cartPrice).html(Number($(price).html())* Number($(cartCount).val()));
								$(receiptCount).html($(cartCount).val());
								$(receiptPrice).html(Number($(price).html())* Number($(cartCount).val()));
								getReceipt();
								}
							},
							error : function() {
								alert("실패");
							}
						})

					});
			})
			
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked"))
					{
						$(".checkbox").each(function(idx,item){
							item.checked=true;
						})
					}
				else{
					$(".checkbox").each(function(idx,item){
						item.checked=false;
					})
				}
			})
			
			$(".checkbox").click(function(){
				let check = true;
				
				$(".checkbox").each(function(idx,item){
					if(item.checked==false){
						check=false;
					}
				})
				
				if(check){
					$("#checkAll").prop("checked",true);
				}
				else{
					$("#checkAll").prop("checked",false);	
				}
			})
			
			$("#delete").click(function(){
				let check = window.confirm("장바구니에서 삭제합니다.");
				if(check){
					$(".checkbox").each(function(idx,item){
						if(item.checked){
							
							let formData = new FormData();
							formData.append("cartNum",item.parentNode.getAttribute("data-num"));
							
							
							$.ajax({
								method:"POST",
								url:"./delete",
								data:formData,
								processData : false,
								contentType : false,
								success : function(data) {
									if(data.trim()=='1'){
										
										location.reload();
									}
								},
								error:function(){
									alert("error");
								}
							
							})
						}
						
						
					})
					
				}
			})
			
			