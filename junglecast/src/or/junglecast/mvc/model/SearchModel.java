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

import or.junglecast.mvc.dao.MainDao;
import or.junglecast.mvc.dao.SearchDao;
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
		 
		//cookie - 새로고침 시 db에 계속 검색어 업데이트 되는 것을 막음
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		System.out.println("검색어 : " +key);
		
		if(cookies != null || cookies.length > 0){
			for(Cookie ck:cookies){
				System.out.println(ck.getName() + ":" + URLDecoder.decode((ck.getValue()),"utf-8"));
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
			response.addCookie(newCookie);
		}else{
			String value = URLDecoder.decode((viewCookie.getValue()),"utf-8");
		  
			if(value.indexOf("|"+key+"|") <  0){ // 입력한 키와 일치하는 키가 없으면 추가한다.
				sDao.insertSearchKey(key); //db에 검색어 insert
				value = URLEncoder.encode(value+"|"+key+"|","utf-8");
				viewCookie.setValue(value);
				response.addCookie(viewCookie);
			}
		}
		
		mav.addObject("categories", dao.selectCategoryLists());
		mav.addObject("section", section);
		mav.addObject("key", key);
		return mav;
	}
	
	@RequestMapping("searchMobile")
	public ModelAndView searchMobile(){
		ModelAndView mav = new ModelAndView("search/search");
		
		return mav;
	}
	
	@RequestMapping("searchKey")
	public String searchKey(@RequestParam("key") String key, Model model){
		String[] splitKey =  key.split(" ");
		List<String> keys = new ArrayList<>();
		for (int i=0; i<splitKey.length; i++){
			System.out.println("검색어 : " + splitKey[i]);
			keys.add("%"+splitKey[i]+"%");
		}
		HashMap<String, List<String>> map = new HashMap<>();
		map.put("key", keys);
		
		List<SearchVO> list = sDao.searchContentByKey(map);
		model.addAttribute("contents", list);
		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).getArticle_title());
		}
		
		return "search/searchedContents";
		
	}
}
