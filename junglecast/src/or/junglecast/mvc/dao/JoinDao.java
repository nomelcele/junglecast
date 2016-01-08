package or.junglecast.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.junglecast.vo.AccountVO;



@Repository
public class JoinDao {
	
	@Autowired
	private SqlSessionTemplate st;
	
	public void InsertJoinInfo(AccountVO acvo){
		// 회원가입 정보삽입
		st.insert("join.InsertJoinInfo", acvo);
	}
	
}
