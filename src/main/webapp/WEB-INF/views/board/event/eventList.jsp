<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="vo">
	<div class="card detail mb-3 shadow mb-5 bg-white rounded" style="width: 30%; margin: 0 10px; height: 438px; padding: 0 0;">
		<c:if test="${not empty vo.filesVO[0]}"><img src="/resources/upload/board/event/${vo.filesVO[0].fileName}" class="card-img-top" alt="..." style="width: 100%; height: 300px;"></c:if>
		<div class="card-body">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="./detail?eventNum=${vo.eventNum}">num : ${vo.eventNum}</a></li>
				<li class="list-group-item">id : ${vo.id}</li>
			</ul>
		</div>
	</div>
</c:forEach>
<div class="moreBtn" id="moreBtn">
	<a href="javascript:more();" class="more">더보기</a>
</div>