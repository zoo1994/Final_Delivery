<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="noticeVO" method="post" enctype="multipart/form-data">
				<form:hidden path="num" />
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
						<form:input path="id" cssClass="form-control" id="id" readonly="readonly" /> 
						<div>
							<form:errors path="id" ></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label" id="content"></label>
						<form:textarea path="contents" id="contents" cssClass="form-control"/>
						<div>
							<form:errors path="contents"></form:errors>
						</div>
<%-- 						<c:forEach items="${noticeVO.filesVO}" var="i">
    						<h3>${i.oriName}<button type="button" id="fileDel" data-num="${i.fileNum}" data-name="${i.fileName}" >삭제</button></h3>
    					</c:forEach> --%>
					</div>
				</div>
				
		<button id="fileAdd" type="button" class="btn btn-danger d-block my-4">FileADD</button>  
		 
		<div>
			<c:if test="${not empty noticeVO.noticeFilesVO}">
				<h4>${noticeVO.noticeFilesVO.oriName}<button class="del btn btn-danger" type="button" data-num="${noticeVO.noticeFilesVO.fileNum}">DELETE</button></h4>
			</c:if>
		</div>  
		  
		<div id="fileResult">
			
		</div>				
				
			


				
		<div class="row justify-content-end">
			<button type="submit" class="col-1 btn btn-outline-success">수정</button>
		</div>
		</form:form>
		</div>
	</div>
<script src="../resources/js/noticeFileAdd.js"></script>
<script type="text/javascript">
	fileAddInit(${not empty noticeVO.noticeFilesVO?1:0});
	fileDeleteInit();
</script>

</body>
</html>
