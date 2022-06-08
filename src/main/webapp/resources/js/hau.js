getHAU();

function getHAU(){
    $.ajax({
        type:"GET",
        url:"./HAU",
        success:function(data){
            getHAUChart(data);
        },
        error:function(){
            alert("error 발생");
        }
    });
}


function getHAUChart(data){
// Apply chart themes
am4core.useTheme(am4themes_animated);

var chart = am4core.create("HAUChartdiv", am4charts.XYChart);
chart.maskBullets = false;

var xAxis = chart.xAxes.push(new am4charts.CategoryAxis());
var yAxis = chart.yAxes.push(new am4charts.CategoryAxis());

xAxis.dataFields.category = "weekday";
yAxis.dataFields.category = "hour";

xAxis.renderer.grid.template.disabled = true;
xAxis.renderer.minGridDistance = 40;

yAxis.renderer.grid.template.disabled = true;
yAxis.renderer.inversed = true;
yAxis.renderer.minGridDistance = 30;

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "weekday";
series.dataFields.categoryY = "hour";
series.dataFields.value = "value";
series.sequencedInterpolation = true;
series.defaultState.transitionDuration = 3000;
series.columns.template.width = am4core.percent(100);
series.columns.template.height = am4core.percent(100);

series.heatRules.push({target:series.columns.template, property:"fill", min:am4core.color("#ffffff"), max:am4core.color("#9b0000")});

var columnTemplate = series.columns.template;
columnTemplate.strokeWidth = 2;
columnTemplate.strokeOpacity = 1;
columnTemplate.stroke = am4core.color("#ffffff");
columnTemplate.tooltipText = "{weekday}, {hour}: {value.workingValue.formatNumber('#.')}";

// heat legend
var heatLegend = chart.bottomAxesContainer.createChild(am4charts.HeatLegend);
heatLegend.width = am4core.percent(100);
heatLegend.series = series;
heatLegend.valueAxis.renderer.labels.template.fontSize = 9;
heatLegend.valueAxis.renderer.minGridDistance = 30;

// heat legend behavior
series.columns.template.events.on("over", (event) => {
	handleHover(event.target);
})

series.columns.template.events.on("hit", (event) => {
	handleHover(event.target);
})

function handleHover(column) {
	if (!isNaN(column.dataItem.value)) {
		heatLegend.valueAxis.showTooltipAt(column.dataItem.value)
	}
	else {
		heatLegend.valueAxis.hideTooltip();
	}
}

series.columns.template.events.on("out", (event) => {
	heatLegend.valueAxis.hideTooltip();
})

 chart.data = data;
}

//[
// 	{
// 		"hour": "12pm",
// 		"weekday": "Sun",
// 		"value": 2990
// 	}]