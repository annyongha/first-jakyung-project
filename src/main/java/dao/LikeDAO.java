package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.AddLikeVO;

public class LikeDAO {
	@Autowired
	SqlSession sqlSession;
	
	//하트 클릭시 찜리스트 추가
	public int addLike(HashMap<String, Object> data) {
		return sqlSession.insert("l.addLike", data);
	}
	
	//로그인 한 유저의 찜리스트 조회
	public List<AddLikeVO> add_like(int idx){
		return sqlSession.selectList("l.list",idx);
	}
	
	//삭제 버튼 클릭 시 찜리스트에서 삭제
	public int del_like(int idx){
		return sqlSession.delete("l.delLike",idx);
	}
}
