<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		.backimg{
			background:url("resources/images/loginImg/login_1.jpg");
		}
		.container{
			position:relative; margin-top:150px; 
		}
		.contents{
			width:427px; margin:0 auto;
		}
		.header{
			display:table; width:126px; height:32px; border-color:#FFFFFF; border-radius: 16px 16px 16px 16px; 
			border-width:1px; border-style:solid; font-align:center; margin:0 auto;
		}
		.emailcontain{
			margin-top:70px; width:100%; height:30px; background-color:#FFFFFF; background-color: rgba( 255, 255, 255, 0.3 ); border-radius: 0px 0px 0px 0px;
		}
		.email{
		
		}
</style>
</head>
<body class = "backimg">
	<div class = "container">
		<div class = "contents">
			<div class = "header">
				<p style = "color:white; font-size:11pt; display:table-cell; text-align:center; vertical-align:middle;">비밀번호찾기</p>
			</div>
			<table class ="emailcontain">
				<tr>
					<td class = "email">
						<input type = "text" size = 99%>
					</td>
				<tr>
			</table>
		</div>
	</div>
</body>
</html>