package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.RecentlyVO;

public class RecentlyDAO {

	@Autowired
	SqlSession sqlSession;
	
	//유저 최근 페이지 전체조회
	public List<RecentlyVO> selectList(int user_idx){
	return sqlSession.selectList("r.select_list",user_idx);	
	}
	
	//상세 페이지 요청 할때마다 최근페이지 저장
	public int recent_page_insert(HashMap<String, Integer> data) {
		return sqlSession.insert("r.recent_page_insert",data);
	}
	
	//각 유저별 저장된 최근페이지 개수 조회
	public int recent_page_count(int idx) {
		return sqlSession.selectOne("r.recent_page_count", idx);
	}
	
	//최근페이지 개수가 일정 개수 이상일때 오래된 목록 삭제
	public int recent_page_delete(int idx) {
		return sqlSession.delete("r.recent_page_delete", idx);
	}
	
	//최근 봣던 페이지가 이미 db에 저장되어 있는지 체크
	public int recent_existCheck(HashMap<String, Integer> data) {
		return sqlSession.selectOne("r.recent_existCheck", data);
	}
	
	//세부 페이지에 최근 본 데이터가 있을 때 해당 데이터 제거
	public int recent_exist_delete(HashMap<String, Integer> data) {
		return sqlSession.delete("r.recent_exist_delete", data);
	}
}
