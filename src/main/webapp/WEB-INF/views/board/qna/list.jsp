<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>

	<div class="container mt-5" style="font-size: 1.125rem;">
		<div>
			<div class="help_infotxt"
				style="height: 435px; padding: 70px 600px 0 0; background: url(https://www.burgerking.co.kr/dist/img/bg_CS.c6388a10.jpg) no-repeat 100% 100%;">
				<p class="tit"
					style="font-weight: 400; font-size: 3rem; color: #773a2c;">
					<span>고객의 의견에 </span><span>귀 기울입니다</span>
				</p>
				<p class="txt"
					style="font-family: SDGothic, HGG, Malgun Gothic, '\B9D1\C740 \ACE0\B515', dotum, '\B3CB\C6C0', sans-serif;">
					<span>언제나 고객의 의견에 귀 기울이며 더 나은 서비스 이용 경험을 제공하고자 노력하고 있습니다.</span><span>궁금하신
						사항이 있거나 문제를 해결하는데 도움이 필요하신 경우<a href="../faq/list"><strong>FAQ
								페이지</strong></a>에서 도움을 받으실 수 있습니다.
					</span>
				</p>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty list}">

				<table class="table">
					<thead>
						<tr>
							<th scope="col" width="10%">Num</th>
							<th scope="col" width="50%">Title</th>
							<th scope="col" width="15%">ID</th>
							<th scope="col" width="15%">Date</th>
							<th scope="col" width="10%">처리상태</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="vo">
							<tr>
								<th scope="row">${vo.num}</th>
								<td><a href="./detail?num=${vo.num}"> ${vo.title} </a></td>
								<td>${vo.id}</td>
								<td>${vo.regDate}</td>
								<td>${vo.reply==1? '상담완료':'접수중'}</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link"
								href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${kind}&search=${search}">&lt;</a></li>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li class="page-item"><a class="page-link"
									href="./list?pn=${i}&kind=${kind}&search=${search}">${i}</a></li>
							</c:forEach>

							<li class="page-item"><a class="page-link"
								href="./list?pn=${pager.next? pager.lastNum+1:pager.lastNum}&kind=${kind}&search=${search}">&gt;</a></li>
						</ul>
					</nav>
				</div>
			</c:when>
			<c:otherwise>
				<div class="border rounded d-flex justify-content-center align-items-center"
					style="height: 300px">
					<h1>문의 내역이 없습니다.</h1>
				</div>
			</c:otherwise>
		</c:choose>
		<c:if test="${member.userType>0}">
		<div class="d-flex justify-content-end mt-2">
			<a href="./add" class="btn btn-primary col-1">ADD</a>
			<div style="width: 50px"></div>
		</div>
		</c:if>
	</div>
	<c:import url="../../temp/footer.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
</body>
</html>
