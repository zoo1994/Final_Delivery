console.log("hi");
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

	// if(event.target.classList.contains('modalBtn')){
		
		
	// 	$('#modal_memberID').text(event.target.getAttribute("id").substr(8));
	// 	$('#modal_memberNAME').text(event.target.getAttribute("data-name"));
	// 	let cate = event.target.getAttribute("data-type");
	// 	console.log(cate);
		
	// 	$("#inputGroupSelect01").val(cate).prop("selected", true);
		
	// 	$('#modal').modal("show");
	// }

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
/*
$('#modalHide').click(function(e){
	$('#modal').modal("hide");
}); 
$('#modalHideX').click(function(e){
	$('#modal').modal("hide");
}); 

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


