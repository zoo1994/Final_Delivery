<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<input hidden id="admin_couponIssuance_count" value="${count}">
					<table class="table">
					  <thead class="table-light">
					    <tr class="row" style="height: 45px;">
					    	<th class="col-1 text-center d-flex align-items-center" style="padding: 0 auto;">NUM</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">COUPONID</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">발급갯수</th>
							<th class="col-4 text-center d-flex align-items-center"  style="">쿠폰번호</th>
							<th class="col-2 text-center d-flex align-items-center"  style="">발급사유</th>
							<th class="col-2 text-center d-flex align-items-center"  style="">발급일자</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">기타</th>
					    </tr>
					  </thead>
					  <tbody class="table-light">
							<c:forEach items="${list}" var="vo">
								<tr class="row" style="">
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.logNum}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.couponId}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.count}</td>
							    	<td class="col-4 text-center d-flex align-items-center" style=" ">${vo.couponNum}</td>		
							    	<td class="col-2 text-center d-flex align-items-center" style=" ">${vo.detail}</td>
							    	<td class="col-2 text-center d-flex align-items-center" style=" ">${vo.issuanceDate}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">
										<!-- Button trigger modal -->
										<button style="margin: 0 auto; font-weight: 500;" type="button" id="usDeleteBtn${vo.logNum}" class="deleteBtn btn btn-danger">
										  삭제
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
							  	<c:if test="${member.userType == 0}">
							  		<!-- <a href="./add" class="btn btn-primary" style="display: inline-block; ">ADD</a> -->
							  			<!-- Button trigger modal -->
										<button style="margin: 0 auto; font-weight: 500;" type="button" id="modalBtn" data-name="" class="modalBtn btn btn-primary" data-toggle="modal2" data-target="#modal2">
										  ADD
										</button>
							  	</c:if>
							  </span>
							</nav>