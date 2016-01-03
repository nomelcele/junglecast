package or.junglecast.mvc.model;

import or.junglecast.mvc.dao.MainDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WriteArticleModel {

	@Autowired
	private MainDao mDao;
	
	@RequestMapping("writeArticle")
	public ModelAndView gotoMain(){
		ModelAndView mav = new ModelAndView("writeArticle");
		mav.addObject("categories", mDao.selectCategoryLists());
		return mav;
	}
}
