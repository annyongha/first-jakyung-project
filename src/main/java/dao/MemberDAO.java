package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.MemberVO;

public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//아이디 중복체크
	public int idCheck(String email) {
		return sqlSession.selectOne("m.check_email",email);
	}
	
	//회원가입
	public int insert(MemberVO vo) {
		return sqlSession.insert("m.member_insert",vo);
	}
	
	//아이디가 DB에 존재하는지 체크
	public MemberVO loginCheck(String email) {
		return sqlSession.selectOne("m.loginCheck",email);
	}
	
	//아이디 있는지 체크
	public MemberVO login_id_find(String jumin) {
		return sqlSession.selectOne("m.login_idCheck",jumin);
	}
	
	public MemberVO pwd_idCheck(String email) {
		return sqlSession.selectOne("m.pwd_idCheck",email);
	}
	
	public int member_delete(int idx) {
		return sqlSession.delete("m.member_delete",idx);
	}
	
	//닉네임체크
	public MemberVO nickname(String nickname) {
		return sqlSession.selectOne("m.nickname",nickname);
	}
	
	public MemberVO login_tel_find(String tel) {
		return sqlSession.selectOne("m.tel_find",tel);
	}
}
