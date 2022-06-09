<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png"
	rel="shortcut icon" type="image/x-icon">
	<title>error</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
		<section class="container" style="margin-top:50px; text-align: center;" id="container">
			<div class="content">
				<div class="contArea">
					<div class="inner">
						<div class="error">
							<div><img alt="" src="../resources/image/noresult.png"></div>
							<div class="mt-5">
								<strong style="font-weight: 600; font-size: 30px;"><p style="margin: 0;">Page Not Found</p>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</strong>
							</div>
							<p class="mt-3" style="color: rgb(128, 128, 128); font-weight: 600; font-size: 16px;">방문하시려는 페이지 주소가 잘못 입력되었거나, 페이지 주소가 변경 또는 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br>관련 문의사항은 고객문의를 이용해주세요.</p>
						</div>
						<div class="btnArea mt-5" style="">
							<a href="/" style="display:inline-block ; color: #fff; background: #da0000; margin: 0 12px; padding: 0 50px; width:300px; height: 90px; text-decoration: none;  font-size: 18px; line-height: 90px; border-radius: 90px;" class="">맥도날드 메인으로 가기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>
