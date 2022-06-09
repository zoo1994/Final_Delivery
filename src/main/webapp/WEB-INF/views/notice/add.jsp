<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가하기</title>

<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="noticeVO" method="post" id="addForm" enctype="multipart/form-data">
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
						<input name="id" class="form-control" id="id" readonly="readonly" value="${member.id}">
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
						<button id="addBtn" type="button" class="col-1 btn btn-outline-success" style="margin-right: 10px;">작성완료</button>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
	
<c:import url="../temp/footer.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>	
<script src="../resources/js/addBoard.js"></script>
<script type="text/javascript">
	//summernote

		$('#contents').summernote({
			height : 400
		});
</script>

</body>
</html>
