/**
 * 관리자 menu 관리 js file
 */
 
 	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="../menu/manageDetail?menuNum="+num;
	});
	
	$(".updateBtn").click(function() {
		let num = $(this).attr("data-num");
		let txt = 'menuSale'+num;

	 	let menuSale = $('input[name='+txt+']:checked').val();
		/*console.log($(this).parent().parent().children("td.menuSale").text());*/

		  $.ajax({
			type:"post",
			url:"./menuManage",
			data:{
				menuSale:menuSale,
				menuNum:num
			},
			success:function(data) {
				if(data.trim() >= 1) {
					alert("변경되었습니다.");		
				}else {
					alert("변경에 실패했습니다.");
				}
				
			}
		});   
	});
	
	$(".deleteBtn").click(function() {
		let num = $(this).attr("data-num");
		let selector = $(this);
		if(confirm("정말 삭제하시겠습니까?")) {	
			$.ajax({
				type:"get",
				url:"../menu/delete",
				data:{
					menuNum:num
				},
				success:function(data) {
					if(data.trim() == 1) {
						alert("삭제되었습니다.");
						$(selector).parent().parent().remove();		
					}else {
						alert("삭제 실패했습니다.");
					}
					
				}
			});
		}else {	
      	  return false;
		}
		
	});
	