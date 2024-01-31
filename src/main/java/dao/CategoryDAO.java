package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.CategoryVO;

public class CategoryDAO {
	@Autowired
	SqlSession sqlSession;

	// 조회하기
	public List<CategoryVO> TITLE_List() {
		return sqlSession.selectList("t.category_list");
	}
	// 타입조회하기
	public String TitleName(int idx) {
		return sqlSession.selectOne("t.category_title_name", idx);
	}
}
