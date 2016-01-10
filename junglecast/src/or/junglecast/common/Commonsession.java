package or.junglecast.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Commonsession extends HandlerInterceptorAdapter {
private static final Log log = LogFactory.getLog(Commonsession.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
		log.info("session체크");
		HttpSession session  =  request.getSession();
		String m_mail = (String)session.getAttribute("id");
		log.info("현재 로그인하려는 m_mail = "+m_mail);
		if ( m_mail == null) {		//session check
			response.sendRedirect("menu=login");
			return false;
		}
		else{
			return true;
		}
	}

}
