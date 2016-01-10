<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/leftMenu.js"></script>
<script src="js/main.js"></script>
<style type="text/css">
	.category_title{position:relative; width:99%; float:left; background:#fff; border-left:3px solid #11baf3; margin:8px 0 10px; overflow:hidden; height:30px; padding:5px;}
	.category_txt{font-size:18px; padding: 4px 4px 4px 13px; float:left; color:#605f5f; font-weight:bold;}
	.category_img{position:absolute; height:54px; width:54px; right:16px; background-size:100%;}
</style>
<script type="text/javascript">

function loadMore(){
	$.ajax({
		url: "selectThisCategory",
		data: {categoryId : $('#hidden_cate_id').val(), num:$('.aCard').length},
		dataType: 'JSON',
		type: 'POST',
		async:false,
		success: function (data) {
			$('#contents_cards_area').empty();
			var aCard='';
			$.each(data.result, function(index, entry){
				aCard += '<div class="aCard"><div class="aCard_img_div">';
				aCard += '<img class="aCard_img" src="resources/articleContents/'+ entry.pic_url +'"></div>';
				aCard += '<input type="hidden" value="'+ entry.article_id +'">';
				aCard += '<div class="aCard_txt">'+entry.article_title+'</div></div>';
			});
			$('#contents_cards_area').append(aCard);
		}
	})
}

</script>
</head>
<body id="main_body">
<div class="body_cover"></div>
<jsp:include page="./topLeft/header.jsp"></jsp:include>
<div id="modalBox"></div>
<div id="content_area">
<input type="hidden" value="${category_info.category_id }" id="hidden_cate_id">
	<jsp:include page="./topLeft/leftMenu.jsp"></jsp:include>
	<section id="articles_area">
		<div class="category_title">
			<span class="category_txt">${category_info.category_name }</span>
			<span class="category_img" style="background-image: url('resources/images/main/icons/${category_info.category_icon}');"></span>
		</div>
		<div id="contents_cards_area">
 			<c:forEach var="aRow" items="${contents }">
				<div class="aCard"> 
					<div class="aCard_img_div"><img class="aCard_img" src="resources/articleContents/${aRow.pic_url }"></div>
					<input type="hidden" value="${aRow.article_id }">
					<div class="aCard_txt">${aRow.article_title }</div>
				</div>
			</c:forEach>
		</div>
		<div id="scroll_up">▲<br>TOP</div>
	</section>
</div>
</body>
</html>