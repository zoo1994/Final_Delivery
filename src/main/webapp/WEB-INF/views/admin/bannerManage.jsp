<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너관리</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>

	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>

<!-- 	<div style="margin-top: 200px;"></div> -->
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
		<div class="d-flex" style="min-height: 1000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container-fluid"  style=" margin-bottom: 200px;">

					<div class="row">
						<div class="col-1 mt-4">
							<button type="button" class="btn btn-primary addBtn" id="fileAdd">새로운
								배너 이미지 추가</button>
							<!-- 	<button type="button" class="btn btn-warning" id="fileUpdate">배너 변경</button> -->
						</div>
						<div class="col-11 bannerResult mt-4">
							<p class="" style="padding-bottom: 20px; padding-top: 40px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
								현재 적용된 배너 이미지
							</p>
							<c:choose>
								<c:when test="${not empty list}">
									<div class="imgContainer row">
										<c:forEach items="${list}" var="vo" varStatus="i">
											<div class="card col-2 mx-2 my-2" style="width: 18rem;">
												<img src="../resources/upload/banner/${vo.fileName}"
													class="card-img-top" style="height: 120px;">
												<div class="card-body">
													<h5 class="card-title">${i.index+1}번째이미지</h5>
													<button type="button" class="del btn btn-danger"
														data-num="${vo.fileNum}" data-name="${vo.fileName}">이미지
														삭제</button>
												</div>

											</div>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									현재 파일 없음
								</c:otherwise>
							</c:choose>

							<div class="row">
								<form action="./bannerAdd" method="post"
									enctype="multipart/form-data">
									<div class="fileResult col-4"></div>
									<button type="submit" class="btn btn-success">INSERT</button>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript">
	let count = 0;
	if(${fn:length(list) != 0}) {
		count = ${fn:length(list)};
	}
	
	console.log(count);
	$(".addBtn").click(function() {
		if(count>4) {
			alert("최대 5개까지만 추가 가능합니다.");
			return;
		}
		let result = '<div class="input-group mb-2">';
		result = result + '<input name="files" type="file" class="form-control files input-image" aria-describedby="inputGroupFileAddon04" aria-label="Upload">'
		result = result + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>'
		result = result + '	<img class="mt-4 preview-image" style="width: 700px; background-color:white;" src="https://dummyimage.com/700x400/ffffff/000000.png&text=preview+image">';
		result = result + '</div>';
		$(".fileResult").append(result);
		count++;
		//이미지 업로드시 이미지 미리보기 추가
		$('.input-image').each(function(index,item){
			$(this).change(function(event) {
				//preiew-image class 선택
				let pre = $(this).next().next();
				console.log(pre);
				  let file = event.target.files[0];
				  let reader = new FileReader(); 
				    reader.onload = function(e) {
				        pre.attr("src", e.target.result);
				    }

				    reader.readAsDataURL(file);
			})
		});
		
		
	});
	
	$(".fileResult").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	} );
	
	$(".del").click(function() {
		let check = window.confirm("삭제하면 복구가 불가능합니다. 삭제하시겠습니까?")
		if (check) {
			let fileNum = $(this).attr("data-num");
			let fileName = $(this).attr("data-name");
			let select = $(this)
			console.log(select);
		 	$.ajax({
				type: "post",
				url: "./fileDelete",
				data: {
					fileNum: fileNum,
					fileName : fileName
				},
				success: function(data) {
					if (data.trim() == '1') {
						select.parent().parent().remove();
						alert("배너 이미지가 삭제되었습니다.");
						count--;
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
</script>
<script src="../resources/js/footerNoMargin.js"></script>
</body>
</html>