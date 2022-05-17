	let phoneCheck = false;
	let numCheck = false;
	let idCheck = false;
	let idCheck2 = false;
	let pwCheck = false;
	let chPwCheck = false;
	let nameCheck = false;
	let genderCheck = false;
	let yearCheck = false;
	let monthCheck = false;
	let dayCheck = false;
	let emailCheck = false;
	let addressCheck = false;
	let length = 0
$("#phone").blur(function(){
    const phone = $("#phone").val();
    if(phone.substring(0,3)!="010"){
        $("#phoneDiv").text("휴대폰 번호는 010으로 시작하여야 합니다.");
        $("#phone").focus();
        return;
    }

    let nan = false;
    for(let i = 0; i<phone.length;i++) {
        let a = phone.charAt(i);
        if(isNaN(a)){
            nan = true
        }
    }
    if(nan){
        $("#phoneDiv").text("");
        $("#phoneDiv").text("휴대폰 번호는 숫자만 입력하여야 합니다.");
        $("#phone").focus();
        return;
    }
    if(phone.length!=11){
        $("#phoneDiv").text("");
        $("#phoneDiv").text("휴대폰 번호는 11자리여야 합니다.");
        $("#phone").focus();
        return;
    }
    phoneCheck=true;
    $("#phoneDiv").text("");
})

$("#id").change(function(){
	idCheck2=false;
	console.log(idCheck2);
});

$("#id").blur(function(){
	console.log(idCheck2)
	idCheck = true;
	$("#idError").text("")
	length = $("#id").val().length;
	if(length<5||length>15){
		idCheck=false;
		$("#id").focus();
		$("#idError").text("아이디는 5자이상 15자이하만 사용가능합니다.");
	}
});
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
$("#name").blur(function(){
	nameCheck = true;
	$("#nameError").text("")
	if($("#name").val().length==0){
		nameCheck=false;
		$("#name").focus();
		$("#nameError").text("이름을 입력하세요");
	}
});
$("#gender").change(function(){
	genderCheck = true;
	$("#genderError").text("")
	if($("#gender option:selected").val()==2){
		genderCheck=false;
		$("#genderError").text("성별을 선택하세요");
	}
});

$("#year").blur(function(){
	yearCheck = true;
	$("#birthError").text("")
	if($("#year").val()<1850||$("#year").val()>2050){
		nameCheck=false;
		$("#year").focus();
		$("#birthError").text("태어난 년도를 올바르게 입력하세요");
	}
});

$("#month").change(function(){
	monthCheck = true;
	$("#birthError").text("")
	if($("#month option:selected").val()==0){
		monthCheck=false;
		$("#birthError").text("태어단 달을 선택하세요");
	}
});

$("#day").blur(function(){
	dayCheck = true;
	$("#birthError").text("")
	if($("#day").val()<1||$("#day").val()>31){
		dayCheck=false;
		$("#day").focus();
		$("#birthError").text("태어난 일을 올바르게 입력하세요");
	}
});

$("#email").blur(function(){
	emailCheck = true;
	$("#emailError").text("")
	if($("#email").val().length==0){
		emailCheck=false;
		$("#email").focus();
		$("#emailError").text("이메일을 입력하세요");
	}
});

$("#detailAddress").blur(function(){
	addressCheck = true;
	$("#addressError").text("")
	if($("#detailAddress").val().length==0){
		addressCheck=false;
		$("#detailAddress").focus();
		$("#addressError").text("주소를 입력하세요");
	}
});