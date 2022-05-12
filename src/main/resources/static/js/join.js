
$("#messageBtn").click(function(){
			$.ajax({
			type:"POST",
			url:"/send",
			data:{

			},
			success:function(){

			},
			error:function(){
				alert("파일 삭제 실패")
			}
		}); 
	
})
