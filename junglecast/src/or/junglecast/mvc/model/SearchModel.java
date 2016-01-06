package or.junglecast.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchModel {

	@RequestMapping("search")
	public ModelAndView search(){
		
		return new ModelAndView("search");
	}
	
}
