package com.korea.team2;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.GoodsDAO;
import dao.MemberDAO;
import util.Common;
import vo.MemberVO;

@Controller
public class Member_Controller {

	@Autowired
	MemberDAO member_dao;

	@Autowired
	GoodsDAO goods_dao;
	
	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;


	// 회원가입 동의 페이지 이동
	@RequestMapping("agree.do")
	public String agree() {
		return "WEB-INF/views/member/agree.jsp";
	}

	// 주소를 회원가입 주소창에 가져오는 맵핑
	@RequestMapping("member_insert.do")
	public String select() {
		return "WEB-INF/views/member/index.jsp";
	}

	// 회원가입시 아이디 존재 유무 체크
	@RequestMapping("check_id.do")
	@ResponseBody
	public String check_id(String email) {
		int res = member_dao.idCheck(email);

		if (res == 0) {
			return "[{'res':'yes'}]";
		}

		return "[{'res':'no'}]";
		

				
		
	}

	// 우편번호를 입력받는 팝업창 이동
	@RequestMapping("adress.do")
	public String adress() {
		return "WEB-INF/views/member/adress/adress.jsp";
	}

	// 회원가입 페이지이동
	// 수정
	@RequestMapping("adress_insert.do")
	public String adress_insert() {
		return "WEB-INF/views/member/member.jsp";
	}

	// 버그 발생 페이지
	// 회원가입하고
	@RequestMapping("insert.do")
	public String insert(MemberVO vo) {
		int realRank = 0;
		if(vo.getRank() != 0) {
			realRank = vo.getRank();
		}
		vo.setRank(realRank);

		if (vo.getHobby() == null) {
			vo.setHobby("");
		}

		int res = member_dao.insert(vo);

		if (res > 0) {
			return "redirect:index";
		}

		return null;
	}

	// 로그인 폼 이동
	@RequestMapping("login_form.do")
	public String loginPage(Model model) {
		String preURL = request.getHeader("referer");
		model.addAttribute("preURL", preURL);
		return Common.Board.VIEW_PATH + "member/login/login_form.jsp";
	}

	// 로그인 처리
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String email, String pwd) {

		// id검증
		MemberVO vo = member_dao.loginCheck(email);

		if (vo == null) {
			return "[{'param':'no_id'}]";
		}

		// 비번검증
		if (!vo.getPwd().equals(pwd)) {
			return "[{'param':'no_pwd'}]";
		}

		// 아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩 한다.
		// 자동으로 포워딩 되는 듯 전 브라우저에
		// 세션은 약 30분동안 유지 가능한듯
		session.setAttribute("id", vo);

		// 로그인 성공 하면
		return "[{'param':'clear'}]";
	}

	// 로그아웃 기능 요청
	@RequestMapping("logout.do")
	public String logout() {
		request.getSession().removeAttribute("id");
		String preURL = request.getHeader("referer");
		return "redirect:" + preURL;
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping("id_find_form.do")
	public String id_find_form() {
		return "WEB-INF/views/member/login/id_Find.jsp";
	}

	// 비밀번호 찾기 페이지 이동
	@RequestMapping("pwd_Find.do")
	public String pwd_Find() {
		return "WEB-INF/views/member/login/pwd_Find.jsp";
	}

	@RequestMapping("id_find.do")
	@ResponseBody
	public String id_find(Model model, String jumin) {
		MemberVO vo = member_dao.login_id_find(jumin);

		if (vo == null) {
			return "[{'param':'no_id'}]";
		}

		return "[{'param':'" + vo.getEmail() + "'}]";

	}

	@RequestMapping("pwd_idCheck.do")
	@ResponseBody
	public HashMap<String, Object> pwd_idCheck(String email) {
		MemberVO vo = member_dao.pwd_idCheck(email);
		if (vo == null) {
			return null;
			// @ResponseBody : 이게 문자열로 변환해 보내서 ''값이 반환되는거 같음
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("question", vo.getQuestion());
		resultMap.put("answer", vo.getAnswer());

		return resultMap;

	}

	@RequestMapping("pwd_check.do")
	@ResponseBody
	public String pwd_check(String email) {
		MemberVO vo = member_dao.pwd_idCheck(email);
		if (vo == null) {
			return "[{'param':'no_email'}]";
		}

		return "[{'param':'" + vo.getPwd() + "'}]";
	}
	
	@RequestMapping("member_delete")
	public String member_delete() {
		MemberVO vo =  (MemberVO)request.getSession().getAttribute("id");
		int res = goods_dao.member_delete(vo.getIdx());
		if (res > 0) {
			System.out.println("회원 삭제하기전 그 회원의 상품데이터들을 삭제함");
		}
		
		int delete_res = member_dao.member_delete(vo.getIdx());
		if (delete_res > 0) {
			request.getSession().removeAttribute("id");
			System.out.println("회원삭제가 됨");
			return "redirect:index";
		}
			System.out.println("삭제가 안됨");
		return "redirect:index";
	}
	
	@RequestMapping("nickname_check.do")
	@ResponseBody
	public String nickname_check(String nickname) {
		MemberVO vo = member_dao.nickname(nickname);
		if (vo != null) { 
			return "[{'res':'no'}]"; 
		}
			
		return "[{'res':'yes'}]";
	}
	
	
	@RequestMapping("jumin_check.do")
	@ResponseBody
	public String jumin_check(String jumin) {
		MemberVO vo = member_dao.login_id_find(jumin);
		if (vo != null) { 
			return "[{'res':'no'}]"; 
		}
		
		return "[{'res':'yes'}]";
	}
	
	@RequestMapping("tel_check.do")
	@ResponseBody
	public String tel_check(String tel) {
		MemberVO vo = member_dao.login_tel_find(tel);
		if (vo != null) { 
			return "[{'res':'no'}]"; 
		}
		
		return "[{'res':'yes'}]";
	}
}
