//const noticeFileResult = document.querySelector("#fileResult");


/**
 *  글작성시 첨부파일 관리하는 JS
 */

 let count=0;
 
 
 function fileDeleteInit(){
    $(".del").click(function(){
        let check = window.confirm("영구히 삭제 됩니다. 삭제하시겠습니까???");
        
        if(!check){
            return;
        }
        
        let fileNum = $(this).attr("data-num");
        let selector = $(this);
        //console.log(this);//event.target 클릭한 element
        console.log(selector);
        $.ajax({
            type:"POST",
            url: "./fileDelete",
            data:{
                fileNum:fileNum
            },
            success:function(data){
                //console.log(this);//ajax 객체
                console.log(selector);
                if(data.trim()=='1'){
                    $(selector).parent().remove();
                    count--;
                }else {
                    alert("파일 삭제 실패!!");
                }
            },
            error:function(){
                alert("File 삭제 실패");
            }
            
        });
        
    });
}


 function fileAddInit(c){
    
    count=c;

     

    $("#fileAdd").click(function() {
        if(count>0){
            alert('최대 1개만 가능');
            return;
        }
        let result = '<div class="input-group">';
        result = result + '<input name="files" type="file" class="form-control files" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">'
        result = result + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>'
        result = result + '</div>';
        $("#fileResult").append(result);
        count++;
    });
    
    $("#fileResult").on("click", ".del", function() {
        $(this).parent().remove();
        count--;
    } );

}








/*
replyResult.addEventListener("click", function(event){
    if(event.target.classList.contains('update')){


    }


});

function getNoticeFile(){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./getNoticeFile/list?num="+num.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            console.log(this.responseText);
            replyResult.innerHTML = this.responseText.trim();
        }
    }


};



getList();

function getList(){
    const xhttp2 = new XMLHttpRequest();

    xhttp2.open("GET", "../qnasReply/list?num="+num.value);

    xhttp2.send();

    xhttp2.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            console.log(this.responseText);
            replyResult.innerHTML = this.responseText.trim();
        }
    }

}

reply.addEventListener("click", function(){
    
    //console에 num, id, contents 출력
    console.log(num.value);
    console.log(id.value);
    console.log(contents.value);

    //1. JS에서 요청 객체 생성(준비)
    const xhttp = new XMLHttpRequest();

 
    //요청 정보 입력
    //open('method형식', 'URL주소')
    xhttp.open("POST", "../qnasReply/add");


    //요청 header 정보
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //요청 전송
    //post 요청시 파라미터
    //send("이름=값&이름2=값2...")
    xhttp.send("num="+num.value+"&id="+id.value+"&contents="+contents.value);

    //응답 처리
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            console.log(this.responseText);
            let result = this.responseText.trim();
            if(result=='1'){
                alert('댓글이 등록 되었습니다');
                getList();
            }else {
                alert('댓글 등록이 실패');
            }
        }
    }



});
*/
console.log("연결");