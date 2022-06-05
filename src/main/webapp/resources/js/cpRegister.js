



$("#cpRegisterBtn").click(function(){
    if($("#couponNum").val().length!=8){
        alert("쿠폰 코드를 확인 후 다시 등록해주세요.");
    }else {
        $("#cpRegisterForm").submit();


        $.ajax({
            type:"POST",
            url:"./cpRegister",
             data:{
                couponNum : $("#couponNum").val()
            }, 
            success:function(data){
                if(data.trim()=='1'){
					alert("쿠폰을 등록하였습니다.");
					getList();
				}else {
					alert("쿠폰 코드를 확인 후 다시 등록해주세요.");
				}
            },
            error:function(){
				alert("error 발생");
			}
        });
    }

	if(pwCheck&&chPwCheckchPwCheck){
		
	}else{
		alert("정보를 모두 입력해주세요.")
	}
});