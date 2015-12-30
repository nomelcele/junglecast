package or.junglecast.mvc.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleModel {
	@RequestMapping(value="/articleDetail")
	public String articleDetail(){
		return "detail/articleDetail";
	}
}
