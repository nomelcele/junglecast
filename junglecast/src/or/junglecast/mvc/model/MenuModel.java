package or.junglecast.mvc.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import or.junglecast.mvc.dao.JoinDao;
import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ProfileVO;

@Controller
public class MenuModel {
	
	@Autowired
	private JoinDao jdao;
	
	@RequestMapping("/menu=login")
	public ModelAndView gotoLogin(){
		return new ModelAndView("/menu/login");
	}
	
	@RequestMapping("/menu=password")
	public ModelAndView gotoPassword(){
		return new ModelAndView("/menu/password");
	}
	
	@RequestMapping("/menu=join")
	public ModelAndView gotoJoin(){
		return new ModelAndView("/menu/join");
	}
	
	@RequestMapping(value="InsertJoinInfo", method = RequestMethod.POST)
	public ModelAndView InsertJoinInfo(AccountVO acvo){
		// 회원가입
		//int m_id= acvo.getM_id();
		System.out.println("asdfasfdas");
		System.out.println(acvo.getM_id());
		System.out.println(acvo.getM_mail());
		System.out.println(acvo.getM_pw());
		System.out.println(acvo.getM_gender());
		System.out.println(acvo.getM_birth());
		System.out.println(acvo.getM_joindate());
		ModelAndView mav = new ModelAndView("jsonView");
		int insertedJoininfo = jdao.InsertJoinInfo(acvo);
		mav.addObject("m_id", insertedJoininfo);
		return mav;
	}
	
	@RequestMapping(value="InsertProfileInfo", method = RequestMethod.POST)
	public ModelAndView InsertProfileInfo(ProfileVO prvo){
		// 프로필입력
		System.out.println(prvo.getM_id());
		System.out.println(prvo.getM_nickname());
		System.out.println(prvo.getM_introduce());
		System.out.println(prvo.getM_pic());
		ModelAndView mav = new ModelAndView("jsonView");
		int insertedProfileinfo = jdao.InsertProfileInfo(prvo);
		mav.addObject("profile_id", insertedProfileinfo);
		return mav;
	}
}
