<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>通用设置</title>
<link rel="stylesheet" type="text/css" href="common/css/common.css"/>
<link rel="shortcut icon" type="image/x-icon" href="img/setting.ico" />
<script type="text/javascript" src="common/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="common/js/seach.js"></script>
<script type="text/javascript" src="common/js/ajax.js"></script>
</head>
<style>
::-webkit-scrollbar{width:0px;}
.bir_block_one{
	margin-left:28px;
	margin-top:24px;	
}
.bir_block_one > div{
	margin-bottom:26px;	
}
input[type="time"]{
	font-size:14px;
	width:80px;
	height:25px;	
}
.headImg{
	width:100%;
	height:100%;

}
</style>
<script>
	$(function (){
		var winds = $(window).height();
		var windw = $(window).width();
		$(".buju_left").height(700);
		$(".buju_center").height(700);
		$(".buju_right").height(700);
		$(".bcen_box").height(700);
		$(".buju_right").width(1030);
		
		
		$(".bcen_menu_block").mouseenter(function (){
			$(this).not(".bcen_background").css("background-color","#ddd");	
		})
		$(".bcen_menu_block").mouseleave(function (){
			$(this).not(".bcen_background").css("background-color","#e7e8e9");	
		})
		
		$(".bir_block_but").click(function (){
			var imgs = $(this).find("img").attr("src");
			imgs = imgs.replace("common/img/","");
			imgs = imgs.replace(".png","");
			if(imgs == "butclose"){
				$(this).find("img").attr("src","common/img/butopen.png");	
				if($(this).hasClass("bir_block_time")){
					$(".intime").css("display","block");	
				}	
			}else if(imgs == "butopen"){
				$(this).find("img").attr("src","common/img/butclose.png");
				if($(this).hasClass("bir_block_time")){
					$(".intime").css("display","none");	
				}			
			}	
		})
		
	})
	$(function(){
      	  var url = "headImg/"+${user.account}+".jpg";
      	  myAjax("post",url,"",true,"",success,notFound);
        })
        var success=function(ajax){
      	  $(".headImg").attr("src","headImg/"+${user.account}+".jpg");
        }
        var notFound=function(ajax){
      	  $(".headImg").attr("src","common/img/face001.jpg");
        }
</script>
<body> 
	<div class="buju">
          	<div class="buju_left fl">
                    	<div class="bleft_face fl">
                              	<img src="" class="headImg"/>		
                              </div>
                              <div class="bleft_iconone fl">
                              	<a href="chat.jsp"><img src="common/img/chat010.png" width="100%"/></a>
                              </div>
                              <div class="bleft_iconnum" style="display:none"></div>
                              <div class="bleft_iconone fl">
                              	<a href="friends.jsp"><img src="common/img/chat020.png" width="100%"/></a>
                              </div>
                              <div class="bleft_iconone fl">
                              	<a href="install.jsp"><img src="common/img/chat031.png" width="100%"/></a>
                              </div>
                    </div>
                    <script>
			$(function (){
				var image_width=$(".bleft_face").width();
				var image_height=$(".bleft_face").height();
				var image_bi=image_width/image_height;
				$(".bleft_face img").each(function (){
					var images_width=$(this).width();
					var images_height=$(this).height();
					var images_bi=images_width/images_height;
					if(image_bi<images_bi){
						$(this).css("height","700px");
						var imgwidth=image_height * images_bi;
						var widths= 0 - (imgwidth - image_width) / 2;
						$(this).css("margin-left",widths);
					}else{
						$(this).css("width","100%");	
						var imgheight=image_width / images_bi;	
						var heights=0 - (imgheight - image_height) / 2;
						$(this).css("margin-top",heights);
					}
				})	
			})				
		</script>
                    <!-- 中间功能列表-->
                    <div class="buju_center fl">
                    	<!--<div class="bcen_seach fl">
                              	<div class="bcen_seach_font fl">搜索</div>
                              	<input type="text" style="display:none;" class="fl"/>
                                        <div class="bcen_seach_close fr" style="display:none;"><img src="common/img/close.png"/></div>
                                        <div class="bcen_seach_but fr">
                                        	<img src="common/img/seach.png" width="100%"/>
                                        </div>
                              </div>
                              <a href="javascript:void(0);">
                                        <div class="bcen_add fl">
                                                  <img src="common/img/add001.png"/>	
                                        </div>
                              </a>-->
                              <div class="clear"></div>
                              <div class="bcen_menu">
                              	<div class="bcen_menu_block">
                                        	<a href="install.jsp">
                                                            <img src="common/img/install001.png"/>
                                                            <label>个人信息</label>
                                                  </a>
                                        </div>
                                        <div class="bcen_menu_block bcen_background">
                                        	<a href="commoninstall.jsp">
                                                            <img src="common/img/install002.png"/>
                                                            <label>通用设置</label>
                                                  </a>
                                        </div>
                                        <input type="hidden" id="myacc" value="${user.account}"/>
                              </div>
                    </div>
                    <!-- 中间功能列表-->
                    <!-- 右边详情框 -->
                    <div class="buju_right fl">
                    	<div class="bri_top">
                              	<div class="bri_top_font fl">
                                        	通用设置
                                        </div>
                                        <div class="clear"></div>
                              </div>
                              <div class="bir_block">
                              	<div class="bir_block_one">
                                        	<p>新消息提醒</p>
                                                  <div class="bir_block_but"><img src="common/img/butclose.png"/></div>
                                                  <p>勿扰模式</p>
                                                  <div class="bir_block_but bir_block_time"><img src="common/img/butclose.png"/></div>
                                                  <div class="intime" style="display:none;">
                                                            <p>勿扰时间</p>
                                                            <div class="" style="margin-top:12px;font-size:14px;">
                                                                      <input type="time"/>&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;<input type="time">
                                                            </div>
                                                  </div>
                                               <div>新密码:<input type="password" name="newPwd" id="newPwd"/><span>（密码6位以上，必须以字母开头）</span></div> 
                                        	<div>原密码:<input type="password" name="oldPwd" id="oldPwd"/></div>
                                        	<div><button id="ackUpdate">确认修改</button></div>
                                        </div>
                              </div>
                    </div>
                    <!-- 右边详情框 -->
          </div>
          <script type="text/javascript">
          	$("#ackUpdate").click(function(){
          		var data = "account=" + $("#myacc").val();
          		myAjax("post","user/selpwd",data,true,"application/x-www-form-urlencoded",dealOldPwd);
          	})
           var dealOldPwd = function(ajax){
          		var data = ajax.responseText;
          		if(data == $("#oldPwd").val()){
          			var data = "account=" + $("#myacc").val() + "&pwd=" + $("#newPwd").val();
          			var checkPwd = /^[a-z]\w{5,10}$/;
          			if(checkPwd.test($("#newPwd").val())){
          				myAjax("post","user/updatepwd",data,true,"application/x-www-form-urlencoded",dealnewPwd);
          			}else{
          				alert("密码格式不正确");
          			}
          		}else{
          			alert("原密码错误,请重新输入");
          		}
          	}
          var dealnewPwd = function(ajax){
        	  var data = ajax.responseText;
        	  if(data == "1"){
        		  alert("密码修改成功");
        		  $("#oldPwd").val("");
        		  $("#newPwd").val("");
        	  }
          }
          </script>
</body>
</html>

 