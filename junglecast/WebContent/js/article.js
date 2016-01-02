$(function(){
	$(".closebtn").click(function(){
		$("#articles_area").css("position","relative");
	});
	
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
		$("#copyLink").css('display','table').css('position','absolute');
		$("#articleLink").attr("value",window.location.href);
	});
	
	$("#linkCloseBtn").click(function(){
		// 링크 복사 모달 닫기
		$("#copyLink").css('display','none');
	});
	
	$("#writeReplyBtn").click(function(){
		// 댓글 작성
		$.ajax({
			type: "POST",
			url: "shareArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		

	});
});

function showRereply(num){
	// 답글 보여주기
	$("#rereplyList"+num).toggle();
}
