function check_pwd(pwd){
    var checkPwd = document.getElementById("confirmPwd");
    var oriCheck =pwd;
    if(checkPwd.value == oriCheck){

       location.href = "confirm";
    }
    else{
        alert("비밀번호가 일치하지 않습니다! ")
        location.href="checkPwd.do";
    }
    // location.href="confirm";
}

function UserInfo(){
	var UserInfo = document.getElementById("NicknameChange");

    var param = "nickName="+UserInfo;

    sendRequest("confirm",param,resultfn,"post");

    
}

function resultfn(){
    if(xhr.readyState == 4 && xhr.status==200){
        var data = xhr.responseText;
        var json = (new Function('return' + data))();
        if(json[0].res == 'yes'){

        }else{

        }
    }
}

function changeNickname(f){
    var data = f.nick.value;
    var param = "nickname="+data;

    sendRequest("checknick",param,nicknameUpdate,"post");
}
function nicknameUpdate(){
    if(xhr.readyState == 4 && xhr.status==200){
        var data = xhr.responseText;
        var json = (new Function('return ' + data))();
        if(json[0].res == 'no'){
            alert("중복된 닉네임이 있습니다.");
        }else{ 
            alert("닉네임 수정완료");
            location.replace("confirm");
        }
}
}

function changeId(f){
    var data = f.id.value;
    var param = "email="+data;

    sendRequest("checkemail",param,emailUpdate,"post");
}
function emailUpdate(){
    if(xhr.readyState == 4 && xhr.status==200){
        var data = xhr.responseText;
        var json = (new Function('return ' + data))();
        if(json[0].res == 'no'){
            alert("중복된 아이디가 있습니다.");
        }else{ 
            alert("아이디 수정완료");
            console.log(data);
        }
}
}

function changePwd(f){
    var data = f.pwd.value;
    var param = "pwd="+data;

    sendRequest("checkPwd",param,pwdUpdate,"post");
}


function pwdUpdate(){
    if(xhr.readyState == 4 && xhr.status == 200){
        var data = xhr.responseText;
        var json = (new Function('return '+data))();
        alert("비밀번호 수정완료");
        console.log(data);
    }
}

function changeTel(f){
    var data = f.tel.value;
    var param = "tel="+data;

    sendRequest("checkTel",param,telUpdate,"post");
}

function telUpdate(){
    if(xhr.readyState == 4 && xhr.status==200){
        var data = xhr.responseText;
        var json = (new Function('return ' + data))();
        if(json[0].res == 'no'){
            alert("중복된 전화번호가 있습니다.");
        }else{ 
            alert("전화번호 수정완료");
        }
}
}


function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }






function changeAddr(){
    window.open('changeAddr.do','_blank','width=600,height=400')
}







// console.log("checkPwd");
// console.log(pwdCheck);