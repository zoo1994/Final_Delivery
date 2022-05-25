// const eventNum1 = document.querySelector("#eventNum");
// console.log(eventNum1.value);
// console.log($("#eventNum1").val());

$("#eventDetailDeleteBtn").click(function() {

    console.log("start");

	let formData = new FormData();
	let eventNum = $("#eventNum").val();
    console.log(eventNum);
	formData.append("eventNum", eventNum);
    
	$.ajax({
		type:"POST",
		url:"./delete",
        processData: false,
		contentType: false,
 		data: formData, 
		success:function(data){
            if(data.trim()=='1'){
				alert("삭제 성공");
                window.location.href = './list';
			}else {
				alert("삭제 실패");
			} 
		},
		error:function(){
			alert("error 발생");
		}
	});
});
const event_detail_member = document.querySelector("#member");
const eventScheduleCompare = document.querySelector("#eventScheduleCompare");

$("#couponClick").click(function() {
	if(event_detail_member.getAttribute("value") == ""){
		alert("로그인이 필요합니다");
		window.location.href = '../member/login';
	}else{

		if(eventScheduleCompare.getAttribute("value") ==""){

		}else if((Number)(eventScheduleCompare.getAttribute("value")) < 0 ){
			alert("종료된 이벤트입니다");
			return;
		}


		console.log("start");
	
		let formData = new FormData();
		let couponId = $("#couponId").val();
		console.log(couponId);
		formData.append("couponId", couponId);
	
		$.ajax({
			type:"POST",
			url:"../coupon/issuance",
			data: formData,
			processData: false,
			contentType: false,
			success:function(data){
				if(data.trim()=='1'){
					alert("쿠폰 발급 성공");
				}else if(data.trim()=='-5') {
					alert("이미 쿠폰을 발급하셨습니다");
				}else {
					alert("쿠폰 발급 실패");
				} 
			},
			error:function(){
				alert("error 발생");
			}
		});
	}

});