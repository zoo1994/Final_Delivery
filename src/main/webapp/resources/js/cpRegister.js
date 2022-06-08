const userCouponResult = document.querySelector("#userCouponResult");


getList();

//userCouponList 불러오기
function getList(){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./cpRegister2");

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            userCouponResult.innerHTML = this.responseText.trim();
        }
    }

}


userCouponResult


$("#cpRegisterBtn").click(function(){
    if($("#couponNum").val().length!=8){
        alert("쿠폰 코드를 확인 후 다시 등록해주세요.");
    }else {
        $.ajax({
            type:"POST",
            url:"./cpRegister",
             data:{
                couponNum : $("#couponNum").val()
            }, 
            success:function(data){
                if(data.trim()=='1'){
					alert("쿠폰을 등록하였습니다.");
                    $("#couponNum").val("");
					getList();
				}else {
					alert("쿠폰 코드를 확인 후 다시 등록해주세요.");
                    $("#couponNum").val("");
				}
            },
            error:function(){
				alert("error 발생");
			}
        });
    }
}); 