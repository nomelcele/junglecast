package or.junglecast.mvc.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ProfileVO;



@Repository
public class JoinDao {
	
	@Autowired
	private SqlSessionTemplate st;
	
	public int InsertJoinInfo(AccountVO acvo){
		// 회원가입 정보삽입
		st.insert("join.InsertJoinInfo", acvo);
		return st.selectOne("join.select_m_id");
	}
	public int InsertProfileInfo(ProfileVO prvo){
		// 프로필 정보삽입
		st.insert("join.InsertProfileInfo", prvo);
		return st.selectOne("join.select_profile_id");
	}
	public AccountVO LoginInfo(String m_mail) {
		return st.selectOne("join.loginIdentify",m_mail);
	}
	public String DoubleInfo(String m_mail) {
		return st.selectOne("join.doubleInfo",m_mail);
	}
	public String nicknameDoubleInfo(String m_nickname) {
		return st.selectOne("join.nicknamedoubleInfo",m_nickname);
	}
/*	public AccountVO sendEmailAction (String m_mail){
		return st.selectOne("join.sendpw",m_mail);
	}*/
	public void sendEmailAction (AccountVO acvo){
		st.update("join.sendpw",acvo);
	}

}
