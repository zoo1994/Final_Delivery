const now = new Date();
let hour = now.getHours();
let min = now.getMinutes();
let minute = Math.ceil(min/10)*10;
for(let i =0; i<12;i++){
	let addHour = hour+i;
	if(addHour>24){
		break;
	}
	let hourBox = "<option value="+addHour+'>'+addHour+"시</option>";
	$("#startHour").append(hourBox);
}
function makeMin(){
	for(let j=0; j<60;j=j+10){
		let addMin = minute+j;
		if(addMin>50){
			break;
		}
		let minBox = "<option value="+addMin+'>'+addMin+"분</option>";
		$("#startMinute").append(minBox);
	}
}
makeMin();
$("#startHour").change(function(){
	if($("#startHour").val()!=hour){
		$("#startMinute").text("");
		for(let i=0; i<51 ;i=i+10){
			let minBox = "<option value="+i+'>'+i+"분</option>";
			$("#startMinute").append(minBox);
		}
	}else{
		$("#startMinute").text("");
		makeMin();
	}
});