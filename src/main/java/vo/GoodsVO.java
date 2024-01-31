package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVO {

	private int idx;
	private int u_idx;
	private String g_name;
	private int g_price;
	private String g_title;
	private MultipartFile g_photo;
	private MultipartFile contentFile;
	private String content;
	private double review;
	private double sale;
	private String division;
}
