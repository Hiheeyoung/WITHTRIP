function addRow() {
  var count = document.getElementById("fileList2").rows.length;
 if(count == 2){
  alert("파일은 2개만 업로드 가능합니다.");
  return;
 }
  var oRow = fileList2.insertRow();
  oRow.onmouseover=function(){fileList.clickedRowIndex=this.rowIndex};
  var oCell1 = oRow.insertCell();
  var oCell2 = oRow.insertCell();
  var oCell3 = oRow.insertCell();
  var oCell4 = oRow.insertCell();

  oCell1.innerHTML = "상세";  
  oCell2.innerHTML = "<input type=file name=fileNm>";
  oCell3.innerHTML = "<input type=button value=\" 추가 \" onClick=\"addRow()\" class=\"fileBtn\">";
  oCell4.innerHTML = "<input type=button value=\" 삭제 \" onClick=\"delRow()\" class=\"fileBtn\">";
}
function delRow() {
  var count = document.getElementById("fileList2").rows.length;
  if( count == 1){
   alert("마지막은 지울 수 없습니다.");
   return;
  }
 fileList2.deleteRow(fileList2.clickedRowIndex);
}
// n수 많큼 행 추가
function addRowCnt(){
 //var ln = document.getElementById("fileList2").rows.length;
 var ln = 2; //n
 for(i=0; i < ln; i++){
  addRow();
 }
}

// 모든 행 삭제
function delRowAll(){
 var ln = document.getElementById("fileList").rows.length;
 for(i=0; i < ln; i++){
  delRow();
 }
}

var i = 0;
if(i == 0) {
   oCell2.innerHtml = "<input type=file name=files>";
   i ++ 
}else {
   oCell2.innerHtml = "<input type=file name=files>";
}



// 무조건 숫자만 입력
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
