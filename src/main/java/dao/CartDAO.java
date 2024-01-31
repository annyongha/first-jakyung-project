package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.CartVO;

public class CartDAO {

	@Autowired
	SqlSession sqlSession;
	
	//장바구니 클릭시 장바구니에 데이터 추가
	public int cartInsert(HashMap<String, Object> data) {
		return sqlSession.insert("c.cart_insert", data);
	}
	
	//장바구니 조회
	public List<CartVO> cartSelectList(HashMap<String, Integer> searchData,int maxItemCount){
		int nowpage = searchData.get("nowpage");
		int minData = maxItemCount*(nowpage-1)+1;
		int maxData =nowpage*maxItemCount;
		HashMap<String, Integer> pageData = new HashMap<String, Integer>();
		pageData.put("u_idx", searchData.get("u_idx"));
		pageData.put("minData", minData);
		pageData.put("maxData",maxData);
		
		return sqlSession.selectList("c.cart_list", pageData);
	}
	
	//장바구니 삭제
	public int cartDelete(int deleteIdx) {
		return sqlSession.delete("c.cart_delete",deleteIdx);
	}
	
}
