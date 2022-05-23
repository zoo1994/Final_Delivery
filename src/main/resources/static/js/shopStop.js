const now = new Date();
// hour : 현재 시간
let hour = now.getHours();
// min : 현재 분
let min = now.getMinutes();
// minute : 분을 1의자리 올림 0~9 ->10 10~19->20 ...
let minute = Math.ceil(min/10)*10;

if(minute>50){
	hour++;
	minute = 0 ;
}
for(let i =0; i<12;i++){
	let addHour = hour+i;
	if(addHour>24){
		break;
	}
	let hourBox = "<option value="+addHour+'>'+addHour+"시</option>";
	$("#startHour").append(hourBox);
}
function makeStartMin(){
	for(let j=0; j<60;j=j+10){
		let addMin = minute+j;
		if(addMin>50){
			break;
		}
		let minBox = "<option value="+addMin+'>'+addMin+"분</option>";
		$("#startMinute").append(minBox);
	}
}

makeStartMin();
let finishHour = Number($("#startHour").val());
let finishMin = Number($("#startMinute").val())+30;
function makeFinishTime(){
	if(finishMin>=60){
		finishHour++;
		finishMin = finishMin-60;
	}
	$("#finishHour").text("");
	$("#finishMinute").text("");
	for(let i =0; i<24;i++){
		let addHour = finishHour+i;
		let next = "";
		if(addHour>23){
			addHour=addHour-24;
			next = "(다음날)"
		}
		let hourBox = "<option value="+addHour+'>'+addHour+'시'+next+"</option>";
		$("#finishHour").append(hourBox);
	}
	if($("#finishHour").val()!=finishHour){
		finishMin = 0;
	}
	for(let j=0; j<60;j=j+10){
		let addMin = finishMin+j;
		if(addMin>50){
			break;
		}
		let minBox = "<option value="+addMin+'>'+addMin+"분</option>";
		$("#finishMinute").append(minBox);
	}
}

makeFinishTime();

$("#startHour").change(function(){
	if($("#startHour").val()!=hour){
		$("#startMinute").text("");
		for(let i=0; i<51 ;i=i+10){
			let minBox = "<option value="+i+'>'+i+"분</option>";
			$("#startMinute").append(minBox);
		}
	}else{
		$("#startMinute").text("");
		makeStartMin();
	}
	finishHour = Number($("#startHour").val());
	finishMin = Number($("#startMinute").val())+30;
	makeFinishTime();
});
$("#startMinute").change(function(){
	finishHour = Number($("#startHour").val());
	finishMin = Number($("#startMinute").val())+30;
	makeFinishTime();
});
$("#finishHour").change(function(){
	$("#finishMinute").text("");
	if($("#finishHour").val()!=finishHour){
		finishMin = 0;
	}else{
		finishHour = Number($("#startHour").val());
		finishMin = Number($("#startMinute").val())+30;
		if(finishMin>=60){
			finishHour++;
			finishMin = finishMin-60;
		}
	}
	for(let j=0; j<60;j=j+10){
		let addMin = finishMin+j;
		if(addMin>50){
			break;
		}
		let minBox = "<option value="+addMin+'>'+addMin+"분</option>";
		$("#finishMinute").append(minBox);
	}
});