<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<table class='table'>   			
     <thead class="table-primary">
	     <tr>
		     <th>메뉴명</th>
		     <th>판매수량</th>
		     <th>가격</th>
	     </tr>
     </thead>
   	<tbody>
   		<c:forEach items="${list}" var='vo'>
	   		<tr>
		  		<td>${vo.menuName}</td>
		   		<td>${vo.sumC}</td>
		   		<td class="sump">${vo.sumP}</td>
	   		</tr>
   		</c:forEach>
   	</tbody>
   	<tfoot>
   		<tr>
   			<td>총액</td>
   			<td></td>
   			<td id="total"></td>
   		</tr>
   	</tfoot>
</table>
<script>
	total = 0;
	$(".sump").each(function(idx,item){
		total = total+Number(item.innerHTML);
		$("#total").html(total);
	})
	
</script>