package or.junglecast.mvc.dao;

import java.util.HashMap;
import java.util.List;

import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.BestArticleVO;
import or.junglecast.vo.CategoryVO;
import or.junglecast.vo.MainArticleVO;
import or.junglecast.vo.ProfileVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	public List<CategoryVO> selectCategoryLists(){
		return sqlSession.selectList("main.categoryList");
	}
	
	public List<MainArticleVO> selectArticleLists(int num){
		return sqlSession.selectList("main.articleList", num);
	}
	
	public List<ArticleVO> selectThisCategory(HashMap<String, Integer> map){
		return sqlSession.selectList("main.thisCategoryList", map);
	}

	public List<BestArticleVO> selectBestArticles() {
		return sqlSession.selectList("main.bestArticles");
	}

	public CategoryVO selectCateName(int category_id) {
		return sqlSession.selectOne("main.selectCateName", category_id);
	}

	public ProfileVO selectUserInfo(int m_id) {
		return sqlSession.selectOne("main.selectUserInfo", m_id);
	}


}
