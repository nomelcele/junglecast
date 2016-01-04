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
		// �Խù� �ҷ�����
		adao.updateView(article_id); // ��ȸ�� ����
		ArticleVO arvo = adao.articleContent(article_id);
		model.addAttribute("articleContent", arvo); // �Խù� ����
		model.addAttribute("editorInfo", adao.editorInfo(arvo.getM_id())); // �ۼ��� ������
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // ����Ʈ ��� ���
		model.addAttribute("replyList", adao.replyList(article_id)); // ��� ���
		
		return "detail/articleDetail";
	}

	@RequestMapping(value="likeArticle")
	public void likeArticle(int article_id){
		// �Խù� ���ƿ�
		adao.likeArticle(article_id);
	}
	
	@RequestMapping(value="shareArticle")
	public void shareArticle(int article_id){
		// �Խù� sns ����
		adao.shareArticle(article_id);
	}
	
	@RequestMapping(value="writeReply")
	public String writeReply(ReplyVO revo, HttpSession session, Model model){
		// ��� �ۼ�
		int article_id = revo.getArticle_id();
		revo.setM_id(((AccountVO)session.getAttribute("acvo")).getM_id()); // ���� ������ ������� ��ȣ
		adao.writeReply(revo); // ��� �ۼ�
		adao.updateReply(article_id); // ��� ���� ����
		model.addAttribute("bestReplyList", adao.bestReplyList(article_id)); // ����Ʈ ��� ���
		model.addAttribute("replyList", adao.replyList(article_id)); // ��� ���
		return "detail/replyList";
	}
	
	@RequestMapping(value="likeReply")
	public String likeReply(int reply_id){
		// ��� ���ƿ�
		adao.likeReply(reply_id);
		return "";
	}
	
	@RequestMapping(value="rereplyList")
	public String rereplyList(int reply_id, Model model){
		// ��� �ҷ�����
		model.addAttribute("rereplyList", adao.rereplyList(reply_id));
		model.addAttribute("reply_id", reply_id);
		return "detail/rereplyList";
	}
	
	@RequestMapping(value="writeRereply")
	public String writeRereply(Re_replyVO rrvo, HttpSession session){
		// ��� �ۼ�
		rrvo.setM_id(((AccountVO)session.getAttribute("acvo")).getM_id()); // ���� ������ ������� ��ȣ
		adao.writeRereply(rrvo);
		return "redirect:rereplyList?reply_id="+rrvo.getReply_id();
	}
	
}
