package or.junglecast.mvc.dao;

import java.util.List;

import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.PictureVO;
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
		// 게시물 내용
		return st.selectOne("article.articleContent", article_id);
	}
	
	public List<PictureVO> articlePicture(int article_id){
		return st.selectList("article.articlePicture", article_id);
	}
	
	public ProfileVO editorInfo(int m_id){
		// 게시물 작성자(에디터) 프로필
		return st.selectOne("article.editorInfo", m_id);
	}
	
	public void likeArticle(int article_id){
		// 게시물 좋아요 했을 때 좋아요 수 증가
		st.update("article.likeArticle", article_id);
	}
	
	public void shareArticle(int article_id){
		// 게시물 sns에 공유했을 때 공유 수 증가
		st.update("article.shareArticle", article_id);
	}
	
	public List<ReplyVO> replyList(int article_id){
		// 게시물에 달린 댓글 목록
		return st.selectList("article.replyList", article_id);
	}
	
	public List<Re_replyVO> rereplyList(int reply_id){
		// 댓글에 달린 답글 목록
		return st.selectList("article.rereplyList", reply_id);
	}
	
	public void writeReply(ReplyVO revo){
		// 댓글 작성
		st.insert("article.writeReply", revo);
	}
	
	public void updateReply(int article_id){
		// 댓글 작성 시 댓글 수 증가
		st.update("article.updateReply", article_id);
	}
	
	public void writeRereply(Re_replyVO rrvo){
		// 댓글에 답글 작성
		st.insert("article.writeRereply", rrvo);
	}
	
	public void likeReply(int reply_id){
		// 댓글 좋아요 했을 때 좋아요 수 증가
		st.update("article.likeReply", reply_id);
	}
	
	public List<ReplyVO> bestReplyList(int article_id){
		// 베스트 댓글(좋아요 수 상위 5위 안에 드는 댓글)
		return st.selectList("article.bestReplyList", article_id);
	}

	public void updateView(int article_id){
		// 조회수 증가
		st.update("article.updateView", article_id);
	}
	
	public void deleteReply(int reply_id){
		// 댓글 삭제
		st.delete("article.deleteReply", reply_id);
	}
	
	public void deleteRereply(int rereply_id){
		// 답글 삭제
		st.delete("article.deleteRereply", rereply_id);
	}	
}
