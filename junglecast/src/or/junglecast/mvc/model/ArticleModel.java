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
		// �Խù� ����
		adao.updateView(article_id); // ��ȸ�� ����
		ArticleVO arvo = adao.articleContent(article_id);
		model.addAttribute("articleContent", arvo); // �Խù� ����
		model.addAttribute("editorInfo", adao.editorInfo(arvo.getM_id())); // �ۼ��� ������
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
	
}
