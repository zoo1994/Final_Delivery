const admin_coupon_search_btn = document.querySelector("#admin_coupon_search_btn");
const admin_coupon_search = document.querySelector("#admin_coupon_search");

getList();

function getList(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"./coupon1",
 		data:{
            search : admin_coupon_search.value
		}, 
		success:function(data){
			$("#adminCouponListReusult").html(data.trim());
            category_count.innerText = document.querySelector("#admin_coupon_count").getAttribute("value");
		}
	});
    
}


$('#adminCouponListReusult').click(function(event){

	if(event.target.classList.contains('modalBtn')){

		$('#modal').modal("show");
	}


	if(event.target.classList.contains('deleteBtn')){

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./cpDelete");

		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("couponId="+event.target.getAttribute("id").substr(15));
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
				let result = this.responseText.trim();
				if(result=='1'){
					alert('삭제 성공');
					getList();
				}else {
					alert('삭제 실패');
				}
			}
        }
		getList();
	}

    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("GET", "./coupon1?search="+event.target.getAttribute("data-search")+"&pn="+event.target.getAttribute("data-page"));
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
     //           console.log(this.responseText);
                $("#adminCouponListReusult").html(this.responseText.trim());
                category_count.innerText = document.querySelector("#admin_coupon_count").getAttribute("value");
            }
        }
    }

}); 

$('#modalHide').click(function(e){
	$('#modal').modal("hide");
}); 
$('#modalHideX').click(function(e){
	$('#modal').modal("hide");
}); 

$("#modalSave").click(function() {
	let formData = new FormData();
	let couponName = $("#couponName").val();
	let couponDis = $("#couponDis").val();
	let couponValiTerm = $("#couponValiTerm").val();
	

	let couponNameCheck = false;
	let couponDisCheck = false;
	let couponValiTermCheck = false;
	if (couponName == "") { couponNameCheck = true; }
	if (couponDis == "") { couponDisCheck = true; }
	if (couponValiTerm == "") { couponValiTermCheck = true; }
	if (couponNameCheck||couponDisCheck||couponValiTermCheck) {
		alert("정보를 입력하세요.")
		return;
	}
	//9999-12-31 넘기면 오류 대략 2900000일
	if(couponValiTerm>36500){
		alert("사용가능일수는 최대 36500일입니다.");
		$("#couponValiTerm").val("");
		$("#couponValiTerm").focus();
		return;
	}

	formData.append("couponName", couponName);
	formData.append("discount", couponDis);
	formData.append("activeDate", couponValiTerm);
	
		$.ajax({
		type:"POST",
		url:"./cpAdd",
		processData: false,
		contentType: false,
		data:formData,
		success:function(data){
			if(data.trim()=='1'){
				alert("쿠폰 등록 완료");
				getList();
				$('#modal').modal("hide");
				$("#couponId").val("");
				$("#couponName").val("");
				$("#couponDis").val("");
				$("#couponValiTerm").val("");
			}else {
				alert("쿠폰 등록 실패");
			}
			
		},
		error:function(){
			alert("error 발생");
		}
	}); 
	
});
/*
$('#modalSave').click(function(e){

 		$.ajax({
			type:"POST",
			url:"./mgUpdate",

			data:{
				id: $("#modal_memberID").text(),
				userType: $("#inputGroupSelect01").val()
			},
			success:function(data){
				if(data.trim()=='1'){
					alert("등급 수정 완료");
					getList();
				}else {
					alert("등급 수정 실패");
				}				
			},
			error:function(){
				alert("error 발생");
			}
		});

 	$('#modal').modal("hide"); 
});
*/
//search submit 버튼 클릭시
admin_coupon_search_btn.addEventListener("click", function(event){
    getList();
});

function checkNumber(event) {
	if(event.key >= 0 && event.key <= 9) {
	  return true;
	}
	return false;
};
