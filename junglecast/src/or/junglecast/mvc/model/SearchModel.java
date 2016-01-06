package or.junglecast.mvc.model;

import or.junglecast.mvc.dao.MainDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchModel {
	@Autowired
	private MainDao dao;
	
	@RequestMapping("search")
	public ModelAndView search(){
		ModelAndView mav = new ModelAndView("search");
		mav.addObject("categories", dao.selectCategoryLists());
		return mav;
	}
	
}
