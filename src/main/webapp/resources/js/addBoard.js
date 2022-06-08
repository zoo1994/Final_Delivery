let title = false;
let writer = false;
let contents = false;

console.log($("#id").val());
function getUserType(){
    
    $.ajax({
		type:"GET",
		url:"./userType",
 		data:{
            id : $("#id").val()
		}, 
		success:function(data){
            if(data.trim()==0){

            }else{
                alert("접근권한이 없습니다.");
            }
		}
	});
}

$("#addBtn").click(function(){

    let length1 = $("#title").val().length;
    if(length1>0){
        console.log("title t");
        title=true;
    }else{
        console.log("title f");
        title=false;
    }

    let length2 = $("#contents").val().length;
    if(length2>0){
        console.log("contents t");
        contents=true;
    }else{
        console.log("contents f");
        contents=false;
    }

    if(title&&contents){
        $("#addForm").submit();
    }else{
        alert("정보를 모두 입력해주세요.")
    }
});