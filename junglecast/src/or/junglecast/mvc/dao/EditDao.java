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
		// 비밀번호 변경
		st.update("edit.changePwd", acvo);
	}
	
	public void editProfile(ProfileVO prvo){
		// 정보 변경
		st.update("edit.editProfile", prvo);
	}
	
	public void deleteAccount(int m_id){
		// 계정 삭제
		st.delete("edit.deleteAccount", m_id);
	}
}
