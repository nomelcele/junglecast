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
			
			$('.emailbutton_1').on('click',function(){
				jQuery('.container').hide();
				jQuery('.layer_2').show();
			});
			$('.button_1').on('click',function(){
				
				jQuery('.layer_2').hide();
				jQuery('.container').show();
				
			});
			$('.button_2').on('click',function(){
				if(($('.checkImg').attr('src')=='resources/images/joinImg/choice_2.png')&&($('.checkImg_2').attr('src')=='resources/images/joinImg/choice_2.png')){
				jQuery('.contents_2').hide();
				jQuery('.contents_3').show();
				$('html,body').scrollTop(0);
				}
				else{
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					if($('.checkImg').attr('src')=='resources/images/joinImg/choice_1.png'){
						jQuery('.c2_alert_1').show();						
					}
					else{
						jQuery('.c2_alert_2').show();		
					}
				}
			});
			$('.c2_alert_1_line2').on('click',function(){
				jQuery('.c2_alert_1').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
			});
			$('.c2_alert_2_line2').on('click',function(){
				jQuery('.c2_alert_2').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
			});
			
			
			$('.c3_button_1').on('click',function(){
				jQuery('.contents_3').hide();
				jQuery('.contents_2').show();
				$('html,body').scrollTop(0);
			});
			$('.c3_button_2').on('click',function(){
				var email = $('.id input').val()+'@'+$('.adress input').val();
	    		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		    	dt=new Date();
		    	var d_num = Number($('.day select option:selected').val());
		    	var m_num = Number($('.month select option:selected').val());
		    	var y_num = Number($('.year input').val());
		    	var year = Number(dt.getFullYear());
		    	var month = Number(dt.getMonth());
		    	var day=Number(dt.getDate());
				if($('.id input').val()==""||$('.adress input').val()==""){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1').show();
				}
				else if($('.password input').val()==""){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_1').show();
				}
				else if($('.passwordcorrect input').val()==""){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_2').show();
				}
				else if($('.year input').val()==""){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_3').show();
				}
				else if($('.month select option:selected').val()=="0"){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_4').show();
				}
				else if($('.day select option:selected').val()=="0"){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_5').show();
				}
				else if($(":input:radio[name=m_gender]:checked").val()!="male"&&$(":input:radio[name=m_gender]:checked").val()!="female"){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_6').show();
				}
				else if(!regex.test(email)){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_2').show();
					jQuery('.c3_alert_2-1 p').hide();
					jQuery('.c3_alert_2_line1').show();
				}
				else if($('.password input').val()!=$('.passwordcorrect input').val()){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_2').show();
					jQuery('.c3_alert_2-1 p').hide();
					jQuery('.c3_alert_2_line1_1').show();
				}
				else if(y_num>year||y_num<1900||((y_num==year)&&(m_num>month))||(y_num==year&&m_num==month&&d_num>date)){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c3_alert_1').show();
					jQuery('.c3_alert_1-1 p').hide();
					jQuery('.c3_alert_1_line1_7').show();
				}
				else{
					jQuery('.contents_3').hide();
					jQuery('.contents_4').show();
					$('html,body').scrollTop(0);
				}
			});
			$('.c3_alert_1_line2').on('click',function(){
				jQuery('.c3_alert_1').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
				
			});
			$('.c3_alert_2_line2').on('click',function(){
				jQuery('.c3_alert_2').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
				
			});
			
			
			$('.c4_button_1').on('click',function(){
				jQuery('.contents_4').hide();
				jQuery('.contents_3').show();
				$('html,body').scrollTop(0);
				$('.password input').val("");
				$('.passwordcorrect input').val("");
	    		$('.password').css("border-bottom", "2px solid #E9E9E9");
	    		$('.password img').attr('src','resources/images/joinImg/choice_1.png');
	    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
	    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
			});
			$('.c4_button_2').on('click',function(){
				if($('.nickname input').val()==""){
					$('.layer_2').css("overflow","hidden");
					jQuery('.darkwindow').show();
					jQuery('.c4_alert_1').show();
				}
				else{
					var mail = $('.id input').val()+'@'+$('.adress input').val();
					var birth = $('.year input').val()+'-'+$('.month select option:selected').val()+'-'+$('.day select option:selected').val();
					var pw = $('.passwordcorrect input').val()
					$('#m_mail').attr('value',mail);
					$('#m_birth').attr('value',birth);
					$('#m_pw').attr('value',pw);
					//$('.id').val('asdf');
					//$('.year').val(year+'-'+month+'-'+day);
					//$("form[name ='sendForm']").submit();
					$("form[name ='sendProfile']").submit();
					jQuery('.contents_4').hide();
					jQuery('.contents_5').show();
					$('html,body').scrollTop(0);
				}
			});
			$('.c4_alert_1_line2').on('click',function(){
				jQuery('.c4_alert_1').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
				jQuery('.nickname_warning1').show();
				
			});
			$('.c4_alert_2_line2').on('click',function(){
				jQuery('.c4_alert_2').hide();
				jQuery('.darkwindow').hide();
				jQuery('.layer_2').show();
				
			});
			
			$('.checkImg').on('click',function(){
				if($('.checkImg').attr('src')=='resources/images/joinImg/choice_1.png'){
					$('.checkImg').attr('src','resources/images/joinImg/choice_1.png');
					$(this).attr('src','resources/images/joinImg/choice_2.png');
				}
				else{
					$('.checkImg').attr('src','resources/images/joinImg/choice_2.png');
					$(this).attr('src','resources/images/joinImg/choice_1.png');
				}
			});
			$('.checkImg_2').on('click',function(){
				if($('.checkImg_2').attr('src')=='resources/images/joinImg/choice_1.png'){
					$('.checkImg_2').attr('src','resources/images/joinImg/choice_1.png');
					$(this).attr('src','resources/images/joinImg/choice_2.png');
				}
				else{
					$('.checkImg_2').attr('src','resources/images/joinImg/choice_2.png');
					$(this).attr('src','resources/images/joinImg/choice_1.png');
				}
			});
			$('.button_1').hover(
				function(){
					$(this).css("backgroundColor","#7B7B7B"); 
				},
				function(){
					$(this).css("backgroundColor","#A5A5A5"); 
				}
			);
			$('.button_2').hover(
				function(){
					$(this).css("backgroundColor","#0090C0");
				},
				function(){
					$(this).css("backgroundColor","#00A1FF");
				}
			);
			$('.c3_button_1').hover(
					function(){
						$(this).css("backgroundColor","#7B7B7B"); 
					},
					function(){
						$(this).css("backgroundColor","#A5A5A5"); 
					}
				);
			$('.c3_button_2').hover(
					function(){
						$(this).css("backgroundColor","#0090C0");
					},
					function(){
						$(this).css("backgroundColor","#00A1FF");
					}
				);
			$('.input_year').keypress(function (event) {
		        if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
		            event.preventDefault();
		        }
		    });
			$('.nickname input').keyup(function (e){
		          var content = $(this).val();
		          $('.inputCnt').html(content.length + '/14');
		      });
		      $('.nickname input').keyup();
		      
			$('.myintro input').keyup(function (e){
			      var content = $(this).val();
		          $('.intro_inputCnt').html(content.length + '/17');
		      });
		      $('.myintro input').keyup();
		      
		    $('.id input').focusin(function(){
		    	$(this).css("color","#828180");
		    	$('.id').css("border-bottom", "2px solid #C8C8C8");
		    });
		    $('.id input').focusout(function(){
		    	$(this).css("color","#C8C8C8");
		    	
		    	if($('.adress input').val()!=""){
		    		var email = $(this).val()+'@'+$('.adress input').val();
		    		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  
		    		if(regex.test(email)){
		    			$('.id_warning2').hide();
		    			$('.id').css("border-bottom", "2px solid #E9E9E9");
		    		}
		    		else{
		    			$('.id').css("border-bottom", "2px solid red");
		    			$('.id_warning2').show();
		    		}
		    	}
		    	else{
		    		$('.id_warning2').hide();
	    			$('.id').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    });
		    $('.adress input').focusin(function(){
		    	$(this).css("color","#828180");
		    	$('.adress').css("border-bottom", "2px solid #C8C8C8");
		    });
		    $('.adress input').focusout(function(){
		    	$(this).css("color","#C8C8C8");
		    	if($('.id input').val()!=""){
		    		var email = $('.id input').val()+'@'+$(this).val();
		    		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  
		    		if(regex.test(email)){
		    			$('.id_warning2').hide();
		    			$('.id').css("border-bottom", "2px solid #E9E9E9");
		    			$('.adress').css("border-bottom", "2px solid #E9E9E9");
		    		}
		    		else{
		    			$('.id').css("border-bottom", "2px solid red");
		    			$('.adress').css("border-bottom", "2px solid #E9E9E9");
		    			$('.id_warning2').show();
		    		}
		    	}
		    	else{
		    		$('.id_warning2').hide();
		    		$('.id').css("border-bottom", "2px solid #E9E9E9");
	    			$('.adress').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    });
		    $('.password input').focusin(function(){
		    	$(this).css("color","#828180");
		    	if($('.password img').attr('src')=='resources/images/joinImg/choice_1.png'){
		    		$('.password').css("border-bottom", "2px solid #C8C8C8");
		    	}
		    	else if($('.password img').attr('src')=='resources/images/joinImg/choice_2.png'){
		    		$('.password').css("border-bottom", "2px solid #00A6DE");
		    	}
		    	else{
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    	}
		    });
		    $('.password input').focusout(function(){
		    	$(this).css("color","#58595B");
		    	if(this.value.length>=4){
		    		$('.password').css("border-bottom", "2px solid #00A6DE");
		    		$('.password img').attr('src','resources/images/joinImg/choice_2.png');
		    		if($('.passwordcorrect input').val()==this.value){
		    			$('.passwordcorrect').css("border-bottom", "2px solid #00A6DE");
			    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_2.png');
		    		}
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    	}
		    	else if(this.value.length>=1){
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').show();
		    	}
		    	else if(this.value.length<1&&$('.passwordcorrect input').val().length<1){
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		$('.password').css("border-bottom", "2px solid #E9E9E9");
		    		$('.password img').attr('src','resources/images/joinImg/choice_1.png');
		    	}
		    	else{
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		$('.password').css("border-bottom", "2px solid #E9E9E9");
		    		$('.password img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.passwordcorrect').css("border-bottom", "2px solid #C8C8C8");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.passwordcorrect input').val("");
		    	}
		    	
		    });
		    
		    $('.passwordcorrect input').focusin(function(){
		    	$(this).css("color","#828180");
		    	if($('.passwordcorrect img').attr('src')=='resources/images/joinImg/choice_1.png'){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #C8C8C8");
		    	}
		    	else if($('.passwordcorrect img').attr('src')=='resources/images/joinImg/choice_2.png'){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #00A6DE");
		    	}
		    	else{
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/passwordwarn.png');
		    	}
		    });
		    $('.passwordcorrect input').focusout(function(){
		    	$(this).css("color","#58595B");
		    	if(this.value==$('.password input').val()&&this.value.length>=4){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #00A6DE");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_2.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    	}
		    	else if(this.value==$('.password input').val()&&this.value.length<4&&this.value.length>0){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		jQuery('.pw_warning3').show();
		    		$(this).val("");
		    		$('.password input').focus();		
		    	}
		    	else if(this.value!=$('.password input').val()&&this.value.length>=4&&$('.password input').val().length>=4){
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		$('.passwordcorrect').css("border-bottom", "2px solid red");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning2').show();
		    	}
		    	else if(this.value!=$('.password input').val()&&this.value.length>=4&&$('.password input').val().length<4){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		jQuery('.pw_warning3').show();
		    		$(this).val("");
		    		$('.password input').focus();		    		
		    	}
		    	else if(this.value!=$('.password input').val()&&this.value.length<4&&$('.password input').val().length>=4&&this.value.length>0){
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		$('.passwordcorrect').css("border-bottom", "2px solid red");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning2').show();
		    	}
		    	else if(this.value!=$('.password input').val()&&this.value.length<4&&$('.password input').val().length<4&&this.value.length>0&&$('.password input').val().length>0){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		jQuery('.pw_warning3').show();
		    		$(this).val("");
		    		$('.password input').focus();	
		    	}
		    	else if($('.password input').val()==""&&$(this).val().length>0){
		    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		jQuery('.pw_warning3').show();
		    		$(this).val("");
		    		$('.password input').focus();	
		    	}
		    	else{
		    		$('.passwordcorrect').css("border-bottom", "2px solid #E9E9E9");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    	} 
		    	/* else if(this.value!=$('.password input').val()&&this.value.length>0){
		    		$('.passwordcorrect').css("border-bottom", "2px solid red");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning2').show();
		    	}
 		    	else if($('.password input').val().length<4){
 		    		$('.passwordcorrect').css("border-bottom", "2px solid #C8C8C8");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    		$('.password').css("border-bottom", "2px solid red");
		    		$('.password img').attr('src','resources/images/joinImg/passwordwarn.png');
		    		jQuery('.pw_warning1').hide();
		    		jQuery('.pw_warning2').hide();
		    		jQuery('.pw_warning3').hide();
		    		jQuery('.pw_warning3').show();
		    		$(this).val("");
		    		$('.password input').focus();
		    	} 
		    	else{
		    		$('.passwordcorrect').css("border-bottom", "2px solid #C8C8C8");
		    		$('.passwordcorrect img').attr('src','resources/images/joinImg/choice_1.png');
		    	} */
		    });
		    showbirthtext = function (){
		    	if($('.birth_text').css("display")=='none'){
		    		$('.birth_text').css("display", "block");
		    	}
		    	else{
		    		$('.birth_text').css("display", "none");
		    	}
	        }
		    $('.year input').focusin(function(){
		    	$(this).css("color","#828180");
		    	$('.year').css("border-bottom", "2px solid #C8C8C8");
		    });
		    $('.year input').focusout(function(){
		    	dt=new Date();
		    	if($(this).val()==""){
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    	else{
		    	var year = Number(dt.getFullYear());
		    	var y_num = Number($(this).val());
		    	$(this).css("color","#58595B");
		    	if((y_num<1900||y_num>year)){
		    		$('.year').css("border-bottom", "2px solid red");
		    		jQuery('.year_warning1').show();
		    	}
		    	else{
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    	}
		    });
		    $('.month select').focusout(function(){
		    	dt=new Date();
		    	if($('.year input').val()==""){
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    	else{
		    	var m_num = Number($('.month select option:selected').val());
		    	var y_num = Number($('.year input').val());
		    	var year = Number(dt.getFullYear());
		    	var month = Number(dt.getMonth());
		    	var day=Number(dt.getDate());
 		    	if(y_num>year||y_num<1900||((y_num==year)&&(m_num>month))){
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid red");
		    		jQuery('.year_warning1').show();
		    	}
		    	else{
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}	
		    	}
		    });
		    $('.day select').focusout(function(){
		    	dt=new Date();
		    	if($('.year input').val()==""){
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    	else{
		    	var d_num = Number($('.day select option:selected').val());
		    	var m_num = Number($('.month select option:selected').val());
		    	var y_num = Number($('.year input').val());
		    	var year = Number(dt.getFullYear());
		    	var month = Number(dt.getMonth());
		    	var day=Number(dt.getDate());
		    	if(y_num>year||y_num<1900||((y_num==year)&&(m_num>month))||(y_num==year&&m_num==month&&d_num>date)){
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid red");
		    		jQuery('.year_warning1').show();
		    	}
		    	else{
		    		jQuery('.year_warning1').hide();
		    		$('.year').css("border-bottom", "2px solid #E9E9E9");
		    	}
		    	}
		    });
		    $('.nickname input').focusin(function(){
		    	$(this).css("color","#828180");
		    	$('.nickname').css("border-bottom", "2px solid #C8C8C8");
		    });
		    $('.nickname input').focusout(function(){
		    	$(this).css("color","#C8C8C8");
		    	
		    });
		    $('.myintro input').focusin(function(){
		    	$(this).css("color","#828180");
		    	$('.myintro').css("border-bottom", "2px solid #C8C8C8");
		    });
		    $('.myintro input').focusout(function(){
		    	$(this).css("color","#C8C8C8");
		    	$('.myintro').css("border-bottom", "2px solid #E9E9E9");
		    	
		    });
		    


		});



		</script>
		
<style>	
		/*가입 1--------------------------------------------------------------------------------------------------------------------*/
		.container{
			position:relative; margin-top:148px; 
		}
		.header{
			width:230px; height:78px; margin:0 auto; padding-bottom:70px;
		}
		.c_header{
			float:left
		}
		.contents{
			height:392px;
		}
		.mid_contents{
			position:relative;width:427px;height:392px;background-color:#FFFFFF;
			background-color: rgba( 255, 255, 255, 0.7 ); border-radius: 7px 7px 7px 7px;  margin:0 auto;
		}
		.c_contents{
			width:337px; margin:0 auto; 
		}
		.c_text{
			width:337px; padding-top:56px;  padding-bottom:38px; text-align:center;
		}
		.emailbutton{
			padding-bottom:10px;
		}
		.emailbutton_1 {
			width:337px; height:48px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.fbbutton{
			padding-bottom:10px;
		}
		.fbbutton input{
			width:337px; height:48px; background-color:#556D9C; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.kakaobutton{
			padding-bottom:36px; border-bottom:1px solid #C4C5C4;
		}
		.kakaobutton input{
			width:337px; height:48px; background-color:#B2AE40; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.last_text{
			text-align:center; padding-top:24px;
		}
		/*가입 2--------------------------------------------------------------------------------------------------------------------*/
		.layer_2{
			display:none; 
		}
		.container_2{
			position:relative; margin-top:97px; padding-bottom:65px; border-bottom:3px solid #00A6DE;
		}
		.header_2{
			width:230px; height:78px; margin:0 auto; 
		}
		.c_header_2{
			float:left
		}
		
		/*가입 2-1 세부--------------------------------------------------------------------------------------------------------------------*/
		.contents_2{
			position:relative;background-color:#FFFFFF;background-color: rgba( 255, 255, 255, 0.9 ); height:1000px; margin-bottom:0px;
		}
		.midcontents_2{
			width:660px; margin:0 auto; padding-top:65px;
		}
		.c_contents_2{
		
		}
		.c_midcontents_2{
			position:relative; background-color:#FFFFFF;  width:100%; height:550px; margin:0 auto;
		}
		.c2_midcontents_1{
			width:88%;  margin:0 auto; padding-top:10px;
		}
		.c2_midcontents_1 h3{
			font-size:20px; font-family:"돋움"; font-style:normal; font-weight:normal; margin-bottom:10px;
		}
		.textbox_1{
			width:100%; height:175px; background-color:#F0F0F0; border:0; overflow-y:scroll; font-size: 14px;
			
		}
		.text_cont_1{
			margin-left:20px; margin-right:20px;
		}
		.text_cont_1 h3{
			font-weight:normal; font-size:14px;
		}
		.c2_midcontents_2{
			width:88%;  margin:0 auto; padding-top:10px;
		}
		.c2_midcontents_2 h3{
			font-size:20px; font-family:"돋움"; font-style:normal; font-weight:normal; margin-bottom:10px;
		}
		.textbox_2{
			width:100%; height:175px; background-color:#F0F0F0; border:0; overflow-y:scroll; font-size: 14px; 
			
		}
		.text_cont_2{
			margin-left:20px; margin-right:20px; margin-top:10px;
		}
		.text_cont_2 h3{
			font-weight:normal; font-size:14px;
		}
		.buttons{
			position:relative; width:100%; margin-top:10px;
		}
		
		.button_1{
			width:140px; height:45px; background-color:#A5A5A5; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:left;
		}
			
		.button_2{
			width:140px; height:45px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:right;
		}
		.darkwindow{
			display:none; position: fixed; z-index: 100; left: 0px; top: 0px;width: 100%;height: 100%;background-color: rgba( 0, 0, 0, 0.6 ); height:100%; margin-bottom:0px;
		}
		.c2_alert_1{
			display:none; top: 50%; left: 50%; margin-top: -71px; margin-left: -150px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c2_alert_1-1{
			background: #FFFFFF;
		}
		.c2_alert_1_line1{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px;
		}
		.c2_alert_1_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		.c2_alert_2{
			display:none; top: 50%; left: 50%; margin-top: -71px; margin-left: -150px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c2_alert_2-1{
			background: #FFFFFF;
		}
		.c2_alert_2_line1{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px;
		}
		.c2_alert_2_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		/*가입 2-2세부--------------------------------------------------------------------------------------------------------------------*/
		.contents_3{
			 display:none;  position:relative;background-color:#FFFFFF;background-color: rgba( 255, 255, 255, 0.9 ); height:960px; margin-bottom:0px;
		}
		.midcontents_3{
			width:660px; margin:0 auto; padding-top:65px;
		}
		.c_contents_3{
		
		}
		.c_midcontents_3{
			position:relative; background-color:#FFFFFF;  width:100%; height:505px; margin:0 auto;
		}
		.c3_midcontents{
			width:90%; margin:0 auto; padding-top:10px;
		}
		.c3_line_1{
			margin:0; padding:0; border:0;
		}
		.id{
			display:inline-block;width:40%; padding-top:4px; padding-bottom:4px; border-bottom: 2px solid #E9E9E9; 
		}
		.id input{
			width:100%; border:none;  font-size:14px; color:#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle;
		}
		.adress{
			display:inline-block;width:40%; padding-top:4px; padding-bottom:4px; border-bottom: 2px solid #E9E9E9; 
		}
		.adress input{
			width:100%; border:none;  font-size:14px; color:#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle;
		}
		.doublebutton{
			width:75px; height:31px; background-color:#C9C9C9; color:#FFFFFF; font-size:14px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px;
		}
		.c3_warning{
			diplay:block; height:12px; margin-top:10px; font-size:12px; color:red; font-family:'돋움';
		}
		.password{
			display:inline-block; width:100%; padding-top:7px; padding-bottom:7px; border-bottom: 2px solid #E9E9E9; 
		}
		.password input{
			width:53%; border:none;  font-size:14px; color:#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle; float:right;
		}
		.passwordcorrect{
			display:inline-block; width:100%; margin-top:3px;padding-top:7px; padding-bottom:7px; border-bottom: 2px solid #E9E9E9; 
		}
		.passwordcorrect input{
			width:53%; border:none;  font-size:14px; color:#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle;
		}
		.c3_pw_warning{
			diplay:block; height:12px;margin-top:10px; font-size:12px; color:red; font-family:'돋움';
		}
		.year{
			display:inline-block; width:25%; padding-top:4px; padding-bottom:4px; border-bottom: 2px solid #E9E9E9; 
		}
		.year input{
			width:87%; border:none;  font-size:14px; color:#828180; background-color: transparent; font-family:'돋움'; vertical-align:middle; text-align:right;
		}
		.month{
			display:inline-block; width:23%; padding-top:5px; padding-bottom:5px; border-bottom: 2px solid #E9E9E9; margin-left:10px;
		}
		.month select{
			width:100%; border:none;  font-size:12px; background-color: transparent; font-family:'돋움체'; vertical-align:middle; text-align:right;
		}
		.day{
			display:inline-block; width:23%; padding-top:5px; padding-bottom:5px; border-bottom: 2px solid #E9E9E9; margin-left:10px;
		}
		.day select{
			width:100%; border:none;  font-size:12px; background-color: transparent; font-family:'돋움체'; vertical-align:middle; text-align:right;
		}
		.c3_year_warning{
			display:block; height:12px; margin-top:10px; font-size:12px; color:red; font-family:'돋움';
		}
		.c3_buttons{
			position:relative; width:100%; margin-top:10px;
		}
		
		.c3_button_1{
			width:140px; height:45px; background-color:#A5A5A5; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:left;
		}
			
		.c3_button_2{
			width:140px; height:45px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:right;
		}
		input[type=radio] {
    		display:none; 
    		margin:10px;
		}
		input[type=radio] + label {
    		display:inline-block;
    		background-color: #F2F2F2;
    		border-color: #ddd;
    		color:#B1B1B1;
    		width:130px;
    		padding-top:10px;
    		padding-bottom:10px;
    		text-align:center;
    		vertical-align:middle;
    		cursor:pointer;
    		line-height: 20px;
    		font-size:14px;
    		font-family:'돋움';
		}

		input[type=radio]:checked + label { 
   			background-image: none;
    		background-color:#00A1FF;
    		color:white;
		}
		.c3_alert_1{
			display:none; top: 50%; left: 50%; margin-top: -61px; margin-left: -152px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c3_alert_1-1{
			background: #FFFFFF;
		}
		.c3_alert_1-1 p{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px; font-family: '돋움'; font-size: 12px;
		}
/* 		.c3_alert_1_line1{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px;
		} */
		.c3_alert_1_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		.c3_alert_2{
			display:none; top: 50%; left: 50%; margin-top: -71px; margin-left: -150px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c3_alert_2-1{
			background: #FFFFFF;
		}
		.c3_alert_2-1 p{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px; font-family: '돋움'; font-size: 12px;
		}
/* 		.c3_alert_2_line1{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px; font-family: '돋움'; font-size: 12px;
		} */
		.c3_alert_2_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		/*가입 2-3세부--------------------------------------------------------------------------------------------------------------------*/
		.contents_4{
			 display:none;  position:relative;background-color:#FFFFFF;background-color: rgba( 255, 255, 255, 0.9 ); height:1010px; margin-bottom:0px;
		}
		.midcontents_4{
			width:660px; margin:0 auto; padding-top:65px;
		}
		.c_midcontents_4{
			position:relative; background-color:#FFFFFF;  width:100%; height:550px; margin:0 auto;
		}
		.c4_midcontents{
			width:90%; margin:0 auto;
		}
		.c4_midtop{
			height:120px; padding-top:94px; padding-bottom:55px;
		}
		.defaultImg{
			display:block; width:110px; height:110px; border-radius:60px; margin:0 auto;
		}
		.nickname{
			display:inline-block;width:80%; padding-top:4px; padding-bottom:4px; border-bottom:2px solid #E9E9E9; 
		}
		.nickname input{
			width:90%; border:none;  font-size:14px; color::#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle;
		}
		.inputCnt{
		 font-size:14px; color:#828180; font-family:'돋움'; vertical-align:middle; float:right;
		}
		.n_doublebutton{
			width:75px; height:31px; background-color:#C9C9C9; color:#FFFFFF; font-size:14px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px;
		}
		.c4_nickname_warning{
			display:block; height:12px; margin-top:10px; font-size:12px; color:red; font-family:'돋움';
		}
		.myintro{
			display:inline-block;width:80%; padding-top:4px; padding-bottom:4px; border-bottom: 2px solid #E9E9E9; 
		}
		.myintro input{
			width:90%; border:none;  font-size:14px; color:#C8C8C8; background-color: transparent; font-family:'돋움'; vertical-align:middle;
		}
		.intro_inputCnt{
		 font-size:14px; color:#828180; font-family:'돋움'; vertical-align:middle; float:right;
		}
		.c4_buttons{
			position:relative; width:100%; margin-top:10px;
		}
		.c4_button_1{
			width:140px; height:45px; background-color:#A5A5A5; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:left;
		}	
		.c4_button_2{
			width:140px; height:45px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; float:right;
		}
		.c4_alert_1{
			display:none; top: 50%; left: 50%; margin-top: -61px; margin-left: -152px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c4_alert_1-1{
			background: #FFFFFF;
		}
		.c4_alert_1-1 p{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px; font-family: '돋움'; font-size: 12px;
		}
		.c4_alert_1_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		.c4_alert_2{
			display:none; top: 50%; left: 50%; margin-top: -71px; margin-left: -150px; position: fixed; z-index: 1001;min-width: 300px; border-radius: 10px;
    		background: #FFFFFF; padding: 22px 0 0 0; 
		}
		.c4_alert_2-1{
			background: #FFFFFF;
		}
		.c4_alert_2-1 p{
			padding: 15px 45px 30px; font-weight: bold; text-align: center; line-height: 20px; font-family: '돋움'; font-size: 12px;
		}
		.c3_alert_2_line2{
			display: block;font-size: 14px; background-color: #00A1FF; color: #FFFFFF; padding: 10px 0; font-weight: bold; text-align: center; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; text-decoration: none;
			width:100%; height:45px; border:none; cursor:pointer;
		}
		/*가입 2-4세부--------------------------------------------------------------------------------------------------------------------*/
		.contents_5{
			 display:none;  position:relative;background-color:#FFFFFF;background-color: rgba( 255, 255, 255, 0.9 ); height:728px; margin-bottom:0px;
		}
		.midcontents_5{
			width:660px; margin:0 auto; padding-top:65px;
		}
		.c_midcontents_5{
			position:relative; background-color:#FFFFFF;  width:100%; height:450px; margin:0 auto;
		}
		.c5_midcontents{
			width:90%; margin:0 auto;
		}
		
</style>
</head>
<body style="margin:0 0 0 0;" >
<script type="text/javascript">
 var bgImg = ['resources/images/loginImg/login_1.jpg','resources/images/loginImg/login_2.jpg','resources/images/loginImg/login_3.jpg',
              'resources/images/loginImg/login_4.jpg','resources/images/loginImg/login_5.jpg','resources/images/loginImg/login_6.jpg']
  var ran = Math.floor(bgImg.length*Math.random())
 document.body.style.backgroundImage = 'url('+bgImg[ran]+')';
 document.body.style.backgroundAttachment="fixed";
</script>
<!------------------------------- 가입 1 ---------------------------------------------->
<div class="container">
	<div class = "header">
		<div class = "c_header">
			<a href = "/junglecast" target = "_self">
				<img src="resources/images/loginImg/pikicast_logo.png" width = 212px height = 78px>
			</a>
		</div>
	</div>
	<div class = "contents">
		<div class = "mid_contents">
			<div class = "c_contents">
				<div class = "c_text">
					<span><font style = "font-size: 18px; font-weight: bold; color: #707070; font-family: '돋움';">원하시는 가입 유형을 선택해주세요.</font></span>
				</div>
				<div class = "emailbutton">
					<input type = "submit" value = "이메일 계정 만들기" class="emailbutton_1">
				</div>
				<div class = "fbbutton">
					<input type = "submit" value = "페이스북 계정 만들기">
				</div>
				<div class = "kakaobutton">
					<input type = "submit" value = "카카오톡 계정 만들기">
				</div>
				<div class = "last_text">
					<span><font style = "font-family: '돋움체';">이미 가입하셨나요?&nbsp;</font></span>
					<a href = "/junglecast/menu=login" target = "_self" style="color:#00A1FF;"><font style = "font-family: '돋움체';">로그인하기</font></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!------------------------------- 가입 1 END---------------------------------------------->
<!------------------------------- 가입 2-1~4---------------------------------------------->
<div class = "layer_2">
	<div class = "container_2">
		<div class = "header_2">
			<div class = "c_header_2">
				<a href = "/junglecast" target = "_self">
					<img src="resources/images/loginImg/pikicast_logo.png" width = 212px height = 78px>
				</a>
			</div>
		</div>
	</div>
<!------------------------------- 가입 2-1---------------------------------------------->
	<div class = "contents_2">
		<div class = "midcontents_2">
			<div class = "c_contents_2">
				<img src = "resources/images/joinImg/join_1.png" width = 100% height = 115px style="padding-bottom:20px;">
			</div>
			<div class = "c_midcontents_2">
				<div class = "c2_midcontents_1">
					<h3>서비스 이용약관 동의 (필수)&nbsp<span><img src = "resources/images/joinImg/choice_1.png" class = "checkImg" style = "cursor:pointer;
					width:22px; height:22px; vertical-align:middle;"></span>
					</h3>
					<div class = "textbox_1">
						<div class ="text_cont_1">
						<h3 class="mgt0">제 1 조 (목적)</h3>
							<p>본 약관은 (주)피키캐스트(이하 '회사')가 제공하는 회사 및 회사 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
						<h3>제 2 조 (용어의 정의)</h3>
							<ol>
								<li>
									본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) '서비스'란 접속 가능한 유.무선 단말기의 종류와는 상관없이 이용 가능한 '회사'가 제공하는 모든 '서비스'를 의미합니다.</li>
										<li>(2) '이용자'란 회사 서비스에 접속하여, 이 약관에 따라 회사가 제공하는 서비스를 이용하는 회원과 비회원을 의미합니다.</li>
										<li>(3) '회원'이란 회사와 서비스 이용 계약을 체결한 개인 또는 기업을 의미합니다.</li>
										<li>(4) 'ID'란 회원식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합을 의미합니다.</li>
										<li>(5) '비밀번호'란 회원이 부여 받은 아이디와 일치하는 회원임을 확인하고 회원의 비밀보호를 위해 회원 자신이 설정한 문자와 숫자의 조합을 의미합니다.</li>
										<li>(6) '탈퇴'란 회사 또는 회원이 서비스 개통 후 이용계약을 해약하는 것을 의미합니다.</li>
										<li>(7) '콘텐츠'란 회사, 에디터 또는 회원이 동영상, 이미지, 음원, 텍스트 등을 편집하여 회사가 운영하는 서비스에 업로드 할 목적으로 제작되는 창작물을 의미합니다.</li>
										<li>(8) '에디터'란 회사와 고용계약, 업무위탁계약 또는 업무제휴계약 등을 체결하여 서비스에 업로드 할 목적으로 콘텐츠를 제작 및 공급하는 개인 또는 기업을 의미합니다.</li>
									</ul>
								</li>
								<li>이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스 별 안내에서 정하는 바에 의합니다.</li>
							</ol>
						<h3>제 3 조 (이용약관의 효력 및 변경)</h3>
							<ol>
								<li>본 약관은 (주)피키캐스트(이하 '회사')가 제공하는 온라인상의 인터넷 서비스(이하 '서비스')의 이용약관으로 이용자에게 공시함으로써 효력이 발생합니다.</li>
								<li>회사는 합리적인 사유가 발생할 경우 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률"(이하 "정보통신망법")" 등의 관련법령에 위배되지 않는 범위 안에서 약관을 개정할 수 있습니다.</li>
								<li>개정된 약관에 이용자의 권리 또는 의무 등 중요한 규정의 개정이 있는 경우 사전에 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.</li>
								<li>회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 7일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.</li>
								<li>이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지 않습니다.</li>
								<li>회원이 변경된 약관에 동의하지 않을 경우 회사는 해당 회원의 탈퇴(해지)를 요청할 수 있습니다.</li>
							</ol>
						<h3>제 4조 (약관 외 사항에 대한 준칙)</h3>
							<ol>
								<li>이 약관은 회사가 제공하는 개별서비스에 관한 이용안내(이하 서비스별 안내라 합니다)와 함께 적용합니다.</li>
								<li>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 온라인디지털콘텐츠산업발전법, 전자상거래 등에서의소비자보호에관한법률, 약관의규제에관한법률, 정보통신부장관이 정하는 디지털콘텐츠 이용자보호지침, 기타 관계법령 또는 상관례에 따릅니다.</li>
							</ol>
						<h3>제 5 조 (서비스 이용계약 체결)</h3>
							<ol>
								<li>이용계약은 회원이 되고자 하는 자가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 회사가 이러한 신청에 대하여 승낙함으로써 체결됩니다.</li>
								<li>회사는 서비스 제공에 필요하다고 판단하는 경우 이용자에게 필요정보의 제공을 요청 할 수 있습니다.</li>
								<li>모든 회원은 반드시 이용자 본인의 e-mail 또는 회원가입에 필요한 정보를 제공하여야만 서비스를 이용할 수 있으며, 정확한 정보로 등록하지 않은 이용자는 일체의 권리를 주장할 수 없습니다.</li>
								<li>회원가입은 본인과 연락 가능한 정확한 정보로 가입해야 하며, 회사는 게시물 관리 등을 위한 정보 확인 조치를 할 수 있습니다.</li>
								<li>타인의 정보를 도용하여 이용신청을 한 회원의 모든 ID는 삭제되며 관계 법령에 따라 처벌을 받을 수 있습니다.</li>
							</ol>
						<h3>제 6조 (이용 신청의 승낙과 제한)</h3>
							<ol>
								<li>회사는 제 5조의 규정에 의한 이용신청고객에 대하여 업무 수행상 또는 기술상 지장이 없는 경우에 원칙적으로 접수순서에 따라 서비스 이용을 승낙합니다.</li>
								<li>회사는 아래사항에 해당하는 경우에 대해서 승낙하지 않거나 거부할 수 있습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) 이용신청고객이 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우 (단, 회사의 재가입 승낙을 얻은 경우에는 예외로 함)</li>
										<li>(2) 타인의 정보를 이용하여 신청한 경우</li>
										<li>(3) 회원가입 절차에 있어 내용을 허위로 기재한 경우</li>
										<li>(4) 사회의 안녕과 질서, 미풍양속을 저해할 목적으로 신청한 경우</li>
										<li>(5) 부정한 용도로 본 서비스를 이용하고자 하는 경우</li>
										<li>(6) 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우</li>
										<li>(7) 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
									</ul>
								</li>
								<li>회사는 서비스 이용신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) 회사가 설비의 여유가 없는 경우</li>
										<li>(2) 회사의 기술상 지장이 있는 경우</li>
										<li>(3) 기타 회사의 귀책사유로 이용승낙이 곤란한 경우</li>
									</ul>
								</li>
								<li>회사는 회원에 대하여 '영화및비디오물의진흥에관한법률' 및 '청소년보호법'등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</li>
							</ol>
						<h3>제 7조 (개인정보 보호)</h3>
							<p>회사는 관계법령이 정하는 바에 따라 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위해 노력합니다. 이용자 개인정보의 보호 및 사용에 대해서는 관련법령 및 회사의 개인정보 취급방침이 적용됩니다. 단, 회사의 공식사이트 이외의 웹에서 링크된 사이트에서는 회사의 개인정보 취급방침이 적용되지 않습니다. 또한 회사는 이용자의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.</p>
						<h3>제 8 조 (회원ID 부여 및 변경 등)</h3>
							<ol>
								<li>회사는 이용고객에 대하여 약관에 정하는 바에 따라 회원ID를 부여합니다.</li>
								<li>회원ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 해당 회원ID를 해지하고 재가입해야 합니다.</li>
								<li>회원 ID 및 프로필 사진이 다음 각 호에 해당하는 경우에는 회사가 회원에게 알리지 않고 ID 및 프로필 사진을 임의로 변경할 수 있습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) 이용자 본인이 아닌 타인을 사칭하여 사생활 침해가 우려되는 경우</li>
										<li>(2) 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우</li>
										<li>(2) 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우</li>
										<li>(3) 기타 합리적인 사유가 있는 경우</li>
									</ul>
								</li>
								<li>서비스 회원ID 및 비밀번호의 관리책임은 이용자에게 있습니다. 이를 소홀이 관리하여 발생하는 서비스 이용상의 손해 또는 제3자에 의한 부정이용 등에 대한 책임은 이용자에게 있으며 회사는 그에 대한 책임이 없습니다.</li>
								<li>기타 이용자 개인정보 관리 및 변경 등에 관한 사항은 서비스 별 안내에 정하는 바에 의합니다.</li>
							</ol>
						<h3>제 9 조 (회사의 의무)</h3>
							<ol>
								<li>회사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.</li>
								<li>회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.</li>
								<li>회사는 서비스이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 연락 가능한 수단을 통하여 회원에게 처리과정 및 결과를 전달합니다.</li>
							</ol>
						<h3>제 10 조 (회원의 의무)</h3>
							<ol>
								<li>이용자는 회원가입 신청 또는 회원정보 변경 시 본인에 대한 정확한 정보로 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보로 등록할 경우 일체의 권리를 주장할 수 없습니다.</li>
								<li>회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등 회사가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상시키는 행위를 해서는 안됩니다.</li>
								<li>회원은 전자우편주소 등 이용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 회사에 즉시 알려야 합니다.</li>
								<li>회사가 관계법령 및 '개인정보 보호취급방침'에 의거하여 그 책임을 지는 경우를 제외하고 회원에게 부여된 ID의 비밀번호 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.</li>
								<li>회원은 회사의 사전 승낙 없이 서비스를 이용하여 제3자를 위한 광고활동을 할 수 없으며, 그 활동의 결과에 대해 회사는 책임을 지지 않습니다. 또한 회원은 이와 같은 영업활동으로 회사가 손해를 입은 경우, 회원은 회사에 대해 손해배상의무를 지며, 회사는 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.</li>
								<li>회원은 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.</li>
							</ol>
						<h3>제 11 조 (게시물의 관리)</h3>
							<ol>
								<li>게시물이라 함은 회사의 서비스에 업로드 된 콘텐츠 및 콘텐츠를 구성하는 각종 파일과 링크, 회원들의 댓글 등을 포함하는 정보를 의미합니다.</li>
								<li>회원은 서비스를 통해 접근한 게시물에 관한 모든 법적 책임으로부터 회사를 면책하여야 하며, 회사는 서비스를 통해 제공되는 게시물에 관해 아무런 책임을 지지 않습니다.</li>
								<li>회사는 업무위탁계약 및 업무제휴계약을 맺은 제휴사가 제작하여 공급한 콘텐츠의 경우, 계약조건에 따라 게시물에 대한 별도의 관리 조정을 할 수 있습니다.</li>
								<li>회사는 다음 각 호에 해당하는 게시물을 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있으며, 필요할 경우 제15조에 따른 계정정지 또는 계정삭제를 할 수 있습니다. 또한, 회원은 불쾌감을 느끼는 댓글에 대하여 신고할 수 있으며, 해당 댓글은 해당 회원에게 제공되는 서비스에 한하여 더 이상 노출되지 않습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</li>
										<li>(2) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우</li>
										<li>(3) 불법복제 또는 해킹을 조장하는 내용인 경우</li>
										<li>(4) 영리를 목적으로 하는 광고일 경우</li>
										<li>(5) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우</li>
										<li>(6) 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
										<li>(7) 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우</li>
										<li>(8) 관계법령에 위배된다고 판단되는 경우</li>
										<li>(9) 기타 합리적인 이유가 있는 경우</li>
									</ul>
								</li>
								<li>회원의 게시물로 인하여 사생활 침해나 명예훼손 등 자신의 권리가 침해된 이용자는 회사에 침해사실을 소명하여 그 정보의 삭제 또는 반박내용의 게재를 요청할 수 있으며, 회사는 지체 없이 삭제, 임시조치 등의 필요한 조치를 한 후 해당 게시물의 게재자에게 알립니다. 다만, 정보의 삭제 요청에도 불구하고 권리의 침해 여부를 판단하기 어렵거나 이해당사자 간에 다툼이 예상되는 경우에는 30일 이내의 기간동안 해당 정보에 대한 접근을 임시적으로 차단하는 조치를 할 수 있습니다.</li>
								<li>회사는 전항의 권리자의 요청이 없는 경우라도 권리침해가 인정될 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 해당 게시물에 대해 임시조치를 취할 수 있습니다.</li>
								<li>본 조에 따른 세부절차는 관련법령이 정한 범위 내에서 회사가 정한 ‘신고서비스’에 따릅니다.</li>
							</ol>
						<h3>제 12 조 (권리의 귀속)</h3>
							<ol>
								<li>서비스 및 콘텐츠에 대한 저작권 및 지식재산권은 회사에 귀속됩니다. 단, 회원의 게시물 및 업무위탁계약, 제휴계약에 따라 제공된 저작물, 콘텐츠에 인용된 타인의 저작물 등은 제외합니다.</li>
								<li>업무위탁계약 및 제휴계약에 따라 제공된 저작물의 경우 각 계약 조건에 따라 저작권 및 지식재산권의 귀속이 달리 정해질 수 있습니다.</li>
								<li>회사는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, 아이디, 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, 회원은 이를 양도, 판매, 담보제공 등 처분행위의 대상으로 삼을 수 없습니다.</li>
							</ol>
						<h3>제 13 조 (콘텐츠의 사용)</h3>
							<ol>
								<li>서비스 내에서 명시적으로 허용되지 않는 한, 이용자는 본 서비스의 게시물 일체를 복사, 복제, 배포, 게재할 수 없으며, 기술적 보호조치의 무력화에 관련한 행위를 할 수 없습니다.</li>
								<li>회사가 서비스를 통해 다양한 콘텐츠를 제공하기 위하여 다른 출처의 자료를 인용하는 것과 같이, 회사는 공정이용에 대한 타인의 권리를 존중하며, 이용자는 때때로 공정이용의 원칙에 부합하여 본 서비스의 콘텐츠를 발췌하여 사용할 수 있습니다.</li>
							</ol>
						<h3>제 14조 (계약 변경 및 해지)</h3>
							<ol>
								<li>회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인으로 신청하거나 고객센터를 통해 해지할 수 있으며, 회사는 관련법 등이 정하는 바에 따라 이를 즉시 처리 합니다.</li>
								<li>회원이 계약을 해지함과 동시에 회원의 개인정보 및 회원이 회사에 작성한 게시물은 모두 소멸됩니다.</li>
							</ol>
						<h3>제 15조 (서비스 이용제한)</h3>
							<ol>
								<li>회사는 이용자가 서비스 이용 내용에 있어서 본 약관 제 10조 혹은 11조의 내용을 위반하거나, 다음 각 호에 해당하는 경우 서비스 이용을 제한할 수 있습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1) 서비스 이용 신청 또는 변경 시 허위내용의 등록</li>
										<li>(2) 타인의 정보 도용</li>
										<li>(3) 회사가 게시한 정보의 변경</li>
										<li>(4) 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
										<li>(5) 회사와 기타 제3자의 저작권 등 지식재산권에 대한 침해</li>
										<li>(6) 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
										<li>(7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 미풍양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위</li>
										<li>(8) 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위</li>
										<li>(9) 미풍양속을 저해하는 비속한 ID 및 별명 사용</li>
										<li>(10) 타 이용자에게 심한 모욕을 주거나, 서비스 이용을 방해한 경우</li>
										<li>(11) 불법 콘텐츠인 경우</li>
										<li>(12) 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우</li>
										<li>(13) 기타 정상적인 서비스 운영에 방해가 될 경우</li>
									</ul>
								</li>
								<li>상기 이용제한에 대한 절차는 아래와 같습니다.
									<ul style="list-style: none; padding-left:0px;">
										<li>(1)	회사는 제10조, 제11조 및 제15조 제1항의 내용을 위반하는 회원에 대하여 회사의 합리적인 판단 및 이용자의 신고를 고려하여 해당 회원의 계정을 정지하거나 삭제할 수 있습니다.</li>
										<li>(2)	회사는 위 (1)의 조치에 관하여 해당 회원의 이메일을 통해 그 내용을 전달하며, 회원은 회사가 정한 절차를 통하여 정정신고 등 이의제기를 할 수 있습니다.</li>
									</ul>
								</li>
							</ol>
						<h3>제 16조 (손해배상)</h3>
							<p>회사는 서비스에서 무료로 제공하는 서비스의 이용과 관련하여 개인정보보호정책에서 정하는 내용에 해당하지 않는 사항에 대하여는 어떠한 손해도 책임을 지지 않습니다.</p>
						<h3>제 17조 (면책조항)</h3>
							<ol>
								<li>회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.</li>
								<li>회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.</li>
								<li>회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.</li>
								<li>회사는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.</li>
								<li>회사는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.</li>
								<li>회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.</li>
								<li>회사는 회원이 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다. 또한 회사는 회원이 서비스를 이용하며 타 회원으로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을 지지 않습니다.</li>
								<li>회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.</li>
								<li>회사는 이용자 상호간 및 이용자와 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.</li>
								<li>회사에서 회원에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지 않습니다.</li>
							</ol>
						<h3>제 18조 (재판권 및 준거법)</h3>
							<ol>
								<li>이 약관에 명시되지 않은 사항은 통신 심의 관련법 등 관계법령과 상관습에 따릅니다.</li>
								<li>서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 회사의 본사 소재지를 관할하는 법원을 관할 법원으로 합니다.</li>
							</ol>
						<h3>&lt;부칙&gt;</h3>
							<ol>
								<li>(시행일) 본 약관은 2015년 12월 21일부터 적용됩니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class = "c2_midcontents_2">
					<h3>개인정보 수집 및 이용 동의 (필수)&nbsp<span><img src = "resources/images/joinImg/choice_1.png" class = "checkImg_2" style = "cursor:pointer;
					width:22px; height:22px; vertical-align:middle;"></span>
					</h3>
					<div class = "textbox_2">
						<div class ="text_cont_2">
						회사는 회원제 서비스 제공을 위해 귀하의 개인정보를 아래와 같이 수집하고자 합니다.
						<ol style="margin-bottom:0px;">
							<li>수집하는 개인정보 항목 : 이메일, 닉네임, 비밀번호, 성별, 생년월일</li>
							<li>수집 및 이용목적 : 서비스 제공에 관한 계약이행, 회원관리, 신규서비스 개발 및 마케팅</li>
							<li>보유 및 이용기간 : 각 수집 및 이용목적이 달성되는 즉시 파기</li>
						</ol>
						*&nbsp;서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.
						</div>
					</div>
				</div>
			</div>
			<div class = "buttons">
				<input type = "submit" value = "가입취소" class = "button_1">
				<input type = "submit" value = "다음" class = "button_2">
			</div>
		</div>
	</div>
	<div class="darkwindow"></div>
	<div class="c2_alert_1">
		<div class="c2_alert_1-1">
			<p class="c2_alert_1_line1" style="font-family: '돋움'; font-size: 12px;"><em style="color: #00a6de; font-style: normal;">서비스 이용약관</em>에 대한 동의는<br>필수 항목입니다.</p>
		</div>
		<div class = "c2_alert_1-2">
			<input type = "submit" value="확인" class="c2_alert_1_line2">
		</div>
	</div>
	<div class="c2_alert_2">
		<div class="c2_alert_2-1">
			<p class="c2_alert_2_line1" style="font-family: '돋움'; font-size: 12px;"><em style="color: #00a6de; font-style: normal;">개인정보 수집</em> 및 <em style="color: #00a6de; font-style: normal;">이용목적</em>에 대한 동의는<br>필수 항목입니다.</p>
		</div>
		<div class = "c2_alert_2-2">
			<input type = "submit" value="확인" class="c2_alert_2_line2">
		</div>
	</div>
<!------------------------------- 가입 2-1END---------------------------------------------->
<!------------------------------- 가입 2-2---------------------------------------------->
	
	<div class = "contents_3">
	<!-- <form name="sendForm" method="post"> -->
		<div class = "midcontents_3">
			<div class = "c_contents_3">
				<img src = "resources/images/joinImg/join_2.png" width = 100% height = 115px style="padding-bottom:20px;">
			</div>
			<form name="sendForm" method="post" action="InsertJoinInfo">
			<div class = "c_midcontents_3">
				<div class = "c3_midcontents">
					<h3 style = "margin-bottom:8px; font-size:20px; font-weight:normal; font-family:'돋움'">이메일*&nbsp</h3>
						<span class = "c3_line_1">
							<span class = "id">
								<input type = "text" name="mail" placeholder = "이메일을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해주세요.'">
							</span> 
							<span style = "font-family:'돋움'; font-size:16px; color:#C8C8C8; vertical-align:bottom; margin-left:4px; margin-right:4px;">@</span>
							<span class = "adress">
								<input type = "text" name="adress">
							</span>
							<span class = "double">
								<input type = "submit" value = "중복확인" class = "doublebutton">
							</span>
							 
						</span>
						<div class = "c3_warning">
							<p class="id_warning1" style="display:none;">이메일은(는) 필수 입력 항목입니다.</p>
							<p class="id_warning2" style="display:none;">이메일을 잘못 입력하신 것 같아요.. 한 번 더 확인해주세요!</p>
						</div>
					<h3 style = "margin-top:15px;margin-bottom:10px; font-size:20px; font-weight:normal; font-family:'돋움'">비밀번호*&nbsp</h3>
						<span class= "c3_line_2">
							<span class = "password">
								<input type = "password" name="pw" placeholder = "비밀번호를 입력해주세요.(4자 이상)" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 입력해주세요.(4자 이상)'" style="float:left">
								<img src = "resources/images/joinImg/choice_1.png" class = "pwImg_1" style = "width:20px; height:20px; vertical-align:middle; float:right">
							</span>
							<span class = "passwordcorrect">
								<input type = "password" name="pw_correct" placeholder = "비밀번호를 한번 더 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 한번 더 입력해주세요.'" style="float:left">
								<img src = "resources/images/joinImg/choice_1.png" class = "pwImg_2" style = "width:20px; height:20px; vertical-align:middle; float:right">
							</span>
						</span>
						<div class = "c3_pw_warning">
							<p class="pw_warning1" style="display:none;">조금만 더 써주세요!비밀번호는 4자리이상 입력해야 하거든요.</p>
							<p class="pw_warning2" style="display:none;">어느 부분이 다른거죠!?비밀번호가 일치하지 않아요ᅲ</p>
							<p class="pw_warning3" style="display:none;">너무 급하신 거 아니에요?!비밀번호 부터 입력하셔야 해요.</p>
						</div>
					<h3 style = "margin-top:15px;margin-bottom:10px; font-size:20px; font-weight:normal; font-family:'돋움'">생년월일*&nbsp
					<a href="javascript:showbirthtext()" style="font-size:12px; color:#00A1FF; font-weight:normal;text-decoration:none; letter-spacing:-1px;"><em style="font-style:normal; text-decoration:underline;">생년월일,</em> 왜 입력하는 거죠?</a></h3>
					<div class="birth_text" style="display:none; position:absolute; width:266px; height:80px; padding-top:15px; padding-bottom:15px; padding-right:10px; padding-left:10px; background-image:URL('resources/images/joinImg/box.png'); margin-top:-140px;background-position-x: 0px; background-repeat-x: no-repeat; background-repeat-y: no-repeat;">
						<h2 style="color:#FFFFFF;font-size:16px;font-weight:bold;font-family:'돋움'; margin-top:0px;">생년월일 수집 방침</h2>
						<p style="color: #FFFFFF; font-size: 12px; letter-spacing: -1px; margin-top: 10px; line-height: 16px;">생일을 입력하면 회원님의 나이에 맞는<br>피키캐스트의 콘텐츠를 더 즐겁게 이용할 수 있습니다.</p>
						<a href='javascript:showbirthtext()' style="display:inline-block; width:12px; height:12px; position:absolute;top:10px;right:10px; color:#58595B;text-decoration:none;"></a>
					</div>
						<span class="c3_line_3">
							<span class = "year">
								<input type = "text" name="year" class="input_year" maxlength="4" placeholder = "출생" onfocus="this.placeholder = ''" onblur="this.placeholder = '출생'">
				  				<span style = "font-size:12px; font-family:'돋움'; ">년</span>
							</span>
							<span class="month">
								<select name='month_sel'>
									<option value="00" selected="selected">출생월</option>	
									<option value="01">01월</option>
									<option value="02">02월</option>
									<option value="03">03월</option>
									<option value="04">04월</option>
									<option value="05">05월</option>
									<option value="06">06월</option>
									<option value="07">07월</option>
									<option value="08">08월</option>
									<option value="09">09월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
							</span>
							<span class="day">
								<select name='day_sel'>
									<option value="00" selected="selected">출생일</option>	
									<option value="01">01일</option>
									<option value="02">02일</option>
									<option value="03">03일</option>
									<option value="04">04일</option>
									<option value="05">05일</option>
									<option value="06">06일</option>
									<option value="07">07일</option>
									<option value="08">08일</option>
									<option value="09">09일</option>
									<option value="10">10일</option>
									<option value="11">11일</option>
									<option value="12">12일</option>
									<option value="13">13일</option>
									<option value="14">14일</option>
									<option value="15">15일</option>
									<option value="16">16일</option>
									<option value="17">17일</option>
									<option value="18">18일</option>
									<option value="19">19일</option>
									<option value="20">20일</option>
									<option value="21">21일</option>
									<option value="22">22일</option>
									<option value="23">23일</option>
									<option value="24">24일</option>
									<option value="25">25일</option>
									<option value="26">26일</option>
									<option value="27">27일</option>
									<option value="28">28일</option>
									<option value="29">29일</option>
									<option value="30">30일</option>
									<option value="31">31일</option>
								</select>
							</span>
						</span>
						<div class = "c3_year_warning">
							<p class="year_warning1" style="display:none;">슈우우웅, 미래에서오신건가요?!!!</p>
						</div>
					<h3 style = "margin-top:20px;margin-bottom:10px; font-size:20px; font-weight:normal; font-family:'돋움'">성별*&nbsp</h3>
						
						<input type="radio" id="radio1" name="m_gender" value="male">
  							<label for="radio1">남자</label>
						<input type="radio" id="radio2" name="m_gender"value="female">
   							<label for="radio2">여자</label>
				</div>
			</div>
			<input type="hidden" id="m_mail" name="m_mail">
			<input type="hidden" id="m_pw" name="m_pw">
			<input type="hidden" id="m_birth" name="m_birth">
			</form>
			<div class = "c3_buttons">
				<input type = "submit" value = "이전" class = "c3_button_1">
				<input type = "submit" value = "다음" class = "c3_button_2">
			</div>
		</div>
	</div>
	
	<!--  </form> -->
	<div class="darkwindow"></div>
	<div class="c3_alert_1">
		<div class="c3_alert_1-1">
			<p class="c3_alert_1_line1" style="display = none;"><em style="color: #00a6de; font-style: normal;">이메일</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_1" style="display = none;"><em style="color: #00a6de; font-style: normal;">비밀번호</em>는 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_2" style="display = none;"><em style="color: #00a6de; font-style: normal;">비밀번호 확인</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_3" style="display = none;"><em style="color: #00a6de; font-style: normal;">출생년</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_4" style="display = none;"><em style="color: #00a6de; font-style: normal;">출생월</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_5" style="display = none;"><em style="color: #00a6de; font-style: normal;">출생일</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_6" style="display = none;"><em style="color: #00a6de; font-style: normal;">성별</em>은 필수 입력 항목입니다.</p>
			<p class="c3_alert_1_line1_7" style="display = none;">슈우우웅, 미래에서오신건가요?!!!</p>
			<p class="c3_alert_1_line1_8" style="display = none;">이미 가입된 이메일입니다.</p>
		</div>
		<div class = "c3_alert_1-2">
			<input type = "submit" value="확인" class="c3_alert_1_line2">
		</div>
	</div>
	<div class="c3_alert_2">
		<div class="c3_alert_2-1">
			<p class="c3_alert_2_line1" style="display = none;"><em style="color: #00a6de; font-style: normal;">이메일</em>을 잘못 입력하신 것 같아요..<br>한 번 더 확인해주세요!</p>
			<p class="c3_alert_2_line1_1" style="display = none;">어느 부분이 다른거죠!?<br>비밀번호가 일치하지 않아요ㅠ</p>
		</div>
		<div class = "c3_alert_2-2">
			<input type = "submit" value="확인" class="c3_alert_2_line2">
		</div>
		
	</div>
	
<!------------------------------- 가입 2-2END---------------------------------------------->
<!------------------------------- 가입 2-3---------------------------------------------->
	<div class = "contents_4">
		<div class = "midcontents_4">
			<div class = "c_contents_4">
				<img src = "resources/images/joinImg/join_3.png" width = 100% height = 115px style="padding-bottom:20px;">
			</div>
			<form name="sendProfile" method="post" action="InsertProfileInfo">
			<div class = "c_midcontents_4">
				<div class = "c4_midcontents">
					<div class = "c4_midtop">
						<img src = "resources/images/joinImg/default_avatar.png"  value = "resources/images/joinImg/default_avatar.png" class="defaultImg" onerror="resources/images/joinImg/default_avatar.png">
						<div style = "position:absolute; height:27px; width:27px; background-image:url("resources/images/joinImg/camera.png");">
						<input type ='file' name = "m_pic" onchange="readURL(this);" style="width:0px; height:20;filter:alpha(opacity=0);"/>
						</div>
					</div>
					<h3 style = "margin-top:0px;margin-bottom:8px; font-size:20px; font-weight:normal; font-family:'돋움'">닉네임*&nbsp</h3>
					------------------ 프로필사진 업로드 미완성 --------------------
					<div class = "c4_line_1">
						<span class = "nickname">
							<input type = "text" name="m_nickname" maxlength="14" placeholder = "닉네임을 입력해 주세요 (최대 14자)" onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임을 입력해 주세요 (최대 14자)'">
							<span class="inputCnt">0</span>
						</span> 
						<span class = "n_double" style="margin-left:10px;">
							<input type = "submit" value = "중복확인" class = "n_doublebutton">
						</span>
					</div>
					<div class = "c4_nickname_warning">
						<p class="nickname_warning1" style="display:none;">닉네임은 필수 입력 항목입니다.</p>
						<p class="nickname_warning2" style="display:none;">이런, 늦어부렸어,사용중인 닉네임이라네요.. 부들부들</p>
					</div>
					<h3 style = "margin-top:55px;margin-bottom:8px; font-size:20px; font-weight:normal; font-family:'돋움'">나의 한줄 소개*&nbsp</h3>
					<div class = "c4_line_2">
						<span class = "myintro">
							<input type = "text" name="m_introduce" maxlength="17" placeholder = "자신을 표현해 보세요! (1~17자)" onfocus="this.placeholder = ''" onblur="this.placeholder = '자신을 표현해 보세요! (1~17자)'">
							<span class="intro_inputCnt">0</span>
						</span> 
					</div>
				</div>
			</div>
			</form>
			<div class = "c4_buttons">
				<input type = "submit" value = "이전" class = "c4_button_1">
				<input type = "submit" value = "완료" class = "c4_button_2">
			</div>
		</div>
	</div>
	<div class="darkwindow"></div>
	<div class="c4_alert_1">
		<div class="c4_alert_1-1">
			<p class="c4_alert_1_line1" style="display = none;"><em style="color: #00a6de; font-style: normal;">닉네임</em>을 잘못 입력하신 것 같아요..<br>한 번 더 확인해주세요!</p>
		</div>
		<div class = "c4_alert_1-2">
			<input type = "submit" value="확인" class="c4_alert_1_line2">
		</div>
	</div>
	<div class="c4_alert_2">
		<div class="c4_alert_2-1">
			<p class="c4_alert_2_line1" style="display = none;">이런, 늦어부렸어,<br>사용중인 <em style="color: #00a6de; font-style: normal;">닉네임</em>이라네요.. 부들부들</p>
		</div>
		<div class = "c4_alert_2-2">
			<input type = "submit" value="확인" class="c4_alert_2_line2">
		</div>
	</div>
<!------------------------------- 가입 2-3 END---------------------------------------------->
<!------------------------------- 가입 2-4---------------------------------------------->
	<div class = "contents_5">
		<div class = "midcontents_5">
			<div class = "c_contents_5">
				<img src = "resources/images/joinImg/join_4.png" width = 100% height = 115px style="padding-bottom:20px;">
			</div>
			<div class = "c_midcontents_5">
				<div class = "c5_midcontents">
					<div class = "c5_midtop">
						<img src = "resources/images/joinImg/sign_complete.gif" class="join_gif" style="width:302px; height:198px; margin:0 auto; display:block; padding-top:10px; padding-bottom:10px;">
					</div>
					<p style="font-size:20px; color:#707070; font-weight:bold; line-height:27px; text-align:center; font-family:'돋움'; margin:0;">
					가입이 완료되었습니다.<br>더 즐겁게 피키캐스트를 이용하실 수 있습니다.</p>
					
				</div>
			</div>
		</div>
	</div>
<!------------------------------- 가입 2-4 END--------------------------------------------->
</div>
<!------------------------------- 가입 2-1~4END--------------------------------------------->
</body>
</html>