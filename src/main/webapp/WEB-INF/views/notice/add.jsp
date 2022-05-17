<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
<h1>hi</h1>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="noticeVO" method="post" enctype="multipart/form-data">
				<div class="row mt-4">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">Title</label> 
						<form:input path="title" cssClass="form-control" id="title"/>
						<div>
							<form:errors path="title"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput2" class="form-label">Writer</label>
						<form:input path="id" cssClass="form-control" id="id" readonly="readonly" value="${member.id}"/> 
						<div>
							<form:errors path="id"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>
					</div>
				</div>
				<div class="row mb-4">
					<label for="files" class="col-sm-2 col-form-label">File</label>
					<div class="col-sm-10">
						<input type="file" name="files" class="form-control" id="files">
					</div>
				</div>
				<div class="row justify-content-end">
					<c:if test="${member.userType == 0}">
						<button id="addBtn" type="submit" class="col-1 btn btn-outline-success">Add</button>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
	
<c:import url="../temp/footer.jsp"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
	
<script type="text/javascript">
	//summernote

		$('#contents').summernote({
			height : 400
		});
		
/* 		$('#add').click(function(){
			
			let formData = new FormData();
			let id = $('#id').val();
			let location = $('#location').val();
			let kind = 0;
			$('.form-check-input').each(function(idx,item){
				if(item.checked){
					kind = $(item).val();
				}
			});
			let email = $('#email').val();
			let phone = $('#phone').val();
			let title = $('#title').val();
			let contents = $('#contents').summernote("code");
			
			formData.append("id",id);
			formData.append("location",location);			
			formData.append("kind",kind);			
			formData.append("email",email);			
			formData.append("phone",phone);			
			formData.append("title",title);			
			formData.append("contents",contents);
			$('.form-control-lg').each(function(idx,item){
				formData.append("files",item.files[0]);
			})
					
			console.log(formData);
			
			$.ajax({
				method:"POST",
				url:"./add",
				processData:false,
				contentType:false,
				data:formData,
				success:function(data){
					if(data.trim()=='1'){
						alert("문의를 접수했습니다.");
						window.location.assign("./addSuccess");
					}
				},
				error:function(){
					alert("다시 시도해주세요.");
				}
			}) */
			


</script>

</body>
</html>
