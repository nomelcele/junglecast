package or.junglecast.mvc.model;

import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.EditDao;
import or.junglecast.vo.AccountVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EditModel {
	@Autowired
	private EditDao edao;
	
	@RequestMapping("editInfo")
	public String editInfo(Model model){
		// 개인 정보 수정 페이지 이동
		int m_id = 1;
//		int m_id = ((AccountVO)session.getAttribute("acvo")).getM_id(); // 로그인한 회원 번호
		model.addAttribute("myAccount", edao.myAccount(m_id)); // 계정 정보
		model.addAttribute("myProfile", edao.myProfile(m_id)); // 프로필 정보
		String m_birth = edao.myAccount(m_id).getM_birth(); // 생년월일
		String[] m_birthArray = m_birth.split("-");
		model.addAttribute("birthYear", m_birthArray[0]);
		model.addAttribute("birthMonth", m_birthArray[1]);
		model.addAttribute("birthDay", m_birthArray[2].substring(0, 2));
		return "editInfo";
	}

	@RequestMapping("changePwd")
	public String changePwd(String m_pw){
		// 비밀번호 변경
		AccountVO acvo = new AccountVO();
//		acvo.setM_id(((AccountVO)session.getAttribute("acvo")).getM_id());
		acvo.setM_id(1);
		acvo.setM_pw(m_pw);
		edao.changePwd(acvo);
		return "redirect:main";
	}
}
