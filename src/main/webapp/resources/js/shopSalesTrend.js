getShopSalesTrend();

function getShopSalesTrend(){
    $.ajax({
        type:"GET",
        url:"./shopSalesTrend",
        success:function(data){
            shopSalesTrendChart(data);
        },
        error:function(){
            alert("error 발생");
        }
    });
}

function shopSalesTrendChart(data){
    // Apply chart themes
    am4core.useTheme(am4themes_animated);
    am4core.useTheme(am4themes_kelly);

    // Create chart instance
    var chart = am4core.create("shopSalesTrendChartdiv", am4charts.XYChart);
    // Add data
    chart.data = data;

    // Create axes
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "shopName";
    categoryAxis.renderer.minGridDistance = 40;
    categoryAxis.title.text = "Shop";

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.title.text = "매장 매출 (억)";

    // Create series
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.dataFields.valueY = "won";
    series.dataFields.categoryX = "shopName";
    series.name = "Sales";
    series.tooltipText = "{name}: [bold]{valueY}[/]";

    var series2 = chart.series.push(new am4charts.LineSeries());
    series2.dataFields.valueY = "value";
    series2.dataFields.categoryX = "shopName";
    series2.name = "Orders";
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




