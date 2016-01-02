package or.junglecast.mvc.model;

import java.util.List;

import or.junglecast.mvc.dao.ArticleDao;
import or.junglecast.vo.ArticleVO;
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
		// 게시물 보기
		adao.updateView(article_id); // 조회수 증가
		ArticleVO arvo = adao.articleContent(article_id);
		model.addAttribute("articleContent", arvo); // 게시물 내용
		model.addAttribute("editorInfo", adao.editorInfo(arvo.getM_id())); // 작성자 프로필
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
	
}
