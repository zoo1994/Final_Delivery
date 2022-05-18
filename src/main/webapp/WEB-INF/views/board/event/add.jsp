<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="eventVO" method="post" enctype="multipart/form-data">
				<div class="row mt-4">
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> 
						<form:input path="title" cssClass="form-control" id="title"/>
						<div>
							<form:errors path="title"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="id" class="form-label">Writer</label>
						<form:input path="id" cssClass="form-control" id="id" readonly="true" value="${member.id}"/> 
						<div>
							<form:errors path="id"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="contents" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>
					</div>
				</div>
				<div class="row justify-content-end">
					<button type="submit" class="col-1 btn btn-outline-success">Add</button>
				</div>
				<div id="fileResult"></div>
				<div>
					<button id="fileAdd" type="button" class="col-1 btn btn-outline-success">FileAdd</button>
				</div>
				<div class="row justify-content-end">
					<button id="addBtn" type="submit" class="col-1 btn btn-outline-success">Add</button>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript" src="../js/file.js"></script>
	<c:import url="../../temp/footer.jsp"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
<script type="text/javascript">

	//summernote
	$('#contents').summernote({
		height : 400
	});
	
</script>
</body>
</html>
