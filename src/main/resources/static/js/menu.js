/**
 * 관리자 menu 관리 js file
 */
 
 	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="./manageDetail?menuNum="+num;
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
	