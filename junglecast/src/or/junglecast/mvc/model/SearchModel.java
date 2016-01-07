package or.junglecast.mvc.model;

import or.junglecast.mvc.dao.MainDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchModel {
	@Autowired
	private MainDao dao;
	
	@RequestMapping("search")
	public ModelAndView search(@RequestParam("section") String section, @RequestParam("key") String key){
		ModelAndView mav = new ModelAndView("search");
		mav.addObject("categories", dao.selectCategoryLists());
		mav.addObject("section", section);
		mav.addObject("key", key);
		return mav;
	}
	
	@RequestMapping("searchMobile")
	public ModelAndView searchMobile(){
		ModelAndView mav = new ModelAndView("search");
		
		return mav;
	}
	
}
