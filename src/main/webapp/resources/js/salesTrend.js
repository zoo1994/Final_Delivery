getSalesTrend();

function getSalesTrend(){
    $.ajax({
        type:"GET",
        url:"./salesTrend",
        success:function(data){
            SalesTrendChart(data);
        },
        error:function(){
            alert("error 발생");
        }
    });
}

function SalesTrendChart(data){
    // Apply chart themes
    am4core.useTheme(am4themes_animated);
    am4core.useTheme(am4themes_kelly);

    // Create chart instance
    var chart = am4core.create("salesTrendChartdiv", am4charts.XYChart);
    // Add data
    chart.data = data;

    // Create axes
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "y_month";
    categoryAxis.renderer.minGridDistance = 40;
    categoryAxis.title.text = "Month";

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.title.text = "전체 매출 (억)";

    // Create series
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.dataFields.valueY = "won";
    series.dataFields.categoryX = "y_month";
    series.name = "Sales";
    series.tooltipText = "{name}: [bold]{valueY}[/]";

    var series2 = chart.series.push(new am4charts.LineSeries());
    series2.dataFields.valueY = "user";
    series2.dataFields.categoryX = "y_month";
    series2.name = "User";
    series2.tooltipText = "{name}: [bold]{valueY}[/]";
    series2.strokeWidth = 3;

    // Add legend 컬럼별 색상 알림
    chart.legend = new am4charts.Legend();

    // Add cursor
    chart.cursor = new am4charts.XYCursor();

    // Add simple vertical scrollbar 오른쪽(상하) 스크롤바
    chart.scrollbarY = new am4core.Scrollbar();

    // Add horizotal scrollbar with preview 위쪽(좌우) 스크롤바
    var scrollbarX = new am4charts.XYChartScrollbar();
    scrollbarX.series.push(series);
    chart.scrollbarX = scrollbarX;
}


// var reqData = {};
// let a = getSalesTrend();
// console.log(a);




