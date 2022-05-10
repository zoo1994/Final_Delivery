<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>Question Detail</h1>
	<div class="container">
		<h2>NUM : ${vo.num}</h2>
		<h2>TITLE : ${vo.title}</h2>
		<h2>ID : ${vo.id}</h2>
		<h2>지역 : ${vo.location}</h2>
		<h2>문의종류 : ${vo.kind==1? '위생/청결':''}
		${vo.kind==2? '품질':''}
		${vo.kind==3? '서비스':''}
		${vo.kind==4? '기타':''}</h2>
		<h2>이메일 : ${vo.email}</h2>
		<h2>연락처 : ${vo.phone}</h2>
		<h2>DATE : ${vo.regDate}</h2>
		<h2>CONTENTS : ${vo.contents}</h2>
	</div>
	<a href="./update?num=${vo.num}" class="btn btn-primary">UPDATE</a>
	<a href="./delete?num=${vo.num}" class="btn btn-primary">DELETE</a>
	<a href="./list" class="btn btn-primary">리스트</a>
</body>
</html>
