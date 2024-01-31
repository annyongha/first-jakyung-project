function saveAddr(f){
    var data = f.postcode.value;
    var param = "postcode="+data;
    var dataa = f.addr.value;
    var paramm = "addr="+dataa;
    sendRequest("confirmPostcode.do",param,postcodeUpdate,"post");
    sendRequest("confirmAddr.do",paramm,addrUpdate,"post");
}
//함수명과 파일명은 가급적 다르게


function postcodeUpdate(){
    if(xhr.readyState == 4 && xhr.status==200){
        var data = xhr.responseText;
        var json = (new Function('return ' + data))();
        alert("우편번호 수정 완료")
        console.log(data);
}
}

function addrUpdate(){
    if(xhr.readyState == 4 && xhr.status==200){
        var dataa = xhr.responseText;
        var json = (new Function('return ' + dataa))();
        alert("주소 수정 완료")
        console.log(data);
}
}




