<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>analytics</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script> -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>


</head>
<body>

	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<!-- <div style="margin-top: 200px;"></div> -->
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
	
<%-- <div style="width: 400px; height: 400px;">
	<canvas id="myChart" width="400px" height="400px"></canvas>
</div>

<script>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>	 --%>
	
	
	
	
	
	
	<div class="d-flex" style="min-height: 1000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">
				<div class="container" style=" margin-bottom: 200px;">
				
				
				
				<div>
					<p class="" style="padding-top: 50px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
						전체 점포 매출
					</p>
					<div style="display:block; width: 100%; height: 1000px;" id="salesTrendChartdiv"></div>
				</div>
				
				
				<div>
					<p class="mt-5" style="padding-top: 50px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
						시간대별 사용자 수 (Hour Active User)
					</p>
					<div style="display:block; width: 100%; height: 500px;" id="HAUChartdiv"></div>
				</div>
				
				<div>
					<p class="mt-5" style="padding-top: 50px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
						점포별 매출 & 배달건수 (최근 한달)
					</p>
					<div style="display:block; width: 100%; height: 500px;" id="shopSalesTrendChartdiv"></div>
				</div>
				
				<div class="d-flex mb-5">
					<div style="display:block; width: 50%;">
						<p class="mt-5" style="display:block; padding-top: 50px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
							일반회원 성별
						</p>
						<div style="display:block; width: 100%; height: 300px;" id="genderChartdiv"></div>
					</div>
					<div style="display:block; width: 50%;">
						<p class="mt-5" style="display:block; padding-top: 50px; font-size: 25px; font-weight: bold;"><i style="float: left; margin: 10px 5px; width: 15px; height: 15px; border: 5px solid orange; border-radius: 100%;"></i>
							일반회원 연령대
						</p>
						<div style="display:block; position:absolute; right:50px; width: 50%; height: 300px;" id="ageChartdiv"></div>
					</div>
					
					
				</div>						
				
				</div>
			</div>
		</div>
	</div>
	<div style=""></div>
<!-- <div style="margin-bottom: 200px;"></div> -->






<!-- Modal -->
<div class="modal  fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" id="modalHideX" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default2">쿠폰명　</span>
				  </div>
				  <input type="text" id="couponName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default3">할인가격</span>
				  </div>
				  <input type="text" id="couponDis" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default4">쿠폰기간</span>
				  </div>
				  <input type="text" id="couponValiTerm" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalHide" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="modalSave" class="btn btn-primary">Add</button>
      </div>
    </div>
  </div>
</div>


<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/adminCouponList.js"></script>
<script src="../resources/js/salesTrend.js"></script>
<script src="../resources/js/hau.js"></script>
<script src="../resources/js/shopSalesTrend.js"></script>
<script src="../resources/js/genderChart.js"></script>
<script src="../resources/js/ageChart.js"></script>

</body>
</html>