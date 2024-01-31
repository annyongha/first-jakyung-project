package com.korea.team2;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.GoodsDAO;
import dao.LikeDAO;
import dao.MemberDAO;
import dao.MyPageDAO;
import util.Common;
import vo.AddLikeVO;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class MyPage_Controller {
	@Autowired
	MemberDAO member_dao;

	@Autowired
	HttpSession session;
	
	@Autowired
	MyPageDAO myPageDAO;
	
	@Autowired
	GoodsDAO goodsDAO;

	@Autowired
	LikeDAO likeDAO;
	
	@Autowired
	HttpServletRequest request;

	//마이페이지로 이동
	@RequestMapping(value = { "myPage" })
	public String myPage() {
		return Common.Board.VIEW_PATH + "myPage.jsp";
	}

	//주문목록으로 이동
	@RequestMapping("order_list.do")
	public String order_list_page() {
		return Common.Board.VIEW_PATH + "order_list.jsp";
	}
	
	//찜 리스트로 이동
	@RequestMapping("like_list.do")
	public String like_list_page(Model model) {
		
		MemberVO vo = (MemberVO) request.getSession().getAttribute("id");
		if(vo!=null) {	
		List<AddLikeVO> datalist = likeDAO.add_like(vo.getIdx());
		model.addAttribute("dataList", datalist);
		}
		return Common.Board.VIEW_PATH + "like_list.jsp";
	}
	
	//회원정보수정 페이지로 이동
	//비밀번호 확인 페이지 먼저
	
	@RequestMapping("checkPwd.do")
    @ResponseBody
    public ModelAndView check_pwd_page(Model model, HttpServletRequest request) {

        MemberVO memberVO = (MemberVO) request.getSession().getAttribute("id");

        ModelAndView mv = new ModelAndView();

        if (memberVO != null) {

            String loginUserPwd = myPageDAO.LoginUserPwd(memberVO.getIdx());
            model.addAttribute("pwd", loginUserPwd);
            mv.setViewName(Common.Board.VIEW_PATH + "checkPwd.jsp"); 
        } else {

            mv.setViewName("redirect:/myPage");
    }
        return mv;
    }
	
	@RequestMapping("confirm")
	public String confirm_pp(Model model) {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		MemberVO confirmUser = myPageDAO.UserInfo(loginUser.getIdx());
		model.addAttribute("userInfo", confirmUser);
		
		
		return Common.Board.VIEW_PATH+"confirm.jsp";
	}
	
	//회원정보수정 페이지로 이동
	@RequestMapping("checknick")
	@ResponseBody
	public String NicksameCheck(Model model,String nickname) {
		String result;
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		String realNickname = nickname;
		
		int idsame = myPageDAO.idSameCheck(realNickname);
		
		
		if(idsame != 0) {
			result = "[{'res':'no'}]";
		}
		else {
			result = "[{'res':'yes'}]";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("idx", loginUser.getIdx());
		data.put("nickname", realNickname);
		myPageDAO.confirmNickname(data);
		loginUser.setNickname(realNickname);
		request.getSession().setAttribute("id", loginUser);
		}
		
		return result;
	}
	
	@RequestMapping("checkemail")
	@ResponseBody
	public String emailsameCheck(Model model, String email) {
		String result;
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		int idsame = myPageDAO.emailsameCheck(email);
		
		if(idsame != 0) {
			result = "[{'res':'no'}]";
		}
		else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("idx", loginUser.getIdx());
			data.put("email", email);
			myPageDAO.confirmEmail(data);
			result = "[{'res':'yes'}]";
		}
		
		return result;
	}

	@RequestMapping("checkPwd")
	@ResponseBody
	public String pwdConfirm(Model model,String pwd) {
		String result;
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		if(pwd.isEmpty()) {
			result = "[{'res':'no'}]";
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("idx", loginUser.getIdx());
			data.put("pwd", pwd);
			myPageDAO.confirmPwd(data);
			result = "[{'res':'yes'}]"; 
		}
		return result; 
	}
	
	@RequestMapping("checkTel")
	@ResponseBody
	public String telConfirm(Model model, String tel) {
		String result;
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		int telsame = myPageDAO.telsameCheck(tel);
		
		if(telsame != 0) {
			result = "[{'res':'no'}]";
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("idx", loginUser.getIdx());
			data.put("tel", tel);
			myPageDAO.confirmTel(data);
			result = "[{'res':'yes'}]";
		}
		return result;
	}
	
	@RequestMapping("confirmPostcode.do")
	@ResponseBody
	public String postConfirm(Model model, String postcode) {
		String result;
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		if(postcode.isEmpty()) {
			result = "[{'res':'no'}]";
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("idx", loginUser.getIdx());
			data.put("postcode", postcode);
			myPageDAO.confirmPostcode(data);
			result = "[{'res':'yes'}]"; 
		}
		return result;
		
	}
	@RequestMapping("confirmAddr.do")
	@ResponseBody
	public String addrConfirm(Model model, String addr) {
		String result;
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("id");
		
		if(addr.isEmpty()) {
			result = "[{'res':'no'}]";
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("idx", loginUser.getIdx());
			data.put("addr", addr);
			myPageDAO.confirmAddr(data);
			result = "[{'res':'yes'}]"; 
		}
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("changeAddr.do")
	public String changeAddr() {
		return Common.Board.VIEW_PATH+"changeAddr.jsp";
	}
	
	

	
	
	
	//myReview 페이지로 이동
	@RequestMapping("myReview.do")
	public String myReview_page() {
		return Common.Board.VIEW_PATH + "myReview.jsp";
	}
	
	//주문목록에서 리뷰작성 페이지로 이동
		@RequestMapping("writeReview")
		public String write_review_page() {
			return Common.Board.VIEW_PATH + "writeReview.jsp";
		}
	
		@RequestMapping("addLike")
		@ResponseBody
		public String addLike_page(Model model, String idx) {
			String result;
			int goodsIdx = 0;
			MemberVO like = (MemberVO)request.getSession().getAttribute("id");
			
			if(idx == null || idx.isEmpty()) {
				result = "[{'res':'no'}]";
			}
			
			else {
				goodsIdx = Integer.parseInt(idx);
				
				GoodsVO selectGOODS = goodsDAO.selectOne(goodsIdx);
				HashMap<String, Object> data = new HashMap<String, Object>();
				data.put("idx", like.getIdx());
				data.put("goods_idx", selectGOODS.getIdx());
				data.put("content", selectGOODS.getG_title());
				data.put("goods_name", selectGOODS.getG_name());
				likeDAO.addLike(data);
				result = "[{'res':'yes'}]";
			}
			
			return result;
		}
		
		@RequestMapping("delLike")
		@ResponseBody
		public String delLike_page(Model model, String idx) {
			String result;
			int goodsIdx = 0;
			
			if(idx == null || idx.isEmpty()) {
				result = "[{'res':'no'}]";
			}
			
			else {
				goodsIdx = Integer.parseInt(idx);
				
				likeDAO.del_like(goodsIdx);
				result = "[{'res':'yes'}]";
			}
			
			return result;
		}
	
}
