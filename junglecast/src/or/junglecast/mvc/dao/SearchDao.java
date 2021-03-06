package or.junglecast.mvc.dao;

import java.util.HashMap;
import java.util.List;

import or.junglecast.vo.ProfileVO;
import or.junglecast.vo.RecommendVO;
import or.junglecast.vo.SearchVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {

	@Autowired
	 private SqlSessionTemplate sqlSession;
	
	public void insertSearchKey(String search_txt){
		sqlSession.insert("search.insertSearchKey", search_txt);
	}

	public List<SearchVO> searchContentByKey(HashMap<String, Object> map) {
		return sqlSession.selectList("search.searchContentByKey", map);
	}

	public List<ProfileVO> searchUserByKey(HashMap<String, Object> map) {
		return sqlSession.selectList("search.searchUserByKey", map);
	}

	public List<RecommendVO> recommendSearchKey() {
		return sqlSession.selectList("search.recommendSearchKey");
	}
	
}
