<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input hidden id="event_count" value="${count}">
<c:forEach items="${list}" var="vo">

	<div class="card detail mb-3 shadow mb-5 bg-white rounded" style="width: 31.5%; margin: 0 10px; height: 438px; padding: 0 0;">
		<c:if test="${not empty vo.filesVO[0]}"><a href="./detail?eventNum=${vo.eventNum}"><img src="/resources/upload/board/event/${vo.filesVO[0].fileName}" class="card-img-top" alt="..." style="width: 100%; height: 300px;"></a></c:if>
			
		<div class="card-body">			
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="./detail?eventNum=${vo.eventNum}">${vo.title}</a></li>
			</ul>
		</div>
	</div>

</c:forEach>

<c:if test="${pager.pn * pager.perPage < count}">
	<div class="moreBtn" id="moreBtn" style="text-align: center; margin-top: 50px;">
		<a href="javascript:more();" class="more" style=""><img style="width: 100px; height: 100px;" alt="" src="../../upload/board/event/더하기.png"></a>
		
	</div>
</c:if>

