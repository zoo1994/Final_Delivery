<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 : ${vo.title}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<h1>Question Detail</h1>
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

	<div class="container">
		<c:choose>
			<c:when test="${vo.reply==1}">
				<div class="container border rounded">
		<div>
			<input type="hidden" id="num" value="${vo.num}"> 
			<label>답변</label>
			<div style="border-top: black solid 1px;">
			<div class="my-1 form-control border rounded" style="height: 300px">
			${vo.answerVO.contents}</div>
			</div>
		</div>
	</div>
				
				
			</c:when>
			<c:otherwise>
			<div class="d-flex justify-content-end" style="width: 100%">
				<c:if test="${vo.id == member.id}">
				<div>
					<a href="./update?num=${vo.num}" class="btn btn-primary">UPDATE</a>
					<a href="./delete?num=${vo.num}" class="btn btn-primary">DELETE</a>
					<a href="./list" class="btn btn-primary">리스트</a>
				</div>
				</c:if>
				<c:if test="${member.userType==0 && vo.reply==0}">
					<div>
						<a class="btn btn-success" id="answer" href="./answerAdd?num=${vo.num}">답변하기</a>
					</div>
				</c:if>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="../../temp/footer.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	
</body>
</html>
