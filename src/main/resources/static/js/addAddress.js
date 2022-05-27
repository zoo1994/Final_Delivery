$("#addBtn").click(function() {
	$("#detailAddress").val("");
	$("#detailAddress").attr("placeholder", "상세주소를 입력해주세요");
});
$("#goBtn").click(function() {
	if ($("#detailAddress").val() == "") {
		alert("상세주소를 입력해주세요");
		return;
	}
	const geocoder = new kakao.maps.services.Geocoder();
	//주소로 좌표를 검색합니다
	geocoder.addressSearch($("#roadAddress").val(), function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			let x = result[0].x;
			let y = result[0].y;
			$("#x").val(x);
			$("#y").val(y);
			$("#location").val($("#roadAddress").val());
			$("#input_postcode").val($("#postcode").val());
			$("#detailLocation").val($("#detailAddress").val());
			$("#goDeli").submit();
		}

	});
})

