$("#findIdBtn").click(function(){
	if($("#name").val()==""){
		alert("id를 입력하세요.");
		return;
	}
	if($("#phone").val()==""){
		alert("전화번호를 입력하세요.");
		return;
	}
	if(isNaN($("#phone").val())){
		alert("전화번호는 숫자만 입력 가능합니다.");
		return;
	}
	$("#findIdFrom").submit();
});