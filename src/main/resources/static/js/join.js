let checkk = true;
let numCheck = false;
$("#messageBtn").click(function(){
		if(!phoneCheck){
			return;
		}
		$.ajax({
			type:"POST",
			url:"/send",
			data:{
				phone : $("#phone").val(),
				find : $("#numBox").attr("data-find")
			},
			success:function(data){
				$("#phoneDiv").html(data.trim());
				if(data.trim()==""){
					makeNumBox();
					phoneCheck=false;
					$("#phone").attr("readonly","true");
				}
			},
			error:function(){
				alert("실패")
			}
		}); 
	
});
function makeNumBox(){
	let v = '<div class="mb-3"><input type="text" id="checkNum" class="form-control" placeholder="인증번호" /><div id="boxMessage">5분이내에 인증번호를 입력하세요.</div><button type="button" id="checkNumBtn" class="col-1 btn btn-outline-success">인증확인</button></div>';
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
					numCheck = true;
					checkk=false;
				}
			},
			error:function(){
				alert("실패")
			}
		}); 
	}
	
})
$("#joinBtn").click(function(){
	console.log(numCheck);
	console.log(idCheck2);
	console.log(pwCheck);
	console.log(chPwCheck);
	console.log(genderCheck);
	console.log(yearCheck);
	console.log(monthCheck);
	console.log(dayCheck);
	console.log(emailCheck);
	console.log(addressCheck);
	if(numCheck&&idCheck2&&pwCheck&&chPwCheck&&genderCheck&&yearCheck&&monthCheck&&dayCheck&&emailCheck&&addressCheck){
		$("#joinForm").submit();
	}else{
		alert("정보를 모두 입력해주세요.")
	}
});

$("#idCheckBtn").click(function(){
	if(idCheck){
		$.ajax({
			type:"POST",
			url:"./idCheck",
			data:{
				id : $("#id").val(),
			},
			success:function(data){
				$("#idError").html(data.trim());
				if(data.trim()=="사용 가능한 아이디입니다."){
					idCheck2=true;
				}
			},
			error:function(){
				alert("실패")
			}
		}); 
	}
});

$("#findPwBtn").click(function(){
	if(numCheck){
		$("#findPwForm").submit();
	}else{
		alert("핸드폰 인증이 완료되지 않았습니다.")
	}
});