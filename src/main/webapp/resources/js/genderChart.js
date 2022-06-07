getGender();

function getGender(){
    $.ajax({
        type:"GET",
        url:"./gender",
        success:function(data){
            genderChart(data);
        },
        error:function(){
            alert("error 발생");
        }
    });
}

function genderChart(data){

// Create chart instance
var chart = am4core.create("genderChartdiv", am4charts.PieChart);

// Add data
chart.data = data;

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "value";
pieSeries.dataFields.category = "gender";



}

