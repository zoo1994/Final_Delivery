<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<h1>Answer</h1>
	<div class="container border my-5">


		<table class="table" style="display: table;">
			<colgroup>
				<col style="width: 20%">
				<col style="width: 30%">
				<col style="width: 20%">
				<col style="width: 30%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">등록일</th>
					<td>${vo.regDate}</td>
					<th scope="row">처리상태</th>
					<td id="state">${vo.reply==0? '접수중':'상담완료' }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><span id="title">${vo.title}</span></td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td colspan="3" id="history">
						<div class="tbl_content_bx">${vo.contents }</div>
					</td>
				</tr>
				<tr id="fileTr" class="nexon-hide">
					<c:if test="${not empty vo.filesVOs}">
						<th scope="row">첨부파일</th>
						<td colspan="3"><c:forEach items="${vo.filesVOs}" var="f">
								<div>
									<a href="../upload/board/qna/${f.fileName}" download>${f.fileName}</a>
								</div>
							</c:forEach></td>
					</c:if>
				</tr>

			</tbody>
		</table>
	</div>
	<div class="container border rounded">
		<div>
			<input type="hidden" id="num" value="${vo.num}"> 
			<label>답변 작성</label>
			<textarea class="form-control my-2"
				id="contents" style="width: 100%; height: 300px"></textarea>
		</div>
		<div class="d-flex justify-content-end">
			<button class="btn btn-success my-2" id="answer">답변완료</button>
		</div>
	</div>



	<c:import url="../../temp/footer.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	<script type="text/javascript">
		$("#answer").click(function(){
			$.ajax({
				method:"POST",
				url:"./answerAdd",
				data:{
					num:$("#num").val(),
					contents:$("#contents").val()
				},
				success:function(data){
					if(data.trim()=='1'){						
					alert("답변 등록 완료");
					window.location.assign("./list");
					}
				},
				error:function(){
					alert("실패");
				}
			})
			
		})
	</script>
</body>
</html>
