const admin_shop_search_btn = document.querySelector("#admin_shop_search_btn");
const admin_shop_search = document.querySelector("#admin_shop_search");
const geocoder = new kakao.maps.services.Geocoder();
getList();

function getList() {
	console.log("start");
	$.ajax({
		type: "GET",
		url: "./shop1",
		data: {
			search: admin_shop_search.value
		},
		success: function(data) {
			$("#adminShopListReusult").html(data.trim());
			category_count.innerText = document.querySelector("#admin_shop_count").getAttribute("value");
		}
	});

}


$('#adminShopListReusult').click(function(event) {

	if (event.target.classList.contains('modalBtn')) {

		$('#modal').modal("show");
	}
	if (event.target.classList.contains('modalBtn2')) {
		id_edit=event.target.getAttribute("data-id");
		console.log(id_edit);
		console.log(event.target.getAttribute("id").substr(13));
		//	let shopNum2 = $("#shopNum2").val();
		$("#shopNum2").val(event.target.getAttribute("id").substr(13));
		$("#shop_id2").val(event.target.getAttribute("data-id"));
		$("#shop_name2").val(event.target.getAttribute("data-name"));
		$("#shop_location2").val(event.target.getAttribute("data-location"));
		$("#shop_phone2").val(event.target.getAttribute("data-phone"));
		//		$("#shop_sale2").val(event.target.getAttribute("data-sale"));
		//		$("#shop_open2").val(event.target.getAttribute("data-open"));
		$('input:radio[name=shop_sale2]:input[value=' + event.target.getAttribute("data-sale") + ']').attr("checked", true);
		$('input:radio[name=shop_open2]:input[value=' + event.target.getAttribute("data-open") + ']').attr("checked", true);
		idCheck2_edit = true;
		$('#modal2').modal("show");
	}

	if (event.target.classList.contains('deleteBtn')) {

		const xhttp = new XMLHttpRequest();

		xhttp.open("POST", "./shopDelete");

		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		xhttp.send("shopNum=" + event.target.getAttribute("id").substr(13));

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let result = this.responseText.trim();
				if (result == '1') {
					alert('삭제 성공');
					getList();
				} else {
					alert('삭제 실패');
				}
			}
		}
		getList();
	}

	if (event.target.classList.contains('page-link')) {
		const xhttp = new XMLHttpRequest();

		xhttp.open("GET", "./shop1?search=" + event.target.getAttribute("data-search") + "&pn=" + event.target.getAttribute("data-page"));

		xhttp.send();

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//           console.log(this.responseText);
				$("#adminShopListReusult").html(this.responseText.trim());
				category_count.innerText = document.querySelector("#admin_shop_count").getAttribute("value");
			}
		}
	}

});

$('#modalHide').click(function(e) {
	$('#modal').modal("hide");
});
$('#modalHideX').click(function(e) {
	$('#modal').modal("hide");
});
$('#modalHide2').click(function(e) {
	$('#modal2').modal("hide");
});
$('#modalHideX2').click(function(e) {
	$('#modal2').modal("hide");
});

$("#modalSave").click(function() {
	let formData = new FormData();
	let shop_id = $("#shop_id").val();
	let shop_name = $("#shop_name").val();
	let shop_location = $("#shop_location").val();
	let shop_phone = $("#shop_phone").val();
	let idCheck = false;
	let nameCheck = false;
	let locationCheck = false;
	let phoneCheck = false;
	if (shop_id == "") { idCheck = true; }
	if (shop_name == "") { nameCheck = true; }
	if (shop_location == "") { locationCheck = true; }
	if (shop_phone == "") { phoneCheck = true; }
	if (idCheck || nameCheck || locationCheck || phoneCheck ||!idCheck2) {
		alert("정보를 입력하세요")
		return;
	}
	geocoder.addressSearch(shop_location, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			let x = result[0].x;
			let y = result[0].y;
			$("#x_axis").val(x);
			$("#y_axis").val(y);

			formData.append("id", shop_id);
			formData.append("shopName", shop_name);
			formData.append("location", shop_location);
			formData.append("shopPhone", shop_phone);
			formData.append("x_axis", $("#x_axis").val());
			formData.append("y_axis", $("#y_axis").val());
			$.ajax({
				type: "POST",
				url: "./shopAdd",
				processData: false,
				contentType: false,
				data: formData,
				success: function(data) {
					if (data.trim() == '1') {
						alert("매장 등록 완료");
						getList();
						$('#modal').modal("hide");
						$("#shop_id").val("");
						$("#shop_name").val("");
						$("#shop_location").val("");
						$("#shop_phone").val("");
						$("#guide").empty();
					} else {
						alert("매장 등록 실패");
					}

				},
				error: function() {
					alert("error 발생");
				}
			});
		}
	});
	idCheck2 = false;
});

$("#modalSave2").click(function() {
	console.log($(":input:radio[name=shop_sale2]:checked").val());
	console.log($(":input:radio[name=shop_open2]:checked").val());
	let formData = new FormData();
	let shopNum2 = $("#shopNum2").val();
	let shop_id2 = $("#shop_id2").val();
	let shop_name2 = $("#shop_name2").val();
	let shop_location2 = $("#shop_location2").val();
	let shop_phone2 = $("#shop_phone2").val();
	let shop_sale2 = $(":input:radio[name=shop_sale2]:checked").val();
	let shop_open2 = $(":input:radio[name=shop_open2]:checked").val();

	let idCheck_edit = false;
	let nameCheck_edit = false;
	let locationCheck_edit = false;
	let phoneCheck_edit = false;
	let shop_sale_edit = false;
	let shop_open_edit = false;
	if (shop_id2 == "") { idCheck_edit = true; }
	if (shop_name2 == "") { nameCheck_edit = true; }
	if (shop_location2 == "") { locationCheck_edit = true; }
	if (shop_phone2 == "") { phoneCheck_edit = true; }
	if (shop_sale2 != 0 && shop_sale2 != 1) { shop_sale_edit = true; }
	if (shop_open2 != 0 && shop_open2 != 1) { shop_open_edit = true; }
	if (idCheck_edit || nameCheck_edit || locationCheck_edit || phoneCheck_edit ||!idCheck2_edit || shop_sale_edit ||shop_open_edit) {
		alert("정보를 입력하세요")
		return;
	}

	geocoder.addressSearch($("#shop_location2").val(), function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			let x_1 = result[0].x;
			let y_1 = result[0].y;
			$("#x_axis").val(x_1);
			$("#y_axis").val(y_1);

			formData.append("shopNum", shopNum2);
			formData.append("id", shop_id2);
			formData.append("shopName", shop_name2);
			formData.append("location", shop_location2);
			formData.append("shopPhone", shop_phone2);
			formData.append("sale", shop_sale2);
			formData.append("open", shop_open2);
			formData.append("x_axis", $("#x_axis").val());
			formData.append("y_axis", $("#y_axis").val());

			$.ajax({
				type: "POST",
				url: "./shopUpdate",
				processData: false,
				contentType: false,
				data: formData,
				success: function(data) {
					if (data.trim() == '1') {
						alert("매장 수정 완료");
						getList();
						//shopNum2  shop_name2  shop_name2  shop_phone2  shop_sale2  shop_open2
						$('#modal2').modal("hide");
						$("#shopNum2").val("");
						$("#shop_id2").val("");
						$("#shop_name2").val("");
						$("#shop_location2").val("");
						$("#shop_phone2").val("");
						$("#shop_sale2").val("");
						$("#shop_open2").val("");
						$("#guide1").empty();

					} else {
						alert("매장 수정 실패");
					}

				},
				error: function() {
					alert("error 발생");
				}
			});
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
admin_shop_search_btn.addEventListener("click", function(event) {
	getList();
});
const shop_id_error = document.querySelector("#shop_id_error");
const shop_id2_error = document.querySelector("#shop_id2_error");

let idCheck2 = false;
let idCheck2_edit = false;
let id_edit ='';
$("#shop_id2").blur(function() {
	console.log("hh");
	
	if(id_edit==$("#shop_id2").val()){
		shop_id2_error.innerHTML = "";
		idCheck2_edit = true;
		return;
	}

	$.ajax({
		type: "POST",
		url: "./shopId",
		data: {
			id : $("#shop_id2").val()
		},
		success: function(data) {
			if (data.trim() == '1') {	
				shop_id2_error.innerHTML = "";			
				idCheck2_edit = true;
			}else if(data.trim() == '-1'){
				shop_id2_error.innerHTML = "아이디가 존재하지 않습니다.";
				idCheck2_edit = false;
			}else if(data.trim() == '-2'){
				shop_id2_error.innerHTML = "매장이 존재하는 아이디입니다.";
				idCheck2_edit = false;
			}else {
				alert("매장 수정 실패");
				idCheck2_edit = false;
			}

		},
		error: function() {
			alert("error 발생");
		}
	});
});

$("#shop_id").blur(function() {
	console.log("hh");
	$.ajax({
		type: "POST",
		url: "./shopId",
		data: {
			id : $("#shop_id").val()
		},
		success: function(data) {
			if (data.trim() == '1') {	
				shop_id_error.innerHTML = "";			
				idCheck2 = true;
			}else if(data.trim() == '-1'){
				shop_id_error.innerHTML = "아이디가 존재하지 않습니다.";
				idCheck2 = false;
			}else if(data.trim() == '-2'){
				shop_id_error.innerHTML = "매장이 존재하는 아이디입니다.";
				idCheck2 = false;
			}else {
				alert("매장 수정 실패");
				idCheck2 = false;
			}

		},
		error: function() {
			alert("error 발생");
		}
	});
});

function checkNumber(event) {
	if(event.key >= 0 && event.key <= 9) {
	  return true;
	}
	return false;
}