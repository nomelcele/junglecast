package or.junglecast.mvc.dao;

import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ProfileVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EditDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public AccountVO myAccount(int m_id){
		// 로그인한 회원의 계정 정보
		return st.selectOne("edit.myAccount", m_id);
	}
	
	public ProfileVO myProfile(int m_id){
		// 로그인한 회원의 프로필 정보
		return st.selectOne("edit.myProfile", m_id);
	}
	
	public void changePwd(AccountVO acvo){
		st.update("edit.changePwd", acvo);
	}
}
