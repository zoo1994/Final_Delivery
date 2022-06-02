<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<input hidden id="admin_email_count" value="${count}">

					<div class="accordion" id="accordionExample" style="border-top: 1px solid black;">
						<c:forEach items="${list}" var="vo" varStatus="i">
			  				<div class="accordion-item" style="border-bottom: 1px solid black;">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button bg-light collapsed " style="font-weight: bold; background-color: rgb(190,194,199);" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i.count}" aria-expanded="false" aria-controls="collapseOne">
						        <span class="col-1" style="padding: 0 auto;">${vo.emailNum}</span> 
						        <span class="col-3">${vo.receiver}</span>
						        <span class="col-6">${vo.title}</span> 				       
						        <span class="col-1">${vo.sendDate}</span>
						      </button>
						    </h2>
						    <div id="collapse${i.count}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						      <div class="accordion-body d-flex">
						        <span class="col-1" style="color: #fd7e14; text-align: center; font-weight: bold;">　</span>
						        <span class="col-11">${vo.contents}</span>
						        <strong></strong> 
						      </div>
						    </div>
						  </div>
					  	</c:forEach>
					</div>
					
					
					
					
					
<%-- 					<table class="table">
					  <thead class="table-light">
					    <tr class="row" style="height: 45px;">
					    	<th class="col-1 text-center d-flex align-items-center" style="padding: 0 auto;">NUM</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">수신자</th>
							<th class="col-2 text-center d-flex align-items-center"  style="">제목</th>
							<th class="col-6 text-center d-flex align-items-center"  style="">내용</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">발신일</th>
							<th class="col-1 text-center d-flex align-items-center"  style="">기타</th>
					    </tr>
					  </thead>
					  <tbody class="table-light">
							<c:forEach items="${list}" var="vo">
								<tr class="row" style="">
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.emailNum}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.receiver}</td>
							    	<td class="col-2 text-center d-flex align-items-center" style=" ">${vo.title}</td>		
							    	<td class="col-6 text-center d-flex align-items-center" style=" ">${vo.contents}</td>
							    	<td class="col-1 text-center d-flex align-items-center" style=" ">${vo.sendDate}</td>

							    	<td class="col-1 text-center d-flex align-items-center" style=" ">
							    		<!-- Button trigger modal -->
										<button style="margin: 0 auto; font-weight: 500;" type="button" id="modalBtn${vo.emailNum}" data-name="" data-type="" class="modalBtn btn btn-info" data-toggle="modal" data-target="#modal">
										  변경
										</button>
							    	</td>
							    </tr>
							</c:forEach>

					  </tbody>				  
					  <tfoot class="table-light">
					    <tr></tr>
					  </tfoot>
					</table> --%>
					
						<nav aria-label="Page navigation example mt-5 bs-warning" style="margin-top: 20px;">
							<span class="col-2" style="display: inline-block;"></span>
							<span class="col-8" style="display: inline-block;">
							  <ul class="pagination justify-content-center" style="display: flex; width: 90%; margin: 0 auto;">
				<%-- 			  	<li class="page-item"><button class="page-link" href="./list?pn=${pager.startNum-1}"><<</button></li> --%>
							  	<c:if test="${pager.pre}">
							    	<li class="page-item"><button class="page-link" data-page="${pager.startNum-1}" data-search="${pager.search}" data-kind="${pager.kind}">prev</button></li>
							    	

							    </c:if>
							   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i"><!--  data-page="${pager.startNum-1}" data-kind="${pager.kind}" data-search="=${pager.search} -->
							   		<li class="page-item"><button class="page-link"  data-page="${i}" data-search="${pager.search}" data-kind="${pager.kind}">${i}</button></li>
							   	</c:forEach>
							    <c:if test="${pager.next}">
							   		<li class="page-item"><button class="page-link" data-page="${pager.lastNum+1}" data-search="${pager.search}" data-kind="${pager.kind}">next</button></li>
							    </c:if>
				<%-- 			    <li class="page-item"><button class="page-link" href="./list?pn=${pager.lastNum+1}">>></button></li> --%>
							  </ul> 
							  </span> 
							  <span class="col-2" style="display: inline-block; text-align: end; width: 15%;">

							  </span>
							</nav>