let phoneCheck = false;
let emailCheck = true;
let addressCheck = true;
let numCheck = true;
let nan = false;
let checkk = true;
let phone = $("#phone").val();
let message="";
$("#phone").change(function(){
	numCheck=false;
})

$("#phone").blur(function() {
	if (phone.substring(0, 3) != "010") {
		$("#phoneDiv").text("휴대폰 번호는 010으로 시작하여야 합니다.")
		$("#phone").focus();
		return;
	}
	for (let i = 0; i < phone.length; i++) {
		let a = phone.charAt(i);
		if (isNaN(a)) {
			nan = true
		}
	}
	if (nan) {
		$("#phoneDiv").text("")
		$("#phoneDiv").text("휴대폰 번호는 숫자만 입력하여야 합니다.")
		$("#phone").focus();
		return;
	}
	if (phone.length != 11) {
		$("#phoneDiv").text("")
		$("#phoneDiv").text("휴대폰 번호는 11자리여야 합니다.")
		$("#phone").focus();
		return;
	}
	phoneCheck = true;
	$("#phoneDiv").text("")
})

$("#messageBtn").click(function() {
	if (!phoneCheck) {
		$("#phoneDiv").text("")
		$("#phoneDiv").text("휴대폰 번호를 입력해주세요.")
		return;
	}
	$.ajax({
		type: "POST",
		url: "/send",
		data: {
			phone: $("#phone").val()
		},
		success: function(data) {
			$("#phoneDiv").html(data.trim());
			if (data.trim() == "") {
				makeNumBox();
				phoneCheck = false;
				$("#phone").attr("readonly", "true");
			}
		},
		error: function() {
			alert("실패")
		}
	});

});
function makeNumBox() {
	let v = '<div class="mb-3"><input type="text" id="checkNum" class="form-control" placeholder="인증번호" /><div id="boxMessage">5분이내에 인증번호를 입력하세요.</div><button type="button" id="checkNumBtn" class="col-1 btn btn-outline-success">인증확인</button></div>';
	$("#numBox").append(v);

}
$("#divv").on("click", "#checkNumBtn", function() {
	let checkNum = $("#checkNum").val();
	if (checkk) {
		$.ajax({
			type: "POST",
			url: "/checkNum",
			data: {
				phone: $("#phone").val(),
				num: checkNum
			},
			success: function(data) {
				$("#boxMessage").html(data.trim());
				if (data.trim() == "인증이 성공하였습니다.") {
					$("#checkNum").attr("readonly", "true")
					numCheck = true;
					checkk = false;
				}
			},
			error: function() {
				alert("실패")
			}
		});
	}
})
$("#email").blur(function(){
	emailCheck=true;
	$("#emailError").text("");
	if($("#email").val()==""){
		$("#emailError").text("이메일을 입력하세요");
		emailCheck=false;
	}
});
$("#detailAddress").blur(function(){
	addressCheck=true;
	$("#addressError").text("");
	if($("#detailAddress").val()==""){
		$("#addressError").text("상세주소를 입력하세요");
		addressCheck=false;
	}
});


$("#updateBtn").click(function() {
	if (numCheck&&addressCheck&&emailCheck) {
		$("#updateForm").submit();
	}
});
$("#delMemBtn").click(function() {
	let check = window.confirm("회원탈퇴하면 복구가 불가능합니다 탈퇴하시겠습니까");
	if(!check){
		return;
	}
	$("#delForm").submit();
});