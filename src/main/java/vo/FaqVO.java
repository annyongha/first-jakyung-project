package vo;

import lombok.Data;

@Data
public class FaqVO {
	private int idx;
	private String member_id,category,category_title, title, content; 
}
