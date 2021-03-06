package or.junglecast.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Commonsession extends HandlerInterceptorAdapter {
private static final Log log = LogFactory.getLog(Commonsession.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
		log.info("session체크");
		HttpSession session  =  request.getSession();
		int m_mail = (int)session.getAttribute("id");
		log.info("현재 로그인하려는 m_mail = "+m_mail);
		if ( m_mail == 0) {		//session check
			response.sendRedirect("menu=login");
			return false;
		}
		else{
			return true;
		}
	}
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session){	
		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());	
		log.info("logout 현재시간 : "+curTime);
		session.invalidate();			//session 종료(안에있는 데이터 다삭제)
		return "redirect:main";
	}


}
