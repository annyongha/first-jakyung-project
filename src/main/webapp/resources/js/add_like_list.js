function add_like(idx){
    var goods_idx = idx;
    var url = "addLike";
    var param = "idx="+goods_idx;
    var method = "post";
    sendRequest(url, param, resultFn, method);
}
function resultFn(){
    if (xhr.readyState == 4 && xhr.status == 200) {
        var data = xhr.responseText;
        var json = (new Function('return' + data))();
        if(json[0].res == 'yes'){
            alert('담기 성공');
        }
        else{
            alert('실패!');
        }
    }
}

