<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<input hidden id="admin_member_count" value="${count}">
					<table class="table" style="word-break:break-all;">
					  <thead class="table-light">
					    <tr class="row" style="height: 45px;">
					    	<th class="col-1 text-center d-flex align-items-center" style="padding: 0 auto;">ID</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">PW</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">성명</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">EMAIL</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">전화번호</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">포인트</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">성별</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">주소</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">상세주소</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">생일</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">등급</th>  
							<th class="col-1 text-center d-flex align-items-center"  style="">기타</th> 
					    </tr>
					  </thead>
					  <tbody class="table-light">
							<c:forEach items="${list}" var="vo">
								<tr class="row" style="">
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.id}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.pw}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.name}</td>		
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.email}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.phone}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.point}</td>	
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.gender == 0 ? "남성" : "여성"}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.roadAddress}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.detailAddress}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.birth}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">
							    		<c:choose><c:when test="${vo.userType == '0'}">관리자</c:when><c:when test="${vo.userType == '1'}">점주</c:when><c:otherwise>일반회원</c:otherwise></c:choose>
							    	</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">
										<button style="font-weight: 500;" type="button" id="modalBtn${vo.id}" data-name="${vo.name}" data-type="${vo.userType}" class="modalBtn btn btn-success" data-toggle="modal" data-target="#modal">
											등급수정
										</button>
							    	</td>
							    </tr>
							</c:forEach>

					  </tbody>				  
					  <tfoot class="table-light">
					    <tr></tr>
					  </tfoot>
					</table>
					
						<nav aria-label="Page navigation example mt-5 bs-warning" style="margin-top: 20px;">
							<span class="col-2" style="display: inline-block;"></span>
							<span class="col-8" style="display: inline-block;">
							  <ul class="pagination justify-content-center" style="display: flex; width: 90%; margin: 0 auto;">
				<%-- 			  	<li class="page-item"><button class="page-link" href="./list?pn=${pager.startNum-1}"><<</button></li> --%>
							  	<c:if test="${pager.pre}">
							    	<li class="page-item"><button class="page-link" data-page="${pager.startNum-1}" data-search="${pager.search}">prev</button></li>
							    	

							    </c:if>
							   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i"><!--  data-page="${pager.startNum-1}" data-kind="${pager.kind}" data-search="=${pager.search} -->
							   		<li class="page-item"><button class="page-link"  data-page="${i}" data-search="${pager.search}">${i}</button></li>
							   	</c:forEach>
							    <c:if test="${pager.next}">
							   		<li class="page-item"><button class="page-link" data-page="${pager.lastNum+1}" data-search="${pager.search}">next</button></li>
							    </c:if>
				<%-- 			    <li class="page-item"><button class="page-link" href="./list?pn=${pager.lastNum+1}">>></button></li> --%>
							  </ul> 
							  </span> 
							  <span class="col-2" style="display: inline-block; text-align: end; width: 15%;">
							  </span>
							</nav>