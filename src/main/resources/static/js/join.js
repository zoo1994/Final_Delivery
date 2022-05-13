let checkk = true;
$("#messageBtn").click(function(){
		if(!phoneCheck){
			return;
		}
		$.ajax({
			type:"POST",
			url:"/send",
			data:{
				phone : $("#phone").val()
			},
			success:function(data){
				$("#phoneDiv").html(data.trim());
				if(data.trim()==""){
					makeNumBox();
					phoneCheck=false;
				}
			},
			error:function(){
				alert("파일 삭제 실패")
			}
		}); 
	
});
function makeNumBox(){
	let v = '<div class="mb-3"><input type="text" id="checkNum" class="form-control" placeholder="인증번호" /><div id="boxMessage">3분이내에 인증번호를 입력하세요.</div><button type="button" id="checkNumBtn" class="col-1 btn btn-outline-success">인증확인</button></div>';
	$("#numBox").append(v);	
					
}

$("#divv").on("click","#checkNumBtn",function(){
	let checkNum = $("#checkNum").val();
	if(checkk){
		$.ajax({
			type:"POST",
			url:"/checkNum",
			data:{
				phone : $("#phone").val(),
				num : checkNum
			},
			success:function(data){
				$("#boxMessage").html(data.trim());
				if(data.trim()=="인증이 성공하였습니다."){
					$("#checkNum").attr("readonly","true")
					checkk=false;
				}
			},
			error:function(){
				alert("파일 삭제 실패")
			}
		}); 
	}
	
})