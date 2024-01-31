package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.CartDAO;
import dao.CategoryDAO;
import dao.FaqDAO;
import dao.GoodsDAO;
import dao.LikeDAO;
import dao.MemberDAO;
import dao.MyPageDAO;
import dao.RecentlyDAO;

@Configuration
public class Context_3_dao {

	@Bean
	public GoodsDAO goodsDAO() {
		return new GoodsDAO();
	}

	@Bean
	public MemberDAO memberDAO() {
		return new MemberDAO();
	}

	@Bean
	public RecentlyDAO recentlyDAO() {
		return new RecentlyDAO();
	}

	@Bean
	public CartDAO cartDAO() {
		return new CartDAO();
	}
	
	@Bean
	public FaqDAO faqDAO() {
		return new FaqDAO();
	}
	
	@Bean
	public CategoryDAO categoryDAO() {
		return new CategoryDAO();
	}
	
	@Bean
	public MyPageDAO myPageDAO() {
		return new MyPageDAO();
	}
	
	@Bean
	public LikeDAO likeDAO() {
		return new LikeDAO();
	}
}