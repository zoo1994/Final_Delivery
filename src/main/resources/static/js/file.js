let v = '<div class="mb-3 d-flex"><input class="col-10 form-control form-control-lg" type="file" name="files" style="width: 97%; margin-right: 5px;"><button  type="button" class="btn btn-outline-success delBtn">x</button></div>'
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
});