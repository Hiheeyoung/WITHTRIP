<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<title>WITHTRIP :: 함께라서 좋은 여행</title>
<script src="resources/js6/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- 아이콘 fontawesome -->
   <script src="https://kit.fontawesome.com/fa40c2d47c.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Raleway&display=swap" rel="stylesheet"></head>
<style>
html{
   font-family: 'Noto Sans KR', sans-serif;
   font-family: 'Raleway', sans-serif;
}

.container {
   /* width 추가함 이상하면 삭제해주세여!*/
   width: 1050px;   
   background-color: #F5F5F5;
   margin-top : 10px;
   margin-bottom: 50px;
/*     margin-left: 10px;  */
   border-radius: 8px;
   padding:10px;
   
}

#list {
   height: 500px;
   width: 800px;
   padding: 20px; 
   overflow: auto;
   background-color: white;
   margin-left: 100px; 
   border-top-left-radius: 8px;
   border-top-right-radius: 8px;
   
}

/* #F0F8FF */
 .bubble { 
    position: relative; 
    background: #00B0FF; 
    border-radius: .4em;
    display:inline-block;
    width: 40%; 
    color: white;
    margin:2px;
 } 

 .bubble:after { 
    content: ''; 
    position: absolute; 
/*     left: 0;  */
/*     top: 50%;  */
/*     width: 0px;  */
/*     height: 0px;  */
/*     border: 20px solid transparent;  */
/*     border-right-color: #00B0FF;  */
/*     border-left: 0;  */
/*     border-top: 0;  */
/*     margin-top: -10px;  */
    margin-left: -20px; 
 } 
#user{
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: none;
   background-color: #F5F5F5;
   /*추가 input창 클릭 시 태두리 없애기*/
   outline: 0;

}

.form-control{
   margin-left: 60px;
   
}
.what{
   background-color:white;
   padding:10px;
/*    margin-top:10px; */
   margin-left:100px;
   border-style: solid;
   border-color: #f2f2f2;
   border-left:none;
   border-right:none;
   border-bottom:none;
   border-top: none;
   width:820px;
   border-bottom-left-radius: 8px;
   border-bottom-right-radius: 8px;
}

/*추가 7/6 수정 */

#msg {
   width: 650px;
   height: 40px;
   margin-top: 2px;  
   margin-right: 10px; 
   border: 0;
   background-color: #f2f2f2;
   border-radius: 8px;
   outline: 0;
   
}

.btn{
   height: 30px;
   width: 85px;
}

#user{
   height: 35px;
   
}

/* 노란색 말풍선(나).. script부분 span에 class you추가함*/
 .you { 
    position: relative; 
    background: #F7E600; 
    border-radius: .4em;
    display:inline-block;
    width: 40%; 
    /*추가*/
    float: right;
    margin-left: 90%;
 } 

/* 말풍선 꼬리부분.. 근데 이제 없는 */
  .you:after {  
     content: '';  
     position: absolute;  
/*     left: 0;  */ 
/*      top: 50%;  */ 
/*      width: 0px;  */ 
/*      height: 0px;  */ 
/*      border: 20px solid transparent;  */ 
/*      border-right-color: #F7E600;  */ 
/*      border-left: 0;  */ 
/*      margin-top: -10px;  */ 
/*      margin-left: -20px;  */ 
/*     margin-left: 350px; */ 
/*     말풍선 꼬리 뒤집기*/ 
     transform: scaleX(-1); 
    
  }  

.time{
   font-size:11px;
   color:#777;
   padding-left: 90%;
}

/*추가 7/6 수정 */
.col-lg-10{
   background-color:#F5F5F5;
   border-radius: 10px;
   padding:10px;
   border-left-width: 10px; 
}
.profile{
   width:50px; 
   height:50px; 
   border-radius: 50px;
}
.btn{
   height: 30px;
   width: 85px;
   color: white;
   background-color: #6495ED; 
   border: none;
   border-radius: 5px;
   transition: background 0.3s ease-in-out;
   cursor: pointer;
   
}

.btn:hover{
   background-color: black;
   color: white;
}
#to{
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: none;
   background-color: #F5F5F5;
   /*추가 input창 클릭 시 태두리 없애기*/
   outline: 0;
   font-size: medium;
   font-weight: bold;
   width:17%;
}
#mainTo{
   font-size: large;
   font-weight: bold;
}

#fly{
   color: gray;
}
#fly:hover{
   color: black;
}

.nickYou{
   float: right;
}

.toYou{
   font-size: large;
}
</style>
   
</head>
<body>
   
   <div class="container">
   <br>
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       
      <span id="mainTo">To. </span>
        <input type="text" class="form-control-col" id="to" value="${ tboard.nickName }" readonly >
<%--         <input type="hidden" class="form-control-col" id="to" value="${ tboard.nickName }" readonly > --%>
        
            <button type="button" class="btn btn-default" id="btnConnect">대화 시작</button>
			<button type="button" class="btn btn-default" id="btnDisconnect" disabled onclick="btnDisconnect()">종료</button>           
       
       <br>
       <input type="hidden" name="user" id="user" class="form-control-col-xs" value="${ sessionScope.loginUser.nickName }"  >
       
         <br><br>
      
      
         <div id="list">
         <br>
            <div id="offset"></div>
         </div>
         

      <div class="what">
        <div class="col-lg-10">
          <input type="text" class="form-control"  name="msg" id="msg" placeholder="대화 내용을 입력하세요." >
        <i class="fa-solid fa-paper-plane" id="fly" aria-hidden="true"></i>
        </div>  
        <br>
      </div>
      <br>   
   </div>
      

   




<script>
//채팅 서버 주소. 자기꺼로 바꾸고 실행하기
var url = 'ws://localhost:9980/WithTrip/chatserver';
         
//웹 소켓
var ws;

$('#btnConnect').click(function() {

   // 유저명 확인
      if ($('#user').val().trim() != ''){
         // 연결
         ws = new WebSocket(url);
               
         // 소켓 이벤트 매핑
         ws.onopen = function (evt) {
            // console.log('서버 연결 성공');
            print($('#user').val(), '채팅방에 접속하셨습니다.');
                  
            // 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
            // -> 1#유저명
         ws.send('1#' + $('#user').val() + '#');
               
         $('#user').attr('readonly', true);
         $('#btnConnect').attr('disabled', true);
         $('#btnDisconnect').attr('disabled', false);
         $('#msg').attr('disabled', false);
         $('#msg').focus();
      };
        
      ws.onmessage = function (evt) {
         // print('', evt.data);
         console.log(evt.data);
//          2#금:ㅎㅇㅎㅇ
         var index = evt.data.indexOf("#", 2);
         console.log(index);
         var no = evt.data.substring(0, 1); 
         var user = evt.data.substring(2, index);
         var txt = evt.data.substring(index + 1);
                  
         if (no == '1') {
            print2(user);
         } else if (no == '2') {
            print(user, txt);
         } else if (no == '3') {
            print3(user);
         }
         
         
      };
               
      ws.onclose = function (evt) {
         console.log('소켓이 닫힙니다.');
           };
      

      ws.onerror = function (evt) {
         console.log(evt.data);
      };
   } else {
      alert('닉네임을 입력하세요.');
      $('#user').focus();
   }
});

// 메세지 전송 및 아이디
function print(user, txt) {
   
   var cur_session = '${loginUser.nickName}';

//    console.log(cur_session);
//    console.log(user);
   
   if(user == cur_session){
      
   var temp = '';
   temp += '<div style="float:left; padding:10px;"><img src="${ contextPath }/resources/profileUploadFiles/${loginUser.changeName}" class="profile"></div>';
   temp += user;
   temp +='<br>';
   temp += '<span class="bubble">';
   temp += '<br>';
   temp += '&emsp;';
   temp += txt;
   temp += '<br><br>';
   temp += '</span>';
   temp += '<br>';
   temp += ' <span style="font-size:11px;color:#777; margin-left:70px;">' + new Date().toLocaleTimeString() + '</span>';
   temp += '<br><br>';      
   $('#list').append(temp);
   
   }else{
      
      var temp = '';
      
      temp +='<br>';
      temp += '<span class="nickYou">' + user + '</span><br>';
      temp += '<span class="you" style="float: right;">';
      temp += '<br>';
      temp += '&emsp;';
      temp +=  txt;
      temp += '&emsp;';
      temp += '<br><br>';
      temp += '</span>';
      temp += '<br>';
      temp += ' <span style="font-size:11px;color:#777; padding-left: 90%;">' + new Date().toLocaleTimeString() + '</span>';
      temp += '<br>';      
      $('#list').append(temp);
         
   }
   
   var off = $('#list span').last().offset();
   console.log(off);
   $('#list').stop().animate({scrollTop : $('#list')[0].scrollHeight}, 1000);

   
}
      
// 다른 client 접속      
function print2(user) {
   let temp = '';
   temp += '<div style="margin-bottom:3px;">';
   temp += "'" + user + "' 님이 접속했습니다." ;
   temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
   temp += '</div>';
         
   $('#list').append(temp);
}

// client 접속 종료
function print3(user) {
   let temp = '';
   temp += '<div style="margin-bottom:3px;">';
   temp += "'" + user + "' 님이 종료했습니다." ;
   temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
   temp += '</div>';
         
   $('#list').append(temp);
}

$('#user').keydown(function() {
   if (event.keyCode == 13) {
      $('#btnConnect').click();
   }
});
      
      
      
$('#msg').keydown(function() {
   if (event.keyCode == 13) {
      
      //서버에게 메시지 전달
      //2#유저명#메시지
      ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
      print($('#user').val(), $(this).val()); //본인 대화창에
      
        $('#msg').val('');
      $('#msg').focus();
      $('#fly').css('color', 'black');
            
   }
});
      
$('#btnDisconnect').click(function() {
   ws.send('3#' + $('#user').val() + '#');
   ws.close();
         
   $('#user').attr('readonly', false);
//     $('#user').val('');
         
   $('#btnConnect').attr('disabled', false);
   $('#btnDisconnect').attr('disabled', true);
         
//    $('#msg').val('');
   $('#msg').attr('disabled', true);
   $('#fly').css('color', 'gray');
});

/* 종료버튼 클릭 시 winodw.open 창 닫기*/
function btnDisconnect(){
   window.close();
}


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>