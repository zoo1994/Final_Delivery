	let phoneCheck = false;
	let numCheck = false;
$("#phone").blur(function(){
    const phone = $("#phone").val();
    if(phone.substring(0,3)!="010"){
        $("#phoneDiv").text("휴대폰 번호는 010으로 시작하여야 합니다.")
        $("#phone").focus();
        return;
    }

    let checkNum = false;
    for(let i = 0; i<phone.length;i++) {
        let a = phone.charAt(i);
        if(isNaN(a)){
            checkNum = true
        }
    }
    if(checkNum){
        $("#phoneDiv").text("")
        $("#phoneDiv").text("휴대폰 번호는 숫자만 입력하여야 합니다.")
        $("#phone").focus();
        return;
    }
    if(phone.length!=11){
        $("#phoneDiv").text("")
        $("#phoneDiv").text("휴대폰 번호는 11자리여야 합니다.")
        $("#phone").focus();
        return;
    }
    phoneCheck=true;
    $("#phoneDiv").text("")
})