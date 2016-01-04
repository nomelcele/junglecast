package or.junglecast.mvc.dao;

import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.PictureVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WriteArticleDao {
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	public int insertArticle(ArticleVO aVo){
		sqlSession.insert("wa.insertArticle", aVo);
		return sqlSession.selectOne("wa.selectLatestKey");
	}
	
	public int insertPicture(PictureVO pVo){
		sqlSession.insert("wa.insertPicture", pVo);
		return sqlSession.selectOne("wa.selectPic_ids");
	}
}
