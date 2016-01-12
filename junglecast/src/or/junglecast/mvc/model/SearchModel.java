package or.junglecast.mvc.model;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.MainDao;
import or.junglecast.mvc.dao.SearchDao;
import or.junglecast.vo.ProfileVO;
import or.junglecast.vo.SearchVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchModel {
	@Autowired
	private MainDao dao;
	@Autowired
	private SearchDao sDao;
	
	@RequestMapping("search")
	public ModelAndView search(@RequestParam("section") String section, @RequestParam("key") String key, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView("search/search");

		int id = 0;
		try{
			id = (int)  request.getSession().getAttribute("id");
		}catch(Exception e){
			id=0;
		}
		mav.addObject("m_id", id);
		mav.addObject("userInfo", dao.selectUserInfo(id));
		
		//cookie - 새로고침 시 db에 계속 검색어 업데이트 되는 것을 막음
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		System.out.println("검색어 : " +key);
		
		if(cookies != null || cookies.length > 0){
			for(Cookie ck : cookies){
				System.out.println(ck.getName() + " : " + URLDecoder.decode((ck.getValue()), "UTF-8"));
			}
			for(int i = 0; i< cookies.length; i++){
				if(cookies[i].getName().equals("KEY")){ //Cookie의 name이 KEY와 일치하는 쿠키를 viewCookie에 넣어준다.
					viewCookie = cookies[i];
				}
			}  
		}

		String keyEncoded =  URLEncoder.encode("|"+key+"|","utf-8");
		//Cookie없다면
		if(viewCookie == null){
			Cookie newCookie = new Cookie("KEY", keyEncoded); //"KEY"는 name, "|"+key+"|" 는value
			newCookie.setMaxAge(300); //쿠키 유효시간 5분(60초*5)
			newCookie.setPath("/"); //해당 경로에서 유효한 쿠키
			response.addCookie(newCookie);
			sDao.insertSearchKey(key); //db에 검색어 insert
		}else{
			String value = URLDecoder.decode((viewCookie.getValue()),"utf-8");
			if(value.indexOf("|"+key+"|") <  0){ // 입력한 키와 일치하는 키가 없으면 추가한다.
				sDao.insertSearchKey(key); //db에 검색어 insert
				System.out.println(value);
				value = URLEncoder.encode(value+"|"+key+"|","utf-8");
				viewCookie.setValue(value);
				response.addCookie(viewCookie);
			}
		}
		
		mav.addObject("recommend", sDao.recommendSearchKey());
		mav.addObject("categories", dao.selectCategoryLists());
		mav.addObject("section", section);
		mav.addObject("key", key);
		return mav;
	}
	
	@RequestMapping("searchMobile")
	public ModelAndView searchMobile(HttpSession session){
		ModelAndView mav = new ModelAndView("search/search");
		int id = 0;
		try{
			id = (int)  session.getAttribute("id");
		}catch(Exception e){
			id=0;
		}
		mav.addObject("m_id", id);
		mav.addObject("userInfo", dao.selectUserInfo(id));
		
		mav.addObject("mobile", "mobile");
		mav.addObject("section", "story");
		mav.addObject("recommend", sDao.recommendSearchKey());
		return mav;
	}
	
	@RequestMapping("searchKey")
	public String searchKey(@RequestParam("key") String key, @RequestParam("section") String section, 
			@RequestParam("num") String num, Model model){
		String[] splitKey =  key.split(" ");
		List<String> keys = new ArrayList<>();
		
		for (int i=0; i<splitKey.length; i++){
			System.out.println("검색어 : " + splitKey[i]);
			keys.add("%"+splitKey[i]+"%");
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("key", keys);
		map.put("num", num);
		
		if(section.equals("story")){
			List<SearchVO> list = sDao.searchContentByKey(map);
			model.addAttribute("contents", list);
			model.addAttribute("key", key);
			return "search/searchedContents";
		}else{
			List<ProfileVO> list = sDao.searchUserByKey(map);
			model.addAttribute("users", list);
			model.addAttribute("key", key);
			return "search/searchedUsers";
		}	
	}
	
	@RequestMapping("recommendKey")
	public ModelAndView recommendKey(){
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("recommend", sDao.recommendSearchKey());
		return mav;
	}
	
	@RequestMapping("searchLoadMore")
	public ModelAndView searchLoadMore(@RequestParam("key") String key, @RequestParam("section") String section, 
			@RequestParam("num") String num, Model model){
		ModelAndView mav = new ModelAndView("jsonView");
		String[] splitKey =  key.split(" ");
		List<String> keys = new ArrayList<>();
		
		for (int i=0; i<splitKey.length; i++){
			System.out.println("검색어 : " + splitKey[i]);
			keys.add("%"+splitKey[i]+"%");
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("key", keys);
		map.put("num", num);
		
		if(section.equals("story")){
			List<SearchVO> list = sDao.searchContentByKey(map);
			mav.addObject("cards", list);
		}else{
			List<ProfileVO> list = sDao.searchUserByKey(map);
			mav.addObject("cards", list);
		}	
		return mav;
	}	
}
