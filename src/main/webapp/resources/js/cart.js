function deleteData(data){

    var url = "cartDelete";
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
            alert("장바구니 삭제 성공");
             location.href = "cart";
        }else{
            alert("장바구니 삭제 실패");
        }
    }
}



function gopay(){
		
		//아래에서 수량,사이즈 등을 선택하지 않고 결제를 진행했을 때 경고창을 띄워주기 위해 유효성 체크를 진행하려 한다.
		//아무것도 선택하지 않았을 때 기본 값인 ==수량 선택==, ==사이즈 선택== 을 선택 후 결제를 진행하면 경고창이 출력되게 하기위해
		//해당 value값을 문자열 변수에 담아둔다.
		var quantitySelect = document.getElementById("quantitySelect");
	    var sizeSelect = document.getElementById("sizeSelect");
		
	    //위 문자열 변수에 담아둔 값과 경고창을 띄울 기본값과 같다면 경고창을 출력한다.
	    //수량이 선택되지 않았으면 함수를 더 이상 진행하지 않고 종료한다.
	    if (quantitySelect.value == "==수량 선택==") {
	        alert("수량을 선택하세요");  
	        return; 
	    }

	    if (sizeSelect.value == "==사이즈 선택==") {
	        alert("사이즈를 선택하세요");
	        return;
	    }
		
	    
	    if ('' == document.getElementById("totalAmount").value){
	    	alert("asdf")
	    	return;
	    }
	    
	    //만약 위 유효성 체크를 모두 거치고 문제가 없다면 결제창을 출력한다.
		window.open('payPage?price='+totalAmount.value,'sdf','_blank');
		
	}
	
	function updateTotal() {
		
		//수량 선택에 id값을 quantitySelect로 줘서 value값을 가져오기
		var quantity = document.getElementById("quantitySelect").value;
		
		//price라는 id값을 가진 value를 가져오는데, 이 때 문자열로값을 가져오기 때문에 아래에서 정수로 변환 해 주기 위해 unitPriceString 이라는 문자열 객체로 
		//임시 생성 해 준다.
		//여기서 innerHTML은 HTML상에서 코드를 문자열 형식으로 변환해주는 속성이다.
		var unitPriceString = document.getElementById("price").innerHTML;
		
		//위에서 임시로 생성해둔 unitPriceString을 다시 정수로변환하고 태그까지 문자열로 가져오니 숫자가 아닌 것은 모드 제거하는 replace(/[^0-9]/g)를 사용 후 
		//10진법을 사용한다는 것을 명시해준다.
	    var unitPrice = parseInt(unitPriceString.replace(/[^0-9]/g, ''), 10);
		
		//위 가격부분과 동일하게 할인율을 받은 후 정수로 치환하여 숫자가 아닌 문자열들은 모두 제거한다.
		var saleString = document.getElementById("saleSelect").innerHTML;
		
		var sale = parseInt(saleString.replace(/[^0-9]/g, ''), 10);
		
		//수량 * 단가 * 할인율 값을 totalAmount에 넣어둔다.
		//sale/100이 아닌 sale/1000인 이유는 할인율이 double로 vo에서 받아온 20.0 이므로 정수형으로 변경하였을 때 200으로 인식된다. 따라서 /1000을 해주어
		//1에서 뺀 후 곱해준다.
		var totalAmount = quantity * unitPrice * (1-sale/1000);
		//위에서 저장해둔 totalAmount의 value를 totalAmount라는 id값을 가진 곳에 전달하여 아래 <input>태그의 value값에 전달해주는 역할이다.
		document.getElementById("totalAmount").value = totalAmount;
	}