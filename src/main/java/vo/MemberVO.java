package vo;

import lombok.Data;

@Data
public class MemberVO {
	private int idx,rank,question;
	private String name,nickname,jumin,pwd,gen,addr,postcode,email,hobby,tel,answer,corpaddr;
}
