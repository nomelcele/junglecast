package or.junglecast.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProfileVO {
	private int profile_id, m_id;
	private String m_nickname, m_pic, m_introduce, m_web1, m_web2, m_web3;
	private MultipartFile m_picFile;
	
	public MultipartFile getM_picFile() {
		return m_picFile;
	}
	public void setM_picFile(MultipartFile m_picFile) {
		this.m_picFile = m_picFile;
	}
	public int getProfile_id() {
		return profile_id;
	}
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public String getM_introduce() {
		return m_introduce;
	}
	public void setM_introduce(String m_introduce) {
		this.m_introduce = m_introduce;
	}
	public String getM_web1() {
		return m_web1;
	}
	public void setM_web1(String m_web1) {
		this.m_web1 = m_web1;
	}
	public String getM_web2() {
		return m_web2;
	}
	public void setM_web2(String m_web2) {
		this.m_web2 = m_web2;
	}
	public String getM_web3() {
		return m_web3;
	}
	public void setM_web3(String m_web3) {
		this.m_web3 = m_web3;
	}
	
	

}
