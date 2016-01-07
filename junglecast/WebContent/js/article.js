$(function(){
	$(window).scroll(function(){
		if(matchMedia("only screen and (min-width:1280px)").matches){
	//		$("#articleInfo").css("margin-top","-60px");
			if($(window).scrollTop()>60){
				$("#articleInfo").css("margin-top","-60px");
			} else {
				$("#articleInfo").css("margin-top","0");
			}
		} else {
			$("#articleInfo").css("margin-top","0px");
		}
		// 스크롤 시 좌측 공유 영역 보이기/숨기기
		if($(window).scrollTop()>300){ // 225
			$("#verticalShare").css("display","block");
		} else {
			$("#verticalShare").css("display","none");
		}
	});
	
	$(".closebtn").click(function(){
		// 모달 닫을 때
		$("#articles_area").css("position","relative");
	});
	
	$(".likeBtn").click(function(){
		// 게시물 좋아요
		$.ajax({
			type: "POST",
			url: "likeArticle",
			data: {
				article_id: $("#article_id").val()
			},
			dataType: "text",
			success: function(jdata){
				$("#articleLikeNum").html(jdata);
				$(".articleLikeNumRight").html(jdata);
			}
		});		
	});
	
	$(".fbBtn").click(function(){
		// 페이스북 공유
		$.ajax({
			type: "POST",
			url: "shareArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		
	});
	
	$(".twBtn").click(function(){
		// 트위터 공유
		$.ajax({
			type: "POST",
			url: "shareArticle",
			data: {
				article_id: $("#article_id").val()
			}
		});		
	});
	
	$(".linkBtn").click(function(){
		// 링크 복사
		$("#copyLink").css('display','table');
		$("#main_body").css("overflow","hidden");
	});
	
	$("#linkCloseBtn").click(function(){
		// 링크 복사 모달 닫기
		$("#copyLink").css('display','none');
		$("#main_body").css("overflow","visible");
	});
	
	$("#writeReplyBtn").click(function(){
		// 댓글 작성
		if($("#reply_text").val().length > 160){
			alert("댓글은 160자를 초과할 수 없습니다.");
		} else {
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
		}
	});
	
	$(".topBtn").click(function(){
		// 스크롤 맨 위로 이동
		$("html, body").stop().animate({scrollTop:0}, '500', 'swing', function() { 
		});
	});
	
	$("#reply_text").keyup(function(){
		// 댓글 글자수 표시
		$("#currentCharNum").html($(this).val().length);
		if(parseInt($("#currentCharNum").html()) > 160){
			// 160자를 넘었을 경우 글자수 빨간색으로 표시
			$("#currentCharNum").css('color','#DE0027');
		} else {
			$("#currentCharNum").css('color','#00a6de');
		}
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

function rereplyList(reply_id,type){
	// 답글 보여주기
	$.ajax({
		type: "POST",
		url: "rereplyList",
		data: {
			reply_id: reply_id
		}, 
		success: function(result){
			if(type == 'best'){
				$("#rereplyList"+reply_id+"b").html(result);
				$("#rereplyList"+reply_id+"b").toggle();
			} else {
				$("#rereplyList"+reply_id).html(result);
				$("#rereplyList"+reply_id).toggle();
			}
		}
	});
}

function writeRereply(reply_id){
	// 답글 작성
	alert($("#rereply_text"+reply_id).val());
	$.ajax({
		type: "POST",
		url: "writeRereply",
		data: {
			reply_id: reply_id,
			rereply_text: $("#rereply_text"+reply_id).val()
		}, 
		success: function(result){
			$("#rereplyList"+reply_id).html(result);
			$("#rereplyList"+reply_id+"b").html(result);
		}
	});
}
