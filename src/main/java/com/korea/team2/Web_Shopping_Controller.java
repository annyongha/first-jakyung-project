package com.korea.team2;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.CartDAO;
import dao.CategoryDAO;
import dao.FaqDAO;
import dao.GoodsDAO;
import dao.MemberDAO;
import dao.RecentlyDAO;
import util.Common;
import util.MainGoodsPaging;
import util.MainTotalFaqPaging;
import util.TypeFaqPaging;
import util.TypeGoodsPaging;
import util.insert_form_paging;
import vo.CartVO;
import vo.CategoryVO;
import vo.FaqVO;
import vo.GoodsVO;
import vo.MemberVO;
import vo.RecentlyVO;

@Controller
public class Web_Shopping_Controller {

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	GoodsDAO goodsDAO;

	@Autowired
	RecentlyDAO recentlyDAO;

	@Autowired
	FaqDAO faqDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	HttpServletRequest request;

	// 메인페이지
	@RequestMapping(value = { "/", "index" })
	public String mainPage(Model model, String nowpage) {

		HashMap<String, Object> goodsPaging = MainGoodsPaging.getPaging(20, nowpage, goodsDAO);

		model.addAttribute("goodsList", goodsPaging.get("goodsList"));
		model.addAttribute("pagingCount", goodsPaging.get("pagingCount"));
		model.addAttribute("minpage", goodsPaging.get("minpage"));
		model.addAttribute("nowpage", goodsPaging.get("nowpage"));
		model.addAttribute("maxpage", goodsPaging.get("maxpage"));
		model.addAttribute("jumpgingPage", goodsPaging.get("jumpgingPage"));

		return Common.Board.VIEW_PATH + "index.jsp";
	}

	// 이전 페이지 이동
	@RequestMapping("prePage")
	public String prePage(String preURL) {

		return "redirect:" + preURL;
	}

	// 상품 타입 별 페이지
	@RequestMapping("typePage")
	public String typePage(Model model, String type, String nowpage) {

		HashMap<String, Object> goodsPaging = null;
		if (type.equals("popularity")) {
			goodsPaging = MainGoodsPaging.getPaging(20, nowpage, goodsDAO);
		} else {
			goodsPaging = TypeGoodsPaging.getPaging(20, nowpage, goodsDAO, type);
		}
		model.addAttribute("type", type);
		model.addAttribute("goodsList", goodsPaging.get("goodsList"));
		model.addAttribute("pagingCount", goodsPaging.get("pagingCount"));
		model.addAttribute("minpage", goodsPaging.get("minpage"));
		model.addAttribute("nowpage", goodsPaging.get("nowpage"));
		model.addAttribute("maxpage", goodsPaging.get("maxpage"));
		model.addAttribute("jumpgingPage", goodsPaging.get("jumpgingPage"));

		return Common.Board.VIEW_PATH + "goodsTypePage.jsp";
	}

	// 상품페이지 요청
	@RequestMapping("goodPage")
	public String goodPage(Model model, int idx) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("id");
		if (vo != null) {

			HashMap<String, Integer> insertData = new HashMap<String, Integer>();
			insertData.put("u_id", ((MemberVO) request.getSession().getAttribute("id")).getIdx());
			insertData.put("g_id", idx);
			if (recentlyDAO.recent_existCheck(insertData) > 0) {
				recentlyDAO.recent_exist_delete(insertData);
			}

			recentlyDAO.recent_page_insert(insertData);

		}
		GoodsVO data = goodsDAO.selectOne(idx);
		model.addAttribute("goodsData", data);
		return Common.Board.VIEW_PATH + "index2.jsp";
	}

	// 장바구니 페이지
	@RequestMapping("cart")
	public String cartPage(Model model, String page) {
		int nowpage = 1;
		int user_idx;
		int maxItemCount = 10;
		if (page == null || page.isEmpty()) {
			nowpage = 1;
		} else {
			nowpage = Integer.parseInt(page);
		}
		MemberVO userData = (MemberVO) request.getSession().getAttribute("id");
		if (userData != null) {
			user_idx = userData.getIdx();
			HashMap<String, Integer> searchData = new HashMap<String, Integer>();
			searchData.put("u_idx", user_idx);
			searchData.put("nowpage", nowpage);

			// >>문제
			List<CartVO> cartDataList = cartDAO.cartSelectList(searchData, maxItemCount);

			for (CartVO cartdata : cartDataList) {
				cartdata.setGoodsData(goodsDAO.recentlyUserProduct(cartdata.getG_idx()));
			}
			model.addAttribute("cartList", cartDataList);
		}

		return Common.Board.VIEW_PATH + "cart.jsp";
	}

	// 장바구니 삭제프로세스
	@RequestMapping("cartDelete")
	@ResponseBody
	public String cartDelete(String data) {
		System.out.println("data : " + data);
		int deleteIdx;
		int res = 0;
		if (data != null) {
			deleteIdx = Integer.parseInt(data);
			res = cartDAO.cartDelete(deleteIdx);
		}
		if (res != 0) {
			return "[{'res':'yes'}]";
		} else {
			return "[{'res':'no'}]";
		}
	}

	// FAQ 페이지
	@RequestMapping("FAQ")
	public String FAQPage(Model model, String nowpage, String typeIdx) {
		HashMap<String, Object> list = null;
		String type = null;
		if (typeIdx != null && !typeIdx.isEmpty()) {
			type = categoryDAO.TitleName(Integer.parseInt(typeIdx));
			list = TypeFaqPaging.getPaging(10, nowpage, faqDAO, type);
			model.addAttribute("typeIdx", typeIdx);
		} else {
			list = MainTotalFaqPaging.getPaging(10, nowpage, faqDAO);
		}

		List<CategoryVO> category_list = categoryDAO.TITLE_List();

		System.out.println("맥스 페이지 : " + list.get("maxpage"));
		model.addAttribute("list", list.get("goodsList"));
		model.addAttribute("pagingCount", list.get("pagingCount"));
		model.addAttribute("minpage", list.get("minpage"));
		model.addAttribute("nowpage", list.get("nowpage"));
		model.addAttribute("maxpage", list.get("maxpage"));
		model.addAttribute("jumpgingPage", list.get("jumpgingPage"));
		model.addAttribute("category_list", category_list);
		return Common.Board.VIEW_PATH + "FAQ.jsp";
	}

	// 최근 본 페이지
	@RequestMapping("recently")
	public String recentlyViewedPages(Model model) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("id");

		// 로그인이 되어 있을 때
		if (vo != null) {

			// 현재 최근페이지 저장된게 10개 이상이면
			if (recentlyDAO.recent_page_count(vo.getIdx()) >= 11) {

				// 가장 오래된 페이지 정보를 삭제
				recentlyDAO.recent_page_delete(vo.getIdx());
			}

			// recently테이블 전체 조회 데이터 가져옴
			List<RecentlyVO> list = recentlyDAO.selectList(vo.getIdx());
			

				for (int i = 0; i < list.size(); i++) {
					// recently 테이블에 맞는 상품 이미지를 가져옴
					GoodsVO goodsdata = goodsDAO.recentlyUserProduct(list.get(i).getGoods_idx());
					list.get(i).setGoods_title_name(goodsdata.getG_title());
					list.get(i).setGoods_price(goodsdata.getG_price());
				}
				model.addAttribute("list", list);
			
		}
		return Common.Board.VIEW_PATH + "recentlyViewedPages.jsp";
	}

	@RequestMapping("payPage")
	public String goPay(Model model, String price) {
		if (price != null && !price.isEmpty()) {
			int intPrice = Integer.parseInt(price);
			model.addAttribute("price", intPrice);
		}
		return Common.Board.VIEW_PATH + "payPage.jsp";
	}

	@RequestMapping("goCart")
	@ResponseBody
	public String goCart(String g_idx, String g_quantity, String g_price, String g_size) {

		int goods_idx = 1;
		int goods_count = 1;
		int goods_price = 1;
		String goods_size = g_size;

		String result = null;
		int res = 0;

		// 로그인 유저 정보 가져오기
		MemberVO user_data = (MemberVO) request.getSession().getAttribute("id");
		// 로그인 되어 있을때 실행
		if (user_data != null) {

			int user_idx = user_data.getIdx();

			if (g_idx != null && !g_idx.isEmpty()) {
				goods_idx = Integer.parseInt(g_idx);
			}

			if (g_quantity != null && !g_quantity.isEmpty()) {
				goods_count = Integer.parseInt(g_quantity);
			}

			if (g_price != null && !g_price.isEmpty()) {
				goods_price = Integer.parseInt(g_price);
			}

			HashMap<String, Object> data = new HashMap<String, Object>();

			data.put("user_idx", user_idx);
			data.put("goods_idx", goods_idx);
			data.put("goods_count", goods_count);
			data.put("goods_price", goods_price);
			data.put("goods_size", goods_size);
			data.put("c_addr", "null");

			res = cartDAO.cartInsert(data);
			if (res > 0) {
				result = String.format("[{'res':'%s'}]", "yes");
				return result;
			} else {
				result = String.format("[{'res':'%s'}]", "no");
				return result;
			}
		} else {
			result = String.format("[{'res':'%s'}]", "no_login");
			return result;
		}
	}

	@RequestMapping("faqDelete")
	@ResponseBody
	public String faqDelete(String data) {
		int deleteIdx;
		int res = 0;
		if (data != null) {
			deleteIdx = Integer.parseInt(data);
			res = faqDAO.delteFaqData(deleteIdx);
		}

		if (res != 0) {
			return "[{'res':'yes'}]";
		} else {
			return "[{'res':'no'}]";
		}
	}

	// faq 수정페이지 이동
	@RequestMapping("faqUpdate")
	public String faqUpdate(Model model, String idx) {
		System.out.println("idx : " + idx);
		String preURL = request.getHeader("referer");
		int dataIdx = 0;
		List<CategoryVO> titleData = null;
		if (idx != null && !idx.isEmpty()) {
			dataIdx = Integer.parseInt(idx);
			titleData = categoryDAO.TITLE_List();
			FaqVO data = faqDAO.faqUpdateSelect(dataIdx);

			model.addAttribute("titleData", titleData);
			model.addAttribute("data", data);
		}
		model.addAttribute("preURL", preURL);
		return Common.Board.VIEW_PATH + "faqUpdate.jsp";
	}

	// faq인서트 처리
	@RequestMapping("faqUpdateProcess")
	@ResponseBody
	public String faqUpdateProcess(FaqVO updateData) {
		String result = null;

		int res = 0;
		if (updateData != null) {
			res = faqDAO.faqUpdate(updateData);
		}

		if (res != 0) {
			result = "[{'res':'yes'}]";
		} else {
			result = "[{'res':'no'}]";
		}

		return result;

	}

	@RequestMapping("insertFaq")
	public String insertFaq(Model model) {

		List<CategoryVO> categoryList = categoryDAO.TITLE_List();

		model.addAttribute("categoryList", categoryList);

		return Common.Board.VIEW_PATH + "insertFaq.jsp";
	}

	@RequestMapping("faqInsertProcess")
	public String faqInsertProcess(FaqVO data) {
		data.setMember_id(((MemberVO) request.getSession().getAttribute("id")).getEmail());
		faqDAO.faqInsert(data);
		return "redirect:FAQ";
	}

	@RequestMapping("goods.do")
	public String goods() {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("id");
		if (vo.getRank() > 0) {
			return Common.Board.VIEW_PATH + "/goods/goods_insert.jsp";
		}
		return "redirect:index";

	}

	@RequestMapping("goods_update_form.do")
	public String goods_update_form(Model model, String nowpage) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("id");
		int u_idx = vo.getIdx();

		HashMap<String, Object> goodsPaging = insert_form_paging.getPaging(10, nowpage, goodsDAO, u_idx);

		model.addAttribute("goodsList", goodsPaging.get("goodsList"));
		model.addAttribute("pagingCount", goodsPaging.get("pagingCount"));
		model.addAttribute("minpage", goodsPaging.get("minpage"));
		model.addAttribute("nowpage", goodsPaging.get("nowpage"));
		model.addAttribute("maxpage", goodsPaging.get("maxpage"));
		model.addAttribute("jumpgingPage", goodsPaging.get("jumpgingPage"));

		return Common.Board.VIEW_PATH + "/goods/goods_update_form.jsp";
	}

	@RequestMapping("goods_insert.do")
	public String goods_insert(GoodsVO vo) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("id");
		vo.setU_idx(memberVO.getIdx());

		String webPath = "/resources/images";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		String contentPath = "/resources/content";
		String contnetsavePath = request.getServletContext().getRealPath(contentPath);
		System.out.println(contnetsavePath);

		MultipartFile g_photo = vo.getG_photo();
		MultipartFile contentfile = vo.getContentFile();

		String filename = "no_file";
		String contentname = "no_file";

		System.out.println(contentfile);

		if (!g_photo.isEmpty()) {
			filename = g_photo.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) { // 경로가 없다면
				saveFile.mkdirs(); // 폴더를 만들어라
			} else {
				// 동일파일명 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				g_photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		vo.setG_title(filename);

		if (!contentfile.isEmpty()) {
			contentname = contentfile.getOriginalFilename();

			File contentsaveFile = new File(contnetsavePath, contentname);
			if (!contentsaveFile.exists()) { // 경로가 없다면
				contentsaveFile.mkdirs(); // 폴더를 만들어라
			} else {
				// 동일파일명 방지
				long time = System.currentTimeMillis();
				contentname = String.format("%d_%s", time, contentname);
				contentsaveFile = new File(contnetsavePath, contentname);
			}

			try {
				contentfile.transferTo(contentsaveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		vo.setContent(contentname);
		System.out.println(vo);
		int res = goodsDAO.insert(vo);

		if (res > 0) {
			return "redirect:index";
		} else {
			System.out.println("추가 에러");
			return null;
		}
	}

	@RequestMapping("goods_update.do")
	public String goods_update(GoodsVO vo) {
		String webPath = "/resources/images";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		String contentPath = "/resources/content";
		String contnetsavePath = request.getServletContext().getRealPath(contentPath);
		System.out.println(contnetsavePath);

		MultipartFile g_photo = vo.getG_photo();
		MultipartFile contentfile = vo.getContentFile();

		String filename = "no_file";
		String contentname = "no_file";

		System.out.println(contentfile);
		System.out.println(vo);

		if (!g_photo.isEmpty()) {
			filename = g_photo.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) { // 경로가 없다면
				saveFile.mkdirs(); // 폴더를 만들어라
			} else {
				// 동일파일명 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				g_photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		vo.setG_title(filename);

		if (!contentfile.isEmpty()) {
			contentname = contentfile.getOriginalFilename();

			File contentsaveFile = new File(contnetsavePath, contentname);
			if (!contentsaveFile.exists()) { // 경로가 없다면
				contentsaveFile.mkdirs(); // 폴더를 만들어라
			} else {
				// 동일파일명 방지
				long time = System.currentTimeMillis();
				contentname = String.format("%d_%s", time, contentname);
				contentsaveFile = new File(contnetsavePath, contentname);
			}

			try {
				contentfile.transferTo(contentsaveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		vo.setContent(contentname);
		System.out.println(vo);
		int res = goodsDAO.update(vo);
		System.out.println("res : " + res);
		if (res > 0) {
			return "redirect:index";
		} else {
			System.out.println("추가 에러");
			return "redirect:index";
		}
	}

	@RequestMapping("view.do")
	public String view(Model model, int idx) {
		GoodsVO vo = goodsDAO.selectOne(idx);

		model.addAttribute("vo", vo);
		return Common.Board.VIEW_PATH + "/goods/update_view.jsp";
	}

	@RequestMapping("goods_delete.do")
	public String goods_delete(int idx) {
		int res = goodsDAO.delete(idx);
		if (res > 0) {
			return "redirect:goods_update_form.do";
		}
		System.out.println("추가 에러");
		return "redirect:index";
	}

}
