package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.team2.Member_Controller;
import com.korea.team2.MyPage_Controller;
import com.korea.team2.Web_Shopping_Controller;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.korea.auto","dao"})
//@ComponentScan("com.korea.db")
//어노테이션에도 상속관계가 있다
/*
 * @Component ㄴ@Controller ㄴ@Service ㄴ@Repository
 */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어 질 수 있다.
public class ServletContext implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

//	  @Bean 
//	  public InternalResourceViewResolver resolver() {
//	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//	  resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
//	  resolver.setSuffix(".jsp"); return resolver; }


	@Bean
	public Web_Shopping_Controller shopping_Controller() {
		return new Web_Shopping_Controller();
	}
	
	@Bean
	public Member_Controller MemberController() {
		return new Member_Controller();
	}
	
	@Bean MyPage_Controller myPage_Controller() {
		return new MyPage_Controller();
	}
	
}
