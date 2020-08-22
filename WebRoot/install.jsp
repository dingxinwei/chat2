<%@ page language="java" import="java.util.*,com.wx.service.*,com.wx.service.impl.*,com.wx.pojo.*,com.wx.util.*;" pageEncoding="utf-8"%>
<%-- 更新session中的数据--%>
<% 
FriendService fservice = (FriendService) WebUtils.getBean("friend");
User u =(User) session.getAttribute("user");
if(u != null){
	User user = fservice.selUserService(u.getAccount());
	session.setAttribute("user", user);
}

%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="common/css/common.css"/>
<link rel="shortcut icon" type="image/x-icon" href="common/img/setting.ico" />
<script type="text/javascript" src="common/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="common/js/seach.js"></script>
<script type="text/javascript" src="common/js/ajax.js"></script>
</head>
<style>
::-webkit-scrollbar{width:0px;}
.bir_block_face{
	width:100px;
	height:100px;
	background-color:#99F;
	border-radius:2px;
	overflow:hidden;	
	margin:auto;
	margin-top:50px;
	margin-bottom:20px;
}
.bir_block_font{
	text-align:center;
	font-size:13px;
	margin-top:14px;	
}
.headImg{
	width:100%;
	height:100%;

}
.bir_block_exit{
	width:124px;
	height:24px;
	border:1px #e7e7e7 soild;
	background-color:white;
	margin:auto;
	text-align:center;
	line-height:24px;
	font-size:13px;
	margin-top:26px;
	color:black;	
}
.com{
	background-color:#f5f5f5;
	border:none;
	width:70px;
}
</style>
<script>
	$(function (){
		var winds = $(window).height();
		var windw = $(window).width();
		$(".buju_left").height(winds);
		$(".buju_center").height(winds);
		$(".buju_right").height(winds);
		$(".bcen_box").height(winds - 60);
		$(".buju_right").width(windw - 312);
		
		
		$(".bcen_menu_block").mouseenter(function (){
			$(this).not(".bcen_background").css("background-color","#ddd");	
		})
		$(".bcen_menu_block").mouseleave(function (){
			$(this).not(".bcen_background").css("background-color","#e7e8e9");	
		})
		
	})
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
						$(this).css("height",image_height);
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
                                        <div class="bcen_menu_block">
                                        	<a href="commoninstall.jsp">
                                                            <img src="common/img/install002.png"/>
                                                            <label>通用设置</label>
                                                  </a>
                                        </div>
                                       
                              </div>
                    </div>
                    <!-- 中间功能列表-->
                    <!-- 右边详情框 -->
                    <div class="buju_right fl">
                    	<div class="bri_top">
                              	<div class="bri_top_font fl">
                                        	个人信息
                                        </div>
                                        <div class="clear"></div>
                              </div>
                              <div class="bir_block">
                              	<div class="bir_block_face">
                              				<img src="" title="点击上传头像" onclick="getImg()" class="headImg"/>
                              				<form  id="uploadImg" >
                              					<input type="file" name="headimg" id="hImg" style="display:none"/>
                              					
                              	
                              				</form>
                                        	
                                        </div>   
                                        <div class="bir_block_font">账号:<span id="account">${user.account}</span></div>
                                        
                              	<div class="bir_block_font">昵称:<input type="text" value="${user.nickname}" class="com" onchange="updateInfo(this,'nickname')"/></div>
                                        <div class="bir_block_font">年龄:<input type="text" value="${user.age}" class="com" onchange="updateInfo(this,'age')"/></div>
                                        <div class="bir_block_font">性别:<input type="text" value="${user.sex==1?'男':'女'}" class="com" onchange="updateInfo(this,'sex')"/></div>
                                        <div class="bir_block_font">出生日期:<input type="text" value="${user.birth}" class="com" onchange="updateInfo(this,'birth')"/></div>
                                        <a href="javascript:ackOut()" id="out"><div class="bir_block_exit">退出登录</div></a>
                              </div>
                              <script>
                              
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
                              function getImg(){
                            	  $("#uploadImg").attr("enctype","multipart/form-data");
                            	  $("#hImg").click();
                            	 $("#hImg").change(upload);
                              }
                              function upload(){
                            	  var formData = new FormData();
                            	  formData.append('acc',$('#account').html());
                            	  formData.append('img',$('#hImg')[0].files[0]);
                            	 
                            	  myAjax("post","uploadHImg",formData,true,undefined); 
                            	  
                              }
                              function ackOut(){
                            	  var flag = window.confirm("你确定要退出吗？");
                            	  if(flag){
                            		 $("#out").attr("href","user/out?account="+$('#account').text());
                            		 $(".bir_block_exit").click();
                            	  }
                              }
                              
                              
                              
                              function updateInfo(inp,name){
                            	  var account = $('#account').text();
                            	  
                            	  var val = inp.value;
                            	  if("sex" == name){
                            		  if("男" == val){
                            			  val = 1;
                            		  }else{
                            			  val = 0;
                            		  }
                            	  }
                            	
                            	  var data = name+"="+val+"&account="+account;
                            	  myAjax("post","user/updateuserinfo",data,true,"application/x-www-form-urlencoded");
                              }
							
			</script>
                    </div>
                    <!-- 右边详情框 -->
          </div>
</body>
</html>
