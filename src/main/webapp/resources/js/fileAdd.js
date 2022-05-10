/**
 * 글 작성시 첨부파일 관리하는 JS
 */
  let count = 0;
 
//파일삭제
function fileDeleteInit() {
	$(".del").click(function() {
		let check = window.confirm("정말 삭제하시겠습니까?");
		
		if(!check) { 
			return;
		}
		let fileNum = $(this).attr("data-num");
		let selector = $(this);
		//console.log(this); //event.target 클릭한 element
		console.log(selector);
		$.ajax({
			type:"POST",
			url:"./fileDelete",
			data:{
				fileNum:fileNum
			},
			success:function(data){
				//console.log(this);//ajax 객체
				console.log(selector);
				if(data.trim() == '1') {			
					$(selector).parent().remove();
					count--;
					alert("파일이 삭제되었습니다");
				}else {
					alert("파일 삭제 실패!")
				}
			},
			error:function(){
				alert("파일 삭제 실패");
			}
		})
	});
}
 
 function fileAddInit(c) {
	
	count = c;
	
	$("#fileAdd").click(function() {
		if(count>=1){
			alert('최대 1개만 가능');
			return;
		}
		let result = '<div class="row mb-3">';
		result = result + '<label for="file" class="col-sm-2 col-form-label">File</label>'
		result = result + '<div class="col-sm-10 input-group">'
		result = result + '<input type="file" name="file" class="form-control" id="file">'
		result = result + '<button class="btn btn-outline-secondary del" type="button">X</button>'
		result = result + '</div>';
		result = result + '</div>';
		$("#fileResult").append(result);
		count++;
	});
	
	$("#fileResult").on("click", ".del", function() {
		$(this).parent().parent().remove();
		count--;
	} );
}