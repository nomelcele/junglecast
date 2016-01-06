package or.junglecast.mvc.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import or.junglecast.mvc.dao.ArticleDao;
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
	
	@RequestMapping(value="articleDetail")
	public String articleDetail(int article_id, Model model){
		// 게시물 불러오기
		adao.updateView(article_id); // 조회수 증가
		ArticleVO arvo = adao.articleContent(article_id);
		model.addAttribute("articleContent", arvo); // 게시물 내용
		model.addAttribute("articlePicture", adao.articlePicture(article_id)); // 게시물 이미지
		model.addAttribute("editorInfo", adao.editorInfo(arvo.getM_id())); // 작성자 프로필
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // 베스트 댓글 목록
		model.addAttribute("replyList", adao.replyList(article_id)); // 댓글 목록
		
		return "detail/articleDetail";
	}

	@RequestMapping(value="likeArticle")
	public void likeArticle(int article_id){
		// 게시물 좋아요
		adao.likeArticle(article_id);
	}
	
	@RequestMapping(value="shareArticle")
	public void shareArticle(int article_id){
		// 게시물 sns 공유
		adao.shareArticle(article_id);
	}
	
	@RequestMapping(value="writeReply")
	public String writeReply(ReplyVO revo, HttpSession session, Model model){
		// 댓글 작성
		int article_id = revo.getArticle_id();
//		revo.setM_id(((AccountVO)session.getAttribute("acvo")).getM_id()); // 현재 접속한 사용자의 번호
		adao.writeReply(revo); // 댓글 작성
		adao.updateReply(article_id); // 댓글 갯수 증가
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // 베스트 댓글 목록
		model.addAttribute("replyList", adao.replyList(article_id)); // 댓글 목록
		return "detail/replyList";
	}
	
	@RequestMapping(value="likeReply")
	public String likeReply(int reply_id){
		// 댓글 좋아요
		adao.likeReply(reply_id);
		return "";
	}
	
	@RequestMapping(value="rereplyList")
	public String rereplyList(int reply_id, Model model){
		// 답글 불러오기
		model.addAttribute("rereplyList", adao.rereplyList(reply_id));
		model.addAttribute("reply_id", reply_id);
		return "detail/rereplyList";
	}
	
	@RequestMapping(value="writeRereply")
	public String writeRereply(Re_replyVO rrvo, HttpSession session){
		// 답글 작성
//		rrvo.setM_id(((AccountVO)session.getAttribute("acvo")).getM_id()); // 현재 접속한 사용자의 번호
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
