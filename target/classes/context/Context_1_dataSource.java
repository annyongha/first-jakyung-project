package context;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class Context_1_dataSource {

	@Bean //spring이 자동으로 이 메서드를 실행해서 객체를 만들어줌
	public DataSource ds() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.OracleDriver");//ojbc경로 ojdbc라는 jar파일 그걸 실행
		ds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");//어디 db를 쓸건지 oracledb
		ds.setUsername("project_2");// db의 계정
		ds.setPassword("1111");//비밀번호
		return ds;
	}

}
