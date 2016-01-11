package or.junglecast.mvc.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.EditDao;
import or.junglecast.mvc.dao.MainDao;
import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ProfileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EditModel {
	@Autowired
	private EditDao edao;
	@Autowired
	private MainDao mdao;
	
	@RequestMapping("editInfo")
	public String editInfo(HttpSession session, Model model){
		// 개인 정보 수정 페이지 이동
//		int m_id = 1; 
		int m_id = (Integer)(session.getAttribute("id")); // 로그인한 회원 번호
		model.addAttribute("m_id", m_id);//헤더에 필요한 정보
		model.addAttribute("userInfo", mdao.selectUserInfo(m_id));//헤더에 필요한 정보
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
	public String changePwd(HttpSession session, String m_pw){
		// 비밀번호 변경
		AccountVO acvo = new AccountVO();
		acvo.setM_id((Integer)(session.getAttribute("id")));
		acvo.setM_id(1);
		acvo.setM_pw(m_pw);
		edao.changePwd(acvo);
		return "redirect:main";
	}
	
	@RequestMapping("editProfile")
	public String editProfile(ProfileVO prvo, HttpSession session){
		// 프로필 수정
		prvo.setM_id((Integer)(session.getAttribute("id")));
		
		MultipartFile m_picFile = prvo.getM_picFile(); // 이미지 파일
		String fileName = m_picFile.getOriginalFilename(); // 파일 이름

		if(!fileName.equals("")){
			String realPath = session.getServletContext().getRealPath("/");
			StringBuffer path = new StringBuffer();
			path.append(realPath).append("resources/memberImg/").append(fileName);
			System.out.println("File Upload Path: "+path.toString());
			
			File file = new File(path.toString());
			file.mkdirs();
			
			try {
				m_picFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			prvo.setM_pic(fileName);
		}
		
		prvo.setM_id(1);
		edao.editProfile(prvo);
		return "redirect:main";
	}
	
	@RequestMapping(value="deleteAccount")
	public String deleteAccount(HttpSession session){
		// 계정 삭제
		int m_id = (Integer)(session.getAttribute("id"));
		edao.deleteAccount(1);
		return "redirect:main";
	}
	
}
