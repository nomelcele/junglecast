/**
 * 
 */
$(function(){
	$("#likeBtn").click(function(){
		// 게시물 좋아요
		$.ajax({
			type: "POST",
			url: "likeArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		
	});
	
	$("#fbBtn").click(function(){
		// 페이스북 공유
		$.ajax({
			type: "POST",
			url: "shareArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		
	});
	
	$("#twBtn").click(function(){
		// 트위터 공유
		$.ajax({
			type: "POST",
			url: "shareArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		
	});
	
	$("#linkBtn").click(function(){
		// 링크 복사
		$("#linkArea").css('display','table').css('position','absolute');
	});
});

function showRereply(num){
	// 답글 보여주기
	$("#rereplyList"+num).toggle();
}
