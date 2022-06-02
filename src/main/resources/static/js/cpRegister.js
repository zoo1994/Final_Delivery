let cpNumCheck = false;

$("#couponNum").blur(function(){
	pwCheck = true;
	$("#pwError").text("")
	length = $("#pw").val().length;
	if(length<5||length>15){
		pwCheck=false;
		$("#pw").focus();
		$("#pwError").text("쿠폰 8자를 입력하세요");
	}
});
$("#checkPw").blur(function(){
	chPwCheck = true;
	$("#checkPwError").text("")
	if($("#pw").val()!==$("#checkPw").val()){
		chPwCheck=false;
		$("#checkPwError").text("비밀번호가 일치하지 않습니다.");
	}
});

$("#cpRegisterBtn").click(function(){
	console.log("d")
	if(cpNumCheck){
		$("#cpRegisterBtn").submit();
	}else{
		alert("쿠폰을 올바르게 입력하세요")
	}
});