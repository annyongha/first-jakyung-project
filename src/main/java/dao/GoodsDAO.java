package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.GoodsVO;

public class GoodsDAO {

	@Autowired
	SqlSession sqlSession;
	
	//전체 상품 조회
	public List<GoodsVO> selectList(int page,int maxItemCount) {
		int minData = maxItemCount*(page-1)+1;
		int maxData =page*maxItemCount;
		HashMap<String, Integer> pageData = new HashMap<String, Integer>();
		pageData.put("minData", minData);
		pageData.put("maxData",maxData);
		return sqlSession.selectList("g.goodsTotalSelectList",pageData);
	}
	
	//타입별 상품 조회
	public List<GoodsVO> typeSelectList(int page, int maxItemCount, String type){
		int minData = maxItemCount*(page-1)+1;
		int maxData =page*maxItemCount;
		HashMap<String, Object> pageData = new HashMap<String, Object>();
		pageData.put("minData", minData);
		pageData.put("maxData",maxData);
		pageData.put("type",type);
		return sqlSession.selectList("g.goodsTypeSelectList",pageData);
	}
	
	//세부 상품 페이지 데이터 조회
	public GoodsVO selectOne(int idx) {
		return sqlSession.selectOne("g.goodsOnePage",idx);
	}
	
	//전체 상품 데이터 개수 조회
	public int TotalListCount() {
		return sqlSession.selectOne("g.goodsTotalCount");
	}
	
	//타입 별 전체 상품 데이터 개수 조회
	public int typeTotalListCount(String type) {
		return sqlSession.selectOne("g.typeGoodsTotalCount", type);
	}
	
	//최근
	public GoodsVO recentlyUserProduct(int idx){
		return sqlSession.selectOne("g.recentlyUserProduct", idx);
	}
	
	//상품 등록
		public int insert(GoodsVO vo){
			return sqlSession.insert("g.goods_insert", vo);
		}
		
		//상품 수정
		public int update(GoodsVO vo) {
			return sqlSession.update("g.goods_update",vo);
		}
		
		//상품 삭제
		public int delete(int idx) {
			return sqlSession.delete("g.goods_delete",idx);
		}
		
		public List<GoodsVO> selectList(int u_idx){
			List<GoodsVO> list = sqlSession.selectList("g.selectList", u_idx);
			return list;
		}
		
		//수정 전체 상품 조회
			public List<GoodsVO> updateList(int page,int maxItemCount,int u_idx) {
				int minData = maxItemCount*(page-1)+1;
				int maxData =page*maxItemCount;
				HashMap<String, Integer> pageData = new HashMap<String, Integer>();
				pageData.put("minData", minData);
				pageData.put("maxData",maxData);
				pageData.put("u_idx", u_idx);
				return sqlSession.selectList("g.updateTotalSelectList",pageData);
			}
			
		//전체 상품 데이터 개수 조회
		public int updateListCount(int u_idx) {
			return sqlSession.selectOne("g.updateTotalCount",u_idx);
		}	
			
		//회원 삭제시 상품테이블에 있는 모든 데이터들을 지움
		public int member_delete(int u_idx) {
			return sqlSession.delete("g.member_delete",u_idx);
		}
	
}
