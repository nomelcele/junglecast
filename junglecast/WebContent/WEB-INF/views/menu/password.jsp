<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		$(function(){
			
			$('.findpwbtn').on('click',function(){
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				var email = $('.emailtext').val();
				if(email==""){
					jQuery('.darkwindow').show();
					jQuery('.error').show();
					jQuery('.e_text p').hide();
					jQuery('.msg3').show();
				}
				else if(!regex.test(email)){
					jQuery('.darkwindow').show();
					jQuery('.error').show();
					jQuery('.e_text p').hide();
					jQuery('.msg1').show();
				}
				else{
					$.ajax({
						url : "DoubleInfo",
						type : "Post",
						data : {m_mail: email},
						cache : false,
						async : false,
						dataType : "JSON",
						success : function(response) {								
							if(response.m_id=='0')
							{
								jQuery('.darkwindow').show();
								jQuery('.error2').show();
								
							}
							else
							{
								$.ajax({
									url : "sendEmailAction",
									type : "Post",
									data : {m_mail: email},
									cache : false,
									async : false,
									dataType : "JSON",
									success : function(data) {								
										jQuery('.darkwindow').show();
										jQuery('.error3').show();
									}
								});
							}
						}
					});
				} 	
			});
			$('.cancel_1').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error').hide();				
			});
			$('.correct').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error').hide();
			});
			$('.cancel_2').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error2').hide();				
			});
			$('.correct2').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error2').hide();
			});
			$('.cancel_3').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error3').hide();				
			});
			$('.correct3').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error3').hide();
			});
		});


	</script>
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
		
				.darkwindow{
			display:none; position: fixed; z-index: 100; left: 0px; top: 0px;width: 100%;height: 100%;background-color: rgba( 0, 0, 0, 0.5 ); height:100%; margin-bottom:0px;
		}
		.error{
			display:none;top:50%; left:50%; margin-top:-71px; margin-left:-150px; position:absolute; z-index:1001; border-radius:10px; background-color:#FFFFFF; padding-top:22px; margin-right:10px; width:300px;
			font-family:'돋움'; font-size:12px; color:#58595B;
		}
		.cancel_1{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#CFCFCF; border-bottom-left-radius:10px; text-align:center; font-weight: bold; color: #58595B; cursor:pointer; font-family: '돋움'
		}
		.correct{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#00A6DE; border-bottom-right-radius:10px; text-align:center; font-weight: bold; color: #FFFFFF; cursor:pointer; font-family: '돋움'
		}
		.error2{
			display:none;top:50%; left:50%; margin-top:-61px; margin-left:-181px; position:absolute; z-index:1001; border-radius:10px; background-color:#FFFFFF; padding-top:22px; margin-right:10px; width:300px;
			font-family:'돋움'; font-size:12px; color:#58595B; min-width:362px;
		}
		.cancel_2{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#CFCFCF; border-bottom-left-radius:10px; text-align:center; font-weight: bold; color: #58595B; cursor:pointer; font-family: '돋움'
		}
		.correct2{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#00A6DE; border-bottom-right-radius:10px; text-align:center; font-weight: bold; color: #FFFFFF; cursor:pointer; font-family: '돋움'
		}
		.error3{
			display:none;top:50%; left:50%; margin-top:-71px; margin-left:-187px; position:absolute; z-index:1001; border-radius:10px; background-color:#FFFFFF; padding-top:22px; margin-right:10px; width:300px;
			font-family:'돋움'; font-size:12px; color:#58595B; min-width:375px;
		}
		.cancel_3{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#CFCFCF; border-bottom-left-radius:10px; text-align:center; font-weight: bold; color: #58595B; cursor:pointer; font-family: '돋움'
		}
		.correct3{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#00A6DE; border-bottom-right-radius:10px; text-align:center; font-weight: bold; color: #FFFFFF; cursor:pointer; font-family: '돋움'
		}
</style>
</head>
<body>
<script type="text/javascript">
 var bgImg = ['resources/images/loginImg/login_1.jpg','resources/images/loginImg/login_2.jpg','resources/images/loginImg/login_3.jpg',
              'resources/images/loginImg/login_4.jpg','resources/images/loginImg/login_5.jpg','resources/images/loginImg/login_6.jpg']
  var ran = Math.floor(bgImg.length*Math.random())
 document.body.style.backgroundImage = 'url('+bgImg[ran]+')';
</script>
	<div class = "container">
		<div class = "contents">
			<div class = "header">
				<p style = "color:white; font-size:11pt; display:table-cell; text-align:center; vertical-align:middle;">비밀번호찾기</p>
			</div>
			<div class ="emailcontain">
				<form action = "" method="post">
					<div class = "email">				
						<input type = "text" name="id" class="emailtext" placeholder = "이메일을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해주세요.'">
					</div>
				</form>
			</div>
			<div class = "c_text">
				<span style = "font-size:9pt; color:white;">가입한 이메일 주소를 입력해주세요. (임시비밀번호가 전송됩니다.)</span>
			</div>
			<div class = "button">
				<input type = "submit" value = "비밀번호 찾기" class="findpwbtn">
			</div>
			<div class = "cancel">
				<a href = "/junglecast/menu=login" target = "_self">취소</a>
			</div>
		</div>
	</div>
	<div class="darkwindow"></div>
	<div class="error">
		<div class="e_text" style="background:#FFFFFF; margin:0px; font-family:'돋움'; font-size:12px;">
			<p class = "msg1" style="padding-top:15px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">올바른 이메일 형식이 아닙니다.</p>
			<p class = "msg2" style="padding-top:15px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">입력하신 이메일로 가입된 사용자가 없습니다.</p>
			<p class = "msg3" style="padding-top:15px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">이메일은 필수 입력 항목입니다.</p>
		</div>
		<div class="buttons" style="text-align: left; background: #00a6de; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
			<input type = "submit" value="취소" class="cancel_1">
			<input type = "submit" value="확인" class="correct">
		</div>
	</div>
	<div class="error2">
		<div class="e_text2" style="background:#FFFFFF; padding:0px; margin:0px; font-family:'돋움'; font-size:12px;">
			<p class = "msg2" style="padding-top:15px; padding-right:45px; padding-left:45px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">입력하신 이메일로 가입된 사용자가 없습니다.</p>
		</div>
		<div class="buttons2" style="text-align: left; background: #00a6de; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
			<input type = "submit" value="취소" class="cancel_2">
			<input type = "submit" value="확인" class="correct2">
		</div>
	</div>
	<div class="error3">
		<div class="e_text3" style="background:#FFFFFF; padding:0px; margin:0px; font-family:'돋움'; font-size:12px;">
			<p class = "msg4" style="padding-top:15px; padding-right:45px; padding-left:45px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">임시 비밀번호가 위 메일주소로 발송되었습니다.<br>확인해주세요.</p>
		</div>
		<div class="buttons3" style="text-align: left; background: #00a6de; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
			<input type = "submit" value="취소" class="cancel_3">
			<input type = "submit" value="확인" class="correct3">
		</div>
	</div>
</body>
</html>