console.log("hhhh");
const event_coupon_search_btn = document.querySelector("#event_coupon_search_btn");
const event_coupon_search = document.querySelector("#event_coupon_search");
const couponListSelect = document.querySelector("#couponListSelect");
const couponId = document.querySelector("#couponId");
const couponName = document.querySelector("#couponName");

getList();

function getList(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"../coupon/list",
 		data:{
            search : event_coupon_search.value
		}, 
		success:function(data){
			$("#couponListSelect").html(data.trim());
            category_count.innerText = document.querySelector("#event_coupon_count").getAttribute("value");
		}
	});
    
}
$('#modalStartBtn').click(function(event){
    console.log(event.target);
	if(event.target.classList.contains('modalBtn')){
		$('#modal').modal("show");
	}
});

$('#modalWrap').click(function(event){
    console.log(event.target);
	// if(event.target.classList.contains('deleteBtn')){

    //     const xhttp = new XMLHttpRequest();

    //     xhttp.open("POST", "./cpDelete");

	// 	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //     xhttp.send("couponId="+event.target.getAttribute("id").substr(15));
    
    //     xhttp.onreadystatechange = function(){
    //         if(this.readyState==4 && this.status==200){
	// 			let result = this.responseText.trim();
	// 			if(result=='1'){
	// 				alert('삭제 성공');
	// 				getList();
	// 			}else {
	// 				alert('삭제 실패');
	// 			}
	// 		}
    //     }
	// 	getList();
	// }

    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("GET", "../coupon/list?search="+event.target.getAttribute("data-search")+"&pn="+event.target.getAttribute("data-page"));
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
     //           console.log(this.responseText);
                $("#couponListSelect").html(this.responseText.trim());
                console.log(this.responseText.trim());
                category_count.innerText = document.querySelector("#event_coupon_count").getAttribute("value");
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
    $(".cpRadio").each(function(idx, item) {
        if($(item).prop("checked")){
            console.log($(item).prop("value"));
            console.log($(item).prop("title"));
            couponName.setAttribute("value", $(item).prop("title"));
            couponId.setAttribute("value", $(item).prop("value").substr(6));
            return;
        }
    });
    
	$('#modal').modal("hide");
});

event_coupon_search_btn.addEventListener("click", function(event){
    getList();
});

/*
let v = '<div class="mb-3"><input class="form-control form-control-lg" type="file" name="files"><button  type="button" class="btn btn-outline-success delBtn">x</button></div>'
$("#fileAdd").click(function() {
	$("#fileResult").append(v);
});
$("#fileResult").on("click", ".delBtn", function() {
	$(this).parent().remove();
});

$(".fileDel").click(function() {
	let check = window.confirm("삭제하면 복구가 불가능합니다. 삭제하시겠습니까?")
	if (check) {
		let fileNum = $(this).attr("data-num");
		let fileName = $(this).attr("data-name");
		let select = $(this);
		$.ajax({
			type: "POST",
			url: "./fileDelete",
			data: {
				fileNum: fileNum,
				fileName: fileName
			},
			success: function(data) {
				if (data.trim() == '1') {
					select.parent().remove();
				} else {
					alert("파일 삭제 실패");
				}
			},
			error: function() {
				alert("파일 삭제 실패")
			}
		});
	}
});*/