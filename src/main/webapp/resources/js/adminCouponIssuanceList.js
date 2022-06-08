const couponIssuance_search_btn = document.querySelector("#couponIssuance_search_btn");
const couponIssuance_search = document.querySelector("#couponIssuance_search");
const couponId_error = document.querySelector("#couponId_error");
getList1();

function getList1(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"./cpLog",
 		data:{
            search : couponIssuance_search.value
		}, 
		success:function(data){
			$("#couponIssuanceListReusult").html(data.trim());
            category_count1.innerText = document.querySelector("#admin_couponIssuance_count").getAttribute("value");
		}
	});
    
}


$('#couponIssuanceListReusult').click(function(event){
	console.log(event.target);
	if(event.target.classList.contains('modalBtn')){
		$("#couponId").val("");
		$("#count").val("");
		$("#couponDetail").val("");
		$('#modal2').modal("show");
		couponIdCheck2 = false;
	}


	if(event.target.classList.contains('deleteBtn')){

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./usDelete");

		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("logNum="+event.target.getAttribute("id").substr(11));
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
				let result = this.responseText.trim();
				if(result=='1'){
					alert('삭제 성공');
					getList1();
				}else {
					alert('삭제 실패');
				}
			}
        }
	}

    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("GET", "./cpLog?search="+event.target.getAttribute("data-search")+"&pn="+event.target.getAttribute("data-page"));
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
				$("#couponIssuanceListReusult").html(data.trim());
				category_count1.innerText = document.querySelector("#admin_couponIssuance_count").getAttribute("value");
            }
        }
    }

}); 

$('#modalHide2').click(function(e){
	$('#modal2').modal("hide");
}); 
$('#modalHideX2').click(function(e){
	$('#modal2').modal("hide");
}); 

$("#modalSave2").click(function() {
	let formData = new FormData();
	let couponId = $("#couponId ").val();
	let count = $("#count").val();
	let couponDetail = $("#couponDetail").val();
	
	let couponIdCheck = false;
	let countCheck = false;
	let couponDetailCheck = false;
	if (couponId == "") { couponIdCheck = true; }
	if (count == "") { countCheck = true; }
	if (couponDetail == "") { couponDetailCheck = true; }

	if (couponIdCheck||countCheck||couponDetailCheck||!couponIdCheck2) {
		alert("정보를 입력하세요")
		return;
	}

	formData.append("couponId", couponId);
	formData.append("count", count);
	formData.append("couponDetail", couponDetail);
	
		$.ajax({
		type:"POST",
		url:"./usIssuance",
		data:{
			couponId : couponId,
			count : count,
			detail : couponDetail
		},
		success:function(data){
			if(data.trim()=='1'){
				alert("쿠폰 등록 완료");
				getList1();
				$('#modal2').modal("hide");
				$("#couponId").val("");
				$("#count").val("");
				$("#couponDetail").val("");
			}else {
				alert("쿠폰 등록 실패");
			}
			
		},
		error:function(){
			alert("error 발생");
		}
	}); 
});

couponIssuance_search_btn.addEventListener("click", function(event){
    getList1();
});


let couponIdCheck2 = false;
$('#couponId').blur(function(event){

	console.log("hh");
	$.ajax({
		type: "POST",
		url: "./couponId",
		data: {
			couponId : $("#couponId").val()
		},
		success: function(data) {
			console.log(">>>"+data.trim());
			if (data.trim() == '1') {	
				couponId_error.innerHTML = "";	
				couponIdCheck2 = true;
			}else {
				couponId_error.innerHTML = "쿠폰아이디를 다시 확인해주세요";
				couponIdCheck2 = false;
			}
		},
		error: function() {
			alert("error 발생");
		}
	});	
});