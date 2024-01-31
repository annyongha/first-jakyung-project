package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class Context_4_fileupload {

	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		
		//인코딩 타입 설정
		multipartResolver.setDefaultEncoding("utf-8");
		
		//최대 업로드 용량을 지정
		multipartResolver.setMaxUploadSize(10485760L);
		return multipartResolver;
	}
}