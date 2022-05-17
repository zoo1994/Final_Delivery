let pwCheck = false;
let chPwCheck = false;

$("#pw").blur(function(){
	pwCheck = true;
	$("#pwError").text("")
	length = $("#pw").val().length;
	if(length<5||length>15){
		pwCheck=false;
		$("#pw").focus();
		$("#pwError").text("비밀번호는 5자이상 15자이하만 사용가능합니다.");
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

$("#pwChangeBtn").click(function(){
	console.log("d")
	if(pwCheck&&chPwCheck){
		$("#pwChangeForm").submit();
	}else{
		alert("정보를 모두 입력해주세요.")
	}
});