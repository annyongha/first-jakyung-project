package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.FaqVO;

public class FaqDAO {
	
	@Autowired
	SqlSession sqlSession;
	
//	public FAQDAO(SqlSession sqlSession) {
//		this.sqlSession=sqlSession;
//	}

	// faq 페이징 및 데이터 조회
	public List<FaqVO> FAQTotalList(int page,int maxItemCount) {
		int minData = maxItemCount*(page-1)+1;
		int maxData =page*maxItemCount;
		HashMap<String, Integer> pageData = new HashMap<String, Integer>();
		pageData.put("minData", minData);
		pageData.put("maxData",maxData);
		return sqlSession.selectList("f.faq_list",pageData); //(namespace.id명);
	}
	
	//faq 전체 데이터 개수 조회
	public int TotalListCount() {
		return sqlSession.selectOne("f.faqTotalCount");
	}
	
	//faq 데이터 삭제
	public int delteFaqData(int deleteIdx) {
		return sqlSession.delete("f.delteFaqData", deleteIdx);
	}
	
	//타입별 faq 데이터 개수 조회
	public int type_faq_list_Count(String type) {
		return sqlSession.selectOne("f.type_faq_list_Count", type);
	}
	
	//타입별 faq 데이터 조회
	public List<FaqVO> type_faq_list(int page,int maxItemCount,String type){
		int minData = maxItemCount*(page-1)+1;
		int maxData =page*maxItemCount;
		HashMap<String, Object> pageData = new HashMap<String, Object>();
		pageData.put("minData", minData);
		pageData.put("maxData",maxData);
		pageData.put("type", type);
		return sqlSession.selectList("f.type_faq_list", pageData);
	}
	
	//faq 데이터 수정페이지에 기존 글 조회
	public FaqVO faqUpdateSelect(int idx) {
		return sqlSession.selectOne("f.faqUpdateSelect", idx);
	}
	// faq 데이터 수정
	public int faqUpdate(FaqVO data) {
		return sqlSession.update("f.faqUpdate", data);
	}
	
	//faq 데이터 추가
	public int faqInsert(FaqVO data) {
		return sqlSession.insert("f.faqInsert", data);
	}
	

}
