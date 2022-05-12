<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
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
						<form:input path="id" cssClass="form-control" id="id" readonly="readonly" value="로그인기능"/> 
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
					<button id="addBtn" type="submit" class="col-1 btn btn-outline-success">Add</button>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>
