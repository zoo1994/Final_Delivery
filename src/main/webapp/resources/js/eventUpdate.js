const thumbCount = document.querySelector("thumbCount");
const es = document.querySelector("#es");
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

console.log();
//console.log($("#thumbCount").val);
let count =0;
$(".thumbCount").each(function(idx, item) {
    count++;
});
console.log(count);

//thumbnail
let v1Count =count;
let v1 = '<div class="mb-3 d-flex"><input class="col-10 form-control form-control-lg" type="file" name="thumbFiles" style="width: 97%; margin-right: 5px;"><button  type="button" class="btn btn-outline-success delBtn">x</button></div>'
$("#thumbFileAdd").click(function() {
    if(v1Count>0){
        alert("1장의 사진만 업로드 가능합니다");
        return;
    }
    $("#thumbFileResult").append(v1);
    v1Count++;
});
$("#thumbFileResult").on("click", ".delBtn", function() {
    $(this).parent().remove();
    v1Count--;
});

$(".del").click(function(event) {

    if(event.target.classList.contains("thumbDel")){
//        console.log(111);
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
                        v1Count--;
                    } else {
                        alert("파일 삭제 실패");
                    }
                },
                error: function() {
                    alert("파일 삭제 실패")
                }
            });
        }
        return;
    }
//    console.log(222);
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
});
$('#resetBtn').click(function(event){
    console.log(event.target);
	if(event.target.classList.contains('modalBtn')){
		$('#modal').modal("show");
	}

	couponName.setAttribute("value","");
	couponId.setAttribute("value", "");
	es.innerHTML='';
//	eventSchedule.setAttribute("value", "");
	event_coupon_search.value = "";
	alert("쿠폰 초기화 되었습니다");
	getList();
	$(datepicker).prop("value", "");
});

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

$('#modalHide2').click(function(e){
	$('#modal2').modal("hide");
}); 
$('#modalHideX2').click(function(e){
	$('#modal2').modal("hide");
}); 

$("#modalSave").click(function() {
	let check = false;
	$(".cpRadio").each(function(idx, item) {
        if($(item).prop("checked")){
			check=true;
            return;
        }
    });
	if(check){
		$('#modal2').modal("show");
    
		$('#modal').modal("hide");
	}else{
		alert("쿠폰을 선택해주세요");
	}

});					//<input id="eventSchedule" name="eventSchedule" class="form-control" hidden type="text" value="${eventVO.ecVO.eventSchedule}"> 
$("#modalSave2").click(function() {
    $(".cpRadio").each(function(idx, item) {
        if($(item).prop("checked")){
            console.log($(item).prop("value"));
            console.log($(item).prop("title"));
            couponName.setAttribute("value", $(item).prop("title"));
            couponId.setAttribute("value", $(item).prop("value").substr(6));
            if($(datepicker).prop("value")==""){
				es.innerHTML ='<input id="eventSchedule" name="eventSchedule" class="form-control" hidden type="text" value="9999-12-31">';
//				eventSchedule.setAttribute("value", "9999-12-31");
//<input id="eventSchedule" name="eventSchedule" class="form-control" hidden type="text" value="9999-12-31"> 				
			}else{
//				eventSchedule.setAttribute("value", $(datepicker).prop("value"));
				let html1 = '<input id="eventSchedule" name="eventSchedule" class="form-control" hidden value="';
				let html2 = '" type="text">';
				es.innerHTML = html1+$(datepicker).prop("value")+html2;
			}
			console.log($(datepicker).prop("value"));
            return;
        }
    });
	$('#modal2').modal("hide");
});
event_coupon_search_btn.addEventListener("click", function(event){
    getList();
});