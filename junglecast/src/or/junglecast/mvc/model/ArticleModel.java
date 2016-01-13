package or.junglecast.mvc.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.ArticleDao;
import or.junglecast.mvc.dao.EditDao;
import or.junglecast.mvc.dao.MainDao;
import or.junglecast.vo.AccountVO;
import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.Re_replyVO;
import or.junglecast.vo.ReplyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleModel {
	@Autowired
	private ArticleDao adao;
	@Autowired
	private EditDao edao;
	@Autowired
	private MainDao mdao;
	
	@RequestMapping(value="articleDetail")
	public String articleDetail(int article_id, String type, Model model, HttpSession session){
		// 게시물 불러오기
		adao.updateView(article_id); // 조회수 증가
		ArticleVO arvo = adao.articleContent(article_id);
		model.addAttribute("articleContent", arvo); // 게시물 내용
		model.addAttribute("articlePicture", adao.articlePicture(article_id)); // 게시물 이미지
		model.addAttribute("editorInfo", adao.editorInfo(arvo.getM_id())); // 작성자 프로필
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // 베스트 댓글 목록
		model.addAttribute("replyList", adao.replyList(article_id)); // 댓글 목록
		
		int id = 0;
		try{id = (int) session.getAttribute("id");
		}catch(Exception e){id=0;}
		model.addAttribute("myProfile", edao.myProfile(id));
		if(type.equals("modal")){
			model.addAttribute("m_id", id);
			return "detail/articleDetail";
		} else {
			model.addAttribute("m_id", id);
			model.addAttribute("userInfo",mdao.selectUserInfo(id));
			return "detail/articleDetail2";
		}
	}

	@RequestMapping(value="likeArticle")
	public void likeArticle(int article_id, HttpServletResponse response) throws IOException{
		// 게시물 좋아요
		adao.likeArticle(article_id);
		Integer article_like = adao.articleContent(article_id).getArticle_like(); // 게시물 좋아요 수 

		PrintWriter pw = response.getWriter();
		pw.write(article_like.toString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="shareArticle")
	public void shareArticle(int article_id, HttpServletResponse response) throws IOException{
		// 게시물 sns 공유
		adao.shareArticle(article_id);
		Integer article_share = adao.articleContent(article_id).getArticle_share(); // 게시물 공유 수 

		PrintWriter pw = response.getWriter();
		pw.write(article_share.toString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="replyList")
	public String replyList(int article_id, Model model){
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // 베스트 댓글 목록
		model.addAttribute("replyList", adao.replyList(article_id)); // 댓글 목록
		return "detail/replyList";
	}
	
	@RequestMapping(value="writeReply")
	public String writeReply(ReplyVO revo, Model model, HttpSession session){
		// 댓글 작성
		int article_id = revo.getArticle_id();
		System.out.println("댓글 작성자: "+(int)(session.getAttribute("id")));
		revo.setM_id((int)(session.getAttribute("id"))); // 현재 접속한 사용자의 번호
		adao.writeReply(revo); // 댓글 작성
		adao.updateReply(article_id); // 댓글 갯수 증가
		return "redirect:replyList?article_id="+revo.getArticle_id();
	}
	
	@RequestMapping(value="likeReply")
	public String likeReply(ReplyVO revo){
		// 댓글 좋아요
		System.out.println("글 번호: "+revo.getArticle_id());
		adao.likeReply(revo.getReply_id());
		return "redirect:replyList?article_id="+revo.getArticle_id();
	}
	
	@RequestMapping(value="rereplyList")
	public String rereplyList(int reply_id, Model model, HttpSession session){
		// 답글 불러오기
		model.addAttribute("rereplyList", adao.rereplyList(reply_id));
		model.addAttribute("myProfile", edao.myProfile((int)session.getAttribute("id")));
		model.addAttribute("reply_id", reply_id);
		return "detail/rereplyList";
	}
	
	@RequestMapping(value="writeRereply")
	public String writeRereply(Re_replyVO rrvo, HttpSession session){
		// 답글 작성
		System.out.println("답글 작성자: "+(int)(session.getAttribute("id")));
		rrvo.setM_id((int)(session.getAttribute("id"))); // 현재 접속한 사용자의 번호
		adao.writeRereply(rrvo);
		return "redirect:rereplyList?reply_id="+rrvo.getReply_id();
	}
	
	@RequestMapping(value="deleteReply")
	public String deleteReply(int reply_id){
		// 댓글 삭제
		adao.deleteReply(reply_id);
		return "detail/replyList";
	}
	
	@RequestMapping(value="deleteRereply")
	public String deleteRereply(int rereply_id){
		// 답글 삭제
		adao.deleteRereply(rereply_id);
		return "detail/rereplyList";
	}
	
}
