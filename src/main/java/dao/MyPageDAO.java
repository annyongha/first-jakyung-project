package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.MemberVO;

public class MyPageDAO {

	@Autowired
	SqlSession sqlSession;
	
	public String LoginUserPwd(int idx) {
		return sqlSession.selectOne("my.loginUserPwd", idx);
	}
	
	public MemberVO UserInfo(int idx) {
		return sqlSession.selectOne("my.userInfo", idx);
	}
	
	public int idSameCheck(String nickname) {
		return sqlSession.selectOne("my.idsame",nickname);
	}
	
	public int emailsameCheck(String email) {
		return sqlSession.selectOne("my.emailsame",email);
	}
	
	public int confirmNickname(HashMap<String, Object> data) {
		return sqlSession.update("my.nickUpdate",data);
	}
	
	public int confirmEmail(HashMap<String, Object> data) {
		return sqlSession.update("emailUpdate",data);
	}
	
	public int confirmPwd(HashMap<String, Object> data) {
		return sqlSession.update("pwdUpdate",data);
	}
	
	public int telsameCheck(String tel) {
		return sqlSession.selectOne("my.telsame",tel);
	}
	
	public int confirmTel(HashMap<String, Object> data) {
		return sqlSession.update("telUpdate",data);
	}
	
	public int confirmPostcode(HashMap<String, Object> data) {
		return sqlSession.update("postcodeUpdate",data);
	}
	
	public int confirmAddr(HashMap<String, Object> data) {
		return sqlSession.update("addrUpdate",data);
	}
	
	
	/*
	 * public int telsameCheck(int idx) { return
	 * sqlSession.selectOne("my.telsame",idx); }
	 */
}
