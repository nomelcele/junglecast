package or.junglecast.mvc.dao;

import java.util.List;

import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.BestArticleVO;
import or.junglecast.vo.CategoryVO;
import or.junglecast.vo.MainArticleVO;
import or.junglecast.vo.RecommendVO;

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
	
	public List<MainArticleVO> selectArticleLists(){
		return sqlSession.selectList("main.articleList");
	}
	
	public List<ArticleVO> selectThisCategory(int category_id){
		return sqlSession.selectList("main.thisCategoryList", category_id);
	}

	public List<BestArticleVO> selectBestArticles() {
		return sqlSession.selectList("main.bestArticles");
	}

}
