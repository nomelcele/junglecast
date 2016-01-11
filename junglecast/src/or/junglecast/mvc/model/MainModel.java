package or.junglecast.mvc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.MainDao;
import or.junglecast.vo.MainArticleVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainModel {
	
	@Autowired
	private MainDao dao;
	
	@RequestMapping("main")
	public ModelAndView gotoMain(HttpSession session){
		ModelAndView mav = new ModelAndView("main");
		int id = 0;
		try{
			id = (int) session.getAttribute("id");
		}catch(Exception e){
			id=0;
		}
		System.out.println("id : " + id);
		mav.addObject("m_id", id);
		mav.addObject("userInfo", dao.selectUserInfo(id));
		mav.addObject("bestArticles", dao.selectBestArticles());
		mav.addObject("categories", dao.selectCategoryLists());
		mav.addObject("contents", dao.selectArticleLists(0));
		return mav;
	}

	
	@RequestMapping(value = "MainLoadMore", method = RequestMethod.POST)
	public ModelAndView mainLoadMore(@RequestParam("num") String num){
		ModelAndView mav = new ModelAndView("jsonView");
		List<MainArticleVO> list = dao.selectArticleLists(Integer.parseInt(num));
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).getArticle_title());
		}
		mav.addObject("cards", list);
		return mav;
	}
	
	@RequestMapping("category")
	public ModelAndView categoryPage(@RequestParam("category_id") String cate_id, HttpSession session){
		ModelAndView mav = new ModelAndView("category");
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category_id",  Integer.parseInt(cate_id));
		map.put("num", 0);
		int id = 0;
		try{
			id = (int) session.getAttribute("id");
		}catch(Exception e){
			id=0;
		}
		mav.addObject("m_id", id);
		mav.addObject("userInfo", dao.selectUserInfo(id));
		mav.addObject("category_info", dao.selectCateName(Integer.parseInt(cate_id)));
		mav.addObject("contents", dao.selectThisCategory(map)); 
		mav.addObject("categories", dao.selectCategoryLists());
		return mav;
	}
	
	@RequestMapping("loadMoreThisCategory")
	public ModelAndView selectThisCategory(@RequestParam("categoryId") String category_id, @RequestParam("num") String num){
		ModelAndView mav = new ModelAndView("jsonView");
		HashMap<String, Integer> map = new HashMap<>();
		System.out.println("loadMoreThisCategory : " +category_id + "," + num);
		map.put("category_id", Integer.parseInt(category_id));
		map.put("num", Integer.parseInt(num));
		mav.addObject("result", dao.selectThisCategory(map));
		return mav;
	}
	
}
