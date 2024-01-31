package vo;

import lombok.Data;

@Data
public class CartVO {

	private int idx, m_idx, g_idx, g_count, g_price;
	private String c_addr, g_size, deadline;
	private GoodsVO goodsData;
}
