function update(f){
    var idx = f.idx.value;
    var category =f.category.value;
    var category_title = f.category_title.value;
    var title = f.title.value;
    var content = f.content.value;

var url = "faqUpdateProcess";
var param = 
"idx="+idx+
"&category="+category+
"&category_title="+category_title+
"&title="+title+
"&content="+content;
var method = "post";

sendRequest(url, param, faqUpdateProcessAfter, method);
}

function faqUpdateProcessAfter() {


	if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
        if(json[0].res == 'yes'){
            alert("수정 성공");
            location.href = "FAQ";
        }else{
            alert("수정 실패");
        }
    }
}