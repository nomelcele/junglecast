package or.junglecast.mvc.model;

import or.junglecast.mvc.dao.MainDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainModel {
	
	@Autowired
	private MainDao dao;
	
	@RequestMapping("main")
	public ModelAndView gotoMain(){
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("categories", dao.selectCategoryLists());
		mav.addObject("contents", dao.selectArticleLists());
		return mav;
	}

}
