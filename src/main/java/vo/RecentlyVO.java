package vo;

import lombok.Data;

@Data
public class RecentlyVO {
	
	private int rank;
	private int idx;
	private int user_idx;
	private int goods_idx;
	private String goods_title_name;
	private int goods_price;
}
