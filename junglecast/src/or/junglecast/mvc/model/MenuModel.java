package or.junglecast.mvc.model;


import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import or.junglecast.email.Email;
import or.junglecast.email.EmailSender;
import or.junglecast.mvc.dao.JoinDao;
import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ProfileVO;

@Controller
public class MenuModel {
	
	@Autowired
	private JoinDao jdao;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	
	
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
	public ModelAndView InsertJoinInfo(AccountVO acvo, HttpSession session){
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
		if(insertedJoininfo!=0){
			session.setAttribute("id", insertedJoininfo);
			session.setAttribute("pw", acvo.getM_pw());
		}
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
	
	@RequestMapping(value = "LoginInfo")
	public ModelAndView LoginInfo(String m_mail, String pw, HttpSession session){
		ModelAndView mav = new ModelAndView("jsonView");
		AccountVO selectedPw = jdao.LoginInfo(m_mail);
		//System.out.println(selectedPw);
		if(selectedPw!=null){
			mav.addObject("m_pw", selectedPw.getM_pw());
			mav.addObject("m_id", selectedPw.getM_id());
			if(selectedPw.getM_pw().equals(pw)){
				session.setAttribute("id", selectedPw.getM_id());
				session.setAttribute("pw", pw);
			}
			return mav;
		}
		else{
			mav.addObject("m_pw","0");
			return mav;
		}
	}
	@RequestMapping(value = "DoubleInfo")
	public ModelAndView DoubleInfo(String m_mail){
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(m_mail);
		String Isdouble = jdao.DoubleInfo(m_mail);
		mav.addObject("m_id", Isdouble);
		return mav;
	}
	@RequestMapping(value = "nicknameDoubleInfo")
	public ModelAndView nicknameDoubleInfo(String m_nickname){
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(m_nickname);
		String Isdouble = jdao.nicknameDoubleInfo(m_nickname);
		mav.addObject("m_id", Isdouble);
		return mav;
	}
	
/*	@RequestMapping("sendEmailAction")
    public ModelAndView sendEmailAction (String m_mail) throws Exception {
        ModelAndView mav = new ModelAndView("jsonView");
        //AccountVO selectedPw = new AccountVO();
        //selectedPw.setM_mail(m_mail);
        
        AccountVO selectedPw = jdao.sendEmailAction(m_mail);
        mav.addObject("m_pw", selectedPw.getM_pw());
        String id=m_mail;
        String pw=selectedPw.getM_pw();
        System.out.println(pw);
        email.setContent("비밀번호는 "+pw+" 입니다.");
        email.setReceiver(m_mail);
        email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
        emailSender.SendEmail(email);
        return mav;
    }*/
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:main");
		session.invalidate();
		return mav;
	}
	
	@RequestMapping("sendEmailAction")
    public ModelAndView sendEmailAction (String m_mail) throws Exception {
        ModelAndView mav = new ModelAndView("jsonView");
        //AccountVO selectedPw = new AccountVO();
        //selectedPw.setM_mail(m_mail);
        AccountVO selectedPw = new AccountVO();
        selectedPw.setM_mail(m_mail);
        StringBuffer buffer = new StringBuffer();
        Random random = new Random();
        String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");    		
        for (int i = 0; i < 6; i++) {
        buffer.append(chars[random.nextInt(chars.length)]);
        }
        selectedPw.setM_pw(buffer.toString());
        //AccountVO selectedPw = jdao.sendEmailAction(m_mail);
        jdao.sendEmailAction(selectedPw);
       // mav.addObject("m_pw", selectedPw.getM_pw());
        mav.addObject("m_pw", buffer.toString());
        String id=m_mail;
        String pw=selectedPw.getM_pw();
        System.out.println(pw);
        email.setContent("비밀번호는 "+pw+" 입니다.");
        email.setReceiver(m_mail);
        email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
        emailSender.SendEmail(email);
        return mav;
    }
	

}
