<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>detail Page</h1>
	<h3>menuName : ${vo.menuName}</h3>
	<h3>Price : ${vo.price}</h3>
	<h3>첨부파일 : ${vo.menuFileVO.oriName}</h3>
	<img alt="" src="../resources/upload/menu/${vo.menuFileVO.fileName}">
	
	<a href="./update?menuNum=${vo.menuNum}">update</a>
	<a href="./delete?menuNum=${vo.menuNum}">delete</a>
</body>
</html>