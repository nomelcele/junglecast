package or.junglecast.mvc.dao;

import java.util.List;

import or.junglecast.vo.CategoryVO;

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
}
