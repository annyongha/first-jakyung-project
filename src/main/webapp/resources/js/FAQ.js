function showContent(anchor) {
    // 클릭된 앵커 태그의 부모인 <tr>을 찾음
    var faqTitleRow = anchor.parentElement.parentElement;

    // 부모 <tr>의 다음 형제인 .faq_contents 클래스를 찾음
    var faqContentRow = faqTitleRow.nextElementSibling;

    // display 속성 토글
    if (faqContentRow.style.display === 'none' || faqContentRow.style.display === '') {
        faqContentRow.style.display = 'table-row';
    } else {
        faqContentRow.style.display = 'none';
    }
}


function deleteData(data){

    var url = "faqDelete";
    var idx = data;
    var param = "data="+idx;
    var method = "post";
    sendRequest(url, param, deleteDataProcess, method);
}

function deleteDataProcess(){
    if (xhr.readyState == 4 && xhr.status == 200) {
        var data = xhr.responseText;
        var json = (new Function('return' + data))();
        if(json[0].res == 'yes'){
            alert("게시글 삭제 성공");
            location.href = "FAQ";
        }else{
            alert("게시글 삭제 실패");
        }
    }
}