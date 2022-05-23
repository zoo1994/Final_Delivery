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

$("#couponClick").click(function() {

    console.log("start");

	let formData = new FormData();
    
	$.ajax({
		type:"POST",
		url:"../coupon/issuance",
        processData: false,
		contentType: false,
		success:function(data){
            if(data.trim()=='1'){
				alert("쿠폰 발급 성공");
			}else {
				alert("쿠폰 발급 실패");
			} 
		},
		error:function(){
			alert("error 발생");
		}
	});
});