package or.junglecast.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainModel {
	
	@RequestMapping("main")
	public ModelAndView gotoMain(){
		return new ModelAndView("main");
	}
	
	@RequestMapping("slider")
	public ModelAndView gotoSlider(){
		return new ModelAndView("bootstrap-slider");
	}
}
