
getAge();

function getAge(){
    $.ajax({
        type:"GET",
        url:"./age",
        success:function(data){
            ageChart(data);
        },
        error:function(){
            alert("error 발생");
        }
    });
}


function ageChart(data){

    am4core.useTheme(am4themes_animated);

    var chart = am4core.create("ageChartdiv", am4charts.PieChart);
    chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

    chart.data = data;

    chart.innerRadius = am4core.percent(40);
    chart.depth = 120;

    chart.legend = new am4charts.Legend();
    chart.legend.position = "right";

    var pieSeries = chart.series.push(new am4charts.PieSeries());
    pieSeries.dataFields.value = "value";
    pieSeries.dataFields.depthValue = "value";
    pieSeries.dataFields.category = "ageGroup";
    pieSeries.slices.template.cornerRadius = 5;
    pieSeries.colors.step = 3;
}