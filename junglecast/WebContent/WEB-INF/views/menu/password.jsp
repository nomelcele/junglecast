<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		::-webkit-input-placeholder {
   			color: white;
		}

		:-moz-placeholder { /* Firefox 18- */
   			color: white;  
		}

		::-moz-placeholder {  /* Firefox 19+ */
   			color: white; 
		}

		:-ms-input-placeholder {  
   			color: white;  
		}
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
			margin-top:75px; width:407px; height:36px; background-color:#FFFFFF; background-color: rgba( 255, 255, 255, 0.3 ); border-radius: 0px 0px 0px 0px;
			margin-left:10px; margin-right:10px;
		}
		.email{
			
		}
		.email input{
			font-size:9pt; border:none; width:93%; margin-left:14px; margin-top:10px; background-color: transparent; color:white; font-family:"돋움체"; placeholder-color:white;
		}
		.c_text{
			margin-left:10px; margin-top:8px; font-family:"돋움"
		}
		.button input{
			width:407px; height:48px; background-color:#00A1FF; color:#FFFFFF; font-size:14px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin-top:60px; margin-left:10px; font-family:"돋움체";
		}
		.cancel{
			margin-top:30px; text-align:center;
		}
		
		.cancel a {color:#FFFFFF; font-size:9pt; font-family:"돋움체";}
</style>
</head>
<body class = "backimg">
	<div class = "container">
		<div class = "contents">
			<div class = "header">
				<p style = "color:white; font-size:11pt; display:table-cell; text-align:center; vertical-align:middle;">비밀번호찾기</p>
			</div>
			<div class ="emailcontain">
				<form action = "" method="post">
					<div class = "email">				
						<input type = "text" name="id" placeholder = "이메일을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해주세요.'">
					</div>
				</form>
			</div>
			<div class = "c_text">
				<span style = "font-size:9pt; color:white;">가입한 이메일 주소를 입력해주세요. (임시비밀번호가 전송됩니다.)</span>
			</div>
			<div class = "button">
				<input type = "submit" value = "비밀번호 찾기">
			</div>
			<div class = "cancel">
				<a href = "/junglecast/menu=login" target = "_self">취소</a>
			</div>
		</div>
	</div>
</body>
</html>