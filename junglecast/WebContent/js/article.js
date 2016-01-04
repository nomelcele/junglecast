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
		$("#copyLink").css('display','table');
		$("#main_body").css("overflow","hidden");
		$("#articleLink").attr("value",window.location.href);
	});
	
	$("#linkCloseBtn").click(function(){
		// 링크 복사 모달 닫기
		$("#copyLink").css('display','none');
		$("#main_body").css("overflow","visible");
	});
	
	$("#writeReplyBtn").click(function(){
		// 댓글 작성
		$.ajax({
			type: "POST",
			url: "writeReply",
			data: {
				article_id: $("#article_id").val(),
				reply_text: $("#reply_text").val()
			}, 
			success: function(result){
				$("#replyList").html(result);
			}
		});		

	});
	
});

function likeReply(reply_id){
	// 댓글 좋아요
	$.ajax({
		type: "POST",
		url: "likeReply",
		data: {
			reply_id: reply_id
		}, 
		success: function(result){
			$("#replyList").html(result);
		}
	});
}

function rereplyList(reply_id){
	// 답글 보여주기
//	$.ajax({
//		type: "POST",
//		url: "rereplyList",
//		data: {
//			reply_id: reply_id
//		}, 
//		success: function(result){
//			$("#rereplyList"+reply_id).html(result);
//			$("#rereplyList"+reply_id).toggle();
//		}
//	});
	$("#rereplyList"+reply_id).toggle();
}

function writeRereply(reply_id){
	// 답글 작성
	$.ajax({
		type: "POST",
		url: "writeRereply",
		data: {
			reply_id: reply_id,
			rereply_text: $("#rereply_text").val()
		}, 
		success: function(result){
			$("#rereplyList"+reply_id).html(result);
		}
	});
}
