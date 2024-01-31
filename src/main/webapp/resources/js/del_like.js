function del_like(idx){
    var goods_idx = idx;
    var url = "delLike";
    var param = "idx="+goods_idx;
    var method = "post";
    sendRequest(url, param, resultFn, method);
}
function resultFn(){
    if (xhr.readyState == 4 && xhr.status == 200) {
        var data = xhr.responseText;
        var json = (new Function('return' + data))();
        if(json[0].res == 'yes'){
            alert('삭제 성공');
            location.href="like_list.do";
        }
        else{
            alert('삭제 실패!');
        }
    }
}