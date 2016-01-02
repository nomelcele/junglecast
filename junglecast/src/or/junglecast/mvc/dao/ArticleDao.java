package or.junglecast.mvc.dao;

import java.util.List;

import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.ProfileVO;
import or.junglecast.vo.Re_replyVO;
import or.junglecast.vo.ReplyVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDao {
	@Autowired
	private SqlSessionTemplate st;
	
	public ArticleVO articleContent(int article_id){
		// �Խù� ����
		return st.selectOne("article.articleContent", article_id);
	}
	
	public ProfileVO editorInfo(int m_id){
		// �Խù� �ۼ���(������) ������
		return st.selectOne("article.editorInfo", m_id);
	}
	
	public void likeArticle(int article_id){
		// �Խù� ���ƿ� ���� �� ���ƿ� �� ����
		st.update("article.likeArticle", article_id);
	}
	
	public void shareArticle(int article_id){
		// �Խù� sns�� �������� �� ���� �� ����
		st.update("article.shareArticle", article_id);
	}
	
	public List<ReplyVO> replyList(int article_id){
		// �Խù��� �޸� ��� ���
		return st.selectList("article.replyList", article_id);
	}
	
	public List<Re_replyVO> rereplyList(int reply_id){
		// ��ۿ� �޸� ��� ���
		return st.selectList("article.rereplyList", reply_id);
	}
	
	public void writeReply(ReplyVO revo){
		// ��� �ۼ�
		st.insert("article.writeReply", revo);
	}
	
	public void updateReply(int article_id){
		// ��� �ۼ� �� ��� �� ����
		st.update("article.updateReply", article_id);
	}
	
	public void writeRereply(Re_replyVO rrvo){
		// ��ۿ� ��� �ۼ�
		st.insert("article.writeRereply", rrvo);
	}
	
	public void likeReply(int reply_id){
		// ��� ���ƿ� ���� �� ���ƿ� �� ����
		st.update("article.likeReply", reply_id);
	}
	
	public List<ReplyVO> bestReplyList(int article_id){
		// ����Ʈ ���(���ƿ� �� ���� 5�� �ȿ� ��� ���)
		return st.selectList("article.bestReplyList", article_id);
	}

	public void updateView(int article_id){
		// ��ȸ�� ����
		st.update("article.updateView", article_id);
	}
}
