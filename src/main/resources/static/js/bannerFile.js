/**
 * 
 */
 let v = '<div class="row mb-3 image-container">'
 v = v + '<label for="files" class="col-sm-2 col-form-label">추가할 배너 이미지</label>'
 v = v + '<div class="col-6 input-group">'
 v = v + '<input type="file" name="files" class="form-control" id="input-image">'
 v = v + '<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">추가</button></div>';
v = v+ '<img style="width: 600px;" class="mt-4" id="preview-image" src="https://dummyimage.com/600x300/ffffff/000000.png&text=preview+image"></div>';


let count = 0;

function fileAddInit(c) {
	
	count = c;
	
	$("#fileAdd").click(function() {
		if(count>4){
			alert('최대 5개만 가능');
			return;
		}
		$("#fileResult").append(v);
		count++;
	});

/* 	$("#fileResult").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	} ); */
}