let title = false;
let writer = false;
let contents = false;

console.log($("#id").val());
function getUserType(){
    
    $.ajax({
		type:"GET",
		url:"./userType",
 		data:{
            id : $("#id").val()
		}, 
		success:function(data){
            if(data.trim()==0){

            }else{
                alert("접근권한이 없습니다.");
            }
		}
	});
}

$("#addBtn").click(function(){

    let length1 = $("#title").val().length;
    if(length1>0){
        console.log("title t");
        title=true;
    }else{
        console.log("title f");
        title=false;
    }

    let length2 = $("#contents").val().length;
    if(length2>0){
        console.log("contents t");
        contents=true;
    }else{
        console.log("contents f");
        contents=false;
    }

    if(title&&contents){
        $("#addForm").submit();
    }else{
        alert("정보를 모두 입력해주세요.")
    }
});



// $("#joinBtn").click(function(){
// 	if(numCheck&&idCheck2&&pwCheck&&chPwCheck&&genderCheck&&yearCheck&&monthCheck&&dayCheck&&emailCheck&&addressCheck){
// 		$("#joinForm").submit();
// 	}else{
// 		alert("정보를 모두 입력해주세요.")
// 	}
// });



// $("#id").blur(function(){
//     console.log(idCheck2)
//     idCheck = true;
//     $("#idError").text("")
//     length = $("#id").val().length;
//     if(length<5||length>15){
//         idCheck=false;
//         $("#id").focus();
//         $("#idError").text("아이디는 5자이상 15자이하만 사용가능합니다.");
//     }
//     });


// $("#idCheckBtn").click(function(){
// 	if(idCheck){
// 		$.ajax({
// 			type:"POST",
// 			url:"./idCheck",
// 			data:{
// 				id : $("#id").val(),
// 			},
// 			success:function(data){
// 				$("#idError").html(data.trim());
// 				if(data.trim()=="사용 가능한 아이디입니다."){
// 					idCheck2=true;
// 				}
// 			},
// 			error:function(){
// 				alert("실패")
// 			}
// 		}); 
// 	}
// });



/*

/////////////////////
let phoneCheck = false;

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
let pw = $("#pw").val();
let checkNumber = pw.search(/[0-9]/g);
let checkEnglish = pw.search(/[a-z]/ig);
$("#pwError").text("")

if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pw)){   
        $("#pwError").text('숫자+영문자+특수문자 조합으로 8자리 이상 20자리 이하로 사용해야 합니다.');         
        pwCheck=false;
        $("#pw").focus();
        return;
    }else if(checkNumber <0 || checkEnglish <0){
        $("#pwError").text('숫자와 영문자를 혼용하여야 합니다.');         
        pwCheck=false;
        $("#pw").focus();
        return;
    }else if(/(\w)\1\1\1/.test(pw)){
        $("#pwError").text('같은 문자를 4번 이상 사용하실 수 없습니다.');         
        pwCheck=false;
        $("#pw").focus();
        return;
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
});*/