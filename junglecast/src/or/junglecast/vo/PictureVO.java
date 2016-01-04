package or.junglecast.vo;

public class PictureVO {
	private int pic_id, article_id, pic_order;
	private String pic_url, pic_text;
	
	
	public PictureVO() {}

	public PictureVO(int article_id, int pic_order, String pic_url,
			String pic_text) {
		super();
		this.article_id = article_id;
		this.pic_order = pic_order;
		this.pic_url = pic_url;
		this.pic_text = pic_text;
	}
	
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getPic_order() {
		return pic_order;
	}
	public void setPic_order(int pic_order) {
		this.pic_order = pic_order;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public String getPic_text() {
		return pic_text;
	}
	public void setPic_text(String pic_text) {
		this.pic_text = pic_text;
	}

}
