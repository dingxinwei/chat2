<%@ page language="java" import="java.util.*,com.wx.service.*,com.wx.service.impl.*,com.wx.pojo.*,com.wx.util.*;" pageEncoding="utf-8"%>
<%-- 更新session中的数据--%>
<% 
FriendService fservice = (FriendService) WebUtils.getBean("friend");
	User u =(User) session.getAttribute("user");
	if(u != null){
		Friends friends = fservice.selAllFriendsService(u.getAccount());
		if(friends!= null){
			session.setAttribute("friends", friends.getFriends());
		}
	}
	
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <base href="<%=basePath%>">
<meta charset="utf-8">
<title>通讯录</title>
<link rel="stylesheet" type="text/css" href="common/css/common.css"/>
<link rel="stylesheet" type="text/css" href="common/css/style.css"/>
<link rel="shortcut icon" type="image/x-icon" href="img/fri.ico" />
<script type="text/javascript" src="common/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="common/js/seach.js"></script>
 <link rel="shortcut icon" type="image/x-icon" href="common/img/favicon1fbcbe.ico" />
<script type="text/javascript" src="common/js/scrolls.js"></script>
<script type="text/javascript" src="common/js/addfriends.js"></script>
<script type="text/javascript" src="common/js/ajax.js"></script>
</head>
<style>
::-webkit-scrollbar{width:0px;}
.headImg{
	width:100%;
	height:100%;

}
.fimg{
	width:100%;
	height:100%;

}
</style>
<script>
	$(function (){
		res();
		scrolls();
		$(window).resize(function(){
			res();
			scrolls();	
		})
		
		function res(){
			var winds = $(window).height();
			var windw = $(window).width();
			//最左边高度
			$(".buju_left").height(winds);
			//中间高度
			$(".buju_center").height(winds);
			//右边高度
			$(".buju_right").height(winds);
			$(".yinyings").height(winds);
			$(".bcen_box").height(winds - 62);
			$(".buju_right").width(windw - 312);
			$(".bri_bottom").width(windw - 310);
		}
		
		$(".bcen_friends").mouseenter(function (){
			$(this).not(".bcen_background").css("background-color","#ddd");	
		})
		$(".bcen_friends").mouseleave(function (){
			$(this).not(".bcen_background").css("background-color","#e7e8e9");	
		})
		
		$(".bcen_friends").click(function (){
			
			$(this).removeAttr("style");
			$(this).addClass("bcen_background");
			$(".bcen_friends").not(this).removeClass("bcen_background");
			if(!$(this).hasClass("bcen_new")){
				$(".bri_detail").css("display","block");
				$(".bri_top").css("display","none");		
			}else{
				$(".bri_detail").css("display","none");	
				$(".bri_top").css("display","block");		
			}
			$("#uname").html(this.innerText);
			var obj =  this.childNodes;
			if(obj[5].value == "1"){
				$("#sexImg").attr("src","common/img/man.jpg");
			}else{
				$("#sexImg").attr("src","common/img/woman.jpg");
			}
			$("#ag").html(obj[7].value);
			$("#acc").html(obj[9].value);
			$("#fimg").attr("src","headImg/"+obj[9].value+".jpg")
			$("#note").html(obj[11].value);
			/*bcen_new*/
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
          	<!-- 最左侧功能图标 -->
          	<div class="buju_left fl">
                    	<div class="bleft_face fl">
                              	<img src="" class="headImg"/>		
                              </div>
                              <div class="bleft_iconone fl">
                              	<a href="chat.jsp"><img src="common/img/chat010.png" width="100%"/></a>
                              </div>
                              <div class="bleft_iconnum" style="display:none"></div>
                              <div class="bleft_iconone fl">
                              	<a href="friends.jsp"><img src="common/img/chat021.png" width="100%"/></a>
                              </div>
                              <div class="bleft_iconone fl">
                              	<a href="install.jsp"><img src="common/img/chat030.png" width="100%"/></a>
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
				
				$(".bri_deb_two").eq(0).click(function (){
					$(this).removeClass("bri_deb_tip");
					$(this).find("label").css("display","none");
					$(".bri_deb_input").attr("type","text");
					$(".bri_deb_input").focus();
				})
				$(".bri_deb_input").blur(function (){
					var inputs = $(this).val();
					$(".bri_deb_two").eq(0).find("label").css("display","block");
					if(inputs != ""){
						$(".bri_deb_two").eq(0).css("width","fit-content");
						$(".bri_deb_two").eq(0).css("padding-right","2px");
						$(".bri_deb_two").eq(0).find("label").html();
						
						var data = "notes="+inputs+"&fAccount="+$("#acc").html()+"&account="+$("#hid").val();
						myAjax("post","friend/updnote",data,true,"application/x-www-form-urlencoded");
							
					}else{
						$(".bri_deb_two").eq(0).find("label").html("点击添加备注");
						
					}
					$(".bri_deb_two").eq(0).addClass("bri_deb_tip");
					
					$(".bri_deb_input").attr("type","hidden");
					$(".bri_deb_input").focus();
				})	
			})				
		</script>
                    <!-- 最左侧功能图标 -->
                    <!-- 中间功能列表-->
                    <div class="buju_center fl">
                    	<div class="bcen_seach fl">
                              	<div class="bcen_seach_font fl">搜索</div>
                              	<input type="text" style="display:none;" class="fl"/>
                                        <div class="bcen_seach_close fr" style="display:none;"><img src="common/img/close.png"/></div>
                                        <div class="bcen_seach_but fr">
                                        	<img src="common/img/seach.png" width="100%"/>
                                        </div>
                              </div>
                              <a href="javascript:void(0);" onclick="addfris()">
                                        <div class="bcen_add fl">
                                                  <img src="common/img/add001.png"/>	
                                        </div>
                              </a>
                              <div class="bcen_scroll" style="position:absolute;right:0px;top:62px;display:none;"></div>
                              <div class="clear"></div>
                              <div class="bcen_box">
                                        <div class="bcen_jilu">
                                                  <div class="bcen_first">群聊</div>
                                                  <div class="bcen_friends bcen_background bcen_new" style="border-bottom:1px #dcdbda solid;">
                                                            <div class="bcen_friends_face fl">
                                                                      <img src="common/img/newfriend.jpg"/>
                                                            </div>
                                                            <div class="bcen_friends_font fl">创建群聊</div>
                                                  </div>
                                                  
                                                  <c:forEach items="${friends}" var="f">
                                                  	 <div class="bcen_friends" >
                                                            <div class="bcen_friends_face fl" >
                                                                      <img src="headImg/${f.account}.jpg" class="fimg"/>
                                                            </div>
                                                            
                                                            <div class="bcen_friends_font fl">${f.nickname}</div>
                                                             <input type="hidden" value="${f.sex}" />
                                                            <input type="hidden" value="${f.age}" />
                                                            <input type="hidden" value="${f.account}" />
                                                            <input type="hidden" value="${f.notes}" />
                                                 	 </div>
                                                  
                                                  </c:forEach>
                                                 
                                                  
                                                  <script>
                                                  	
                                                  
                                                            $(function (){
                                                                      var image_widths=$(".bcen_friends_face").width();
                                                                      var image_heights=$(".bcen_friends_face").height();
                                                                      var image_bis=image_widths/image_heights;
                                                                      $(".bcen_friends_face img").each(function (){
                                                                                var images_widths=$(this).width();
                                                                                var images_heights=$(this).height();
                                                                                var images_bis=images_widths/images_heights;
                                                                                if(image_bis<images_bis){
                                                                                          $(this).css("height",image_heights);
                                                                                          var imgwidths=image_heights * images_bis;
                                                                                          var widthss= 0 - (imgwidths - image_widths) / 2;
                                                                                          $(this).css("margin-left",widthss);
                                                                                }else{
                                                                                          
                                                                                           var imgheights=image_widths / images_bis;	
                                                                                           var heightss=0 - (imgheights - image_heights) / 2;
                                                                                           $(this).css("margin-top",heightss);
                                                                                }
                                                                      })	
                                                            })				
                                                  </script>	
                                        </div>
                                        
                                        <div class="bcen_jilu" style="display:none;">
                                        	<div class="bsea_first">联系人</div>
                                                  <div class="bcen_block">
                                                            <div class="bcen_block_face fl">
                                                                      <img src="common/img/face003.jpg"/>
                                                            </div>	
                                                            <div class="bcen_block_font fl">
                                                                      <div class="bcen_block_title" style="line-height:40px;">冰雪</div>
                                                                      <!--<div class="bcen_block_fonts over">出去玩吗？</div>-->	
                                                            </div>
                                                  </div>
                                                  <div class="bcen_block">
                                                            <div class="bcen_block_face fl">
                                                                      <img src="common/img/face003.jpg"/>
                                                            </div>	
                                                            <div class="bcen_block_font fl">
                                                                      <div class="bcen_block_title">冰雪</div>
                                                                      <div class="bcen_block_fonts over">昵称：劳拉·克劳馥</div>	
                                                            </div>
                                                  </div>
                                                  <div class="bsea_first">群聊</div>
                                                  <div class="bcen_block">
                                                           
                                                  </div>
                                                
                                        
                                        </div>
                                        <script>
                                                            $(function (){
                                                                      var image_widths=$(".bcen_block_face").width();
                                                                      var image_heights=$(".bcen_block_face").height();
                                                                      var image_bis=image_widths/image_heights;
                                                                      $(".bcen_block_face img").each(function (){
                                                                                var images_widths=$(this).width();
                                                                                var images_heights=$(this).height();
                                                                                var images_bis=images_widths/images_heights;
                                                                                if(image_bis<images_bis){
                                                                                          $(this).css("height",image_heights);
                                                                                          var imgwidths=image_heights * images_bis;
                                                                                          var widthss= 0 - (imgwidths - image_widths) / 2;
                                                                                          $(this).css("margin-left",widthss);
                                                                                }else{
                                                                                          
                                                                                          var imgheights=image_widths / images_bis;	
                                                                                          var heightss=0 - (imgheights - image_heights) / 2;
                                                                                          $(this).css("margin-top",heightss);
                                                                                }
                                                                      })	
                                                            })				
                                                  </script>	
                                        
                              </div>
		</div>
		<!-- 中间功能列表-->
                    <!-- 右边好友详情 -->
                    <div class="buju_right fl">
                    	<div class="bri_top">
                              	<div class="bri_top_font fl">
                                        	创建群聊<br/>
                                        	
                                        	<input type="text" id="qname" placeholder="请输入群聊名称"/>
                                      		<input type="button" value="创建" id="create"/><br/>
                                      		<input type="text" id="qna" placeholder="请输入群聊名称"/>
                                      		<input type="button" value="加入" id="join"/>
                                        </div>
                                        
                                      
                                      	
                                      
                              </div>
                              
                              <div class="bri_detail" style="display:none;">
                              	<div class="bri_detail_one">
                                        	<div class="bri_deb_left fl">
                                                            <div class="bri_deb_name fl over" id="uname"></div>
                                                            <div class="bri_deb_sex fl">
                                                                      <img src="" id="sexImg"/>
                                                            </div>
                                                            <div class="bri_deb_sign fl" id="note"></div>
                                                            <div class="clear"></div>
                                                  </div>
                                                  <div class="bri_deb_face fr">
                                                  	<img src="" id="fimg" class="fimg"/>
                                                  </div>
                                        </div>	
                                        <div class="bri_detail_two">
                                        	<div class="bri_deb_one fl">备&nbsp;&nbsp;&nbsp;注</div>
                                                  <div class="bri_deb_two bri_deb_tip fl">
                                                  	<label>点击添加备注</label>
                                                            <input type="hidden" class="bri_deb_input"/>
					</div>
                                                  <div class="clear"></div>
                                                  <div class="bri_deb_one fl">年&nbsp;&nbsp;&nbsp;龄</div>
                                                  <div class="bri_deb_two fl" id="ag"></div>
                                                  <div class="clear"></div>
                                                  <div class="bri_deb_one fl">账&nbsp;&nbsp;&nbsp;号</div>
                                                  <div class="bri_deb_two fl" id="acc"></div>
                                        </div>
                                      <a href="javascript:sendMsg()">  <div class="bri_detail_but" >发消息</div></a>
                                      <a href="javascript:delFri()">  <div class="bri_detail_but" style="background-color: white;color: black">删除好友</div></a>
                              </div>
                              <script>
                          
                              function ok(ajax){
                            	  var result = ajax.responseText;
                            	  if(result == "1"){
                            		  alert("创建群聊成功");
                            		  
                            	  }
                              }
                              function deal200(ajax){
                        		  var result = ajax.responseText;
                            	  if(result == "1"){
                            		  alert("加入群聊成功");
                            		  
                            	  }
                        	  }
                              $(function(){
                            	  $("#create").click(function(){
                            		  var data = "qname="+$("#qname").val()+"&qaccount="+$("#hid").val();
                            		  $("#qname").val("")
                            		  myAjax("post","qchat/createq",data,true,"application/x-www-form-urlencoded",ok);
                            		  
                            	  });
                            	 
                            	  $("#join").click(function(){
                            		  var data = "qname="+$("#qna").val()+"&qaccount="+$("#hid").val();
                            		  $("#qna").val("")
                            		  myAjax("post","qchat/join",data,true,"application/x-www-form-urlencoded",deal200);
                            	  });
                              })
                              
                              function delFri(){
                            	  var flag = window.confirm("确定要删除该好友吗?")
                            	  if(flag){
                            		  var data = "account="+$("#hid").val()+"&fAccount="+$("#acc").html();
                                	  myAjax("post","friend/del",data,true,"application/x-www-form-urlencoded",succ);
                            	  }
                            	
                              }
                              var succ=function(ajax){
                            	  var reslut = ajax.responseText;
                            	  if(reslut == "1"){
                            		  alert("删除好友成功");
                            	  }else if(reslut == "0"){
                            		  alert("删除好友失败");
                            	  }
                              }
                              
                              function sendMsg(){
                            	  var data = "uname="+$("#uname").html()+"&account="+$("#acc").html();
                            	  window.location.href="http://localhost:8080/wxchat/chat.jsp?" + data;
                            	
                              }
                              
                              
                              
                              
				$(function (){
					var img_width = $(".bri_deb_face").width();
					var img_height = $(".bri_deb_face").height();
					var img_bi=img_width/img_height;
					$(".bri_deb_face img").each(function (){
						var imgs_width=$(this).width();
						var imgs_height=$(this).height();
						var imgs_bi=imgs_width/imgs_height;	
						if(img_bi < imgs_bi){
							$(this).css("height",img_height);
							var imgswidth = img_height * imgs_bi;
							var wid= 0 - (imgswidth - img_width) / 2;
							$(this).css("margin-left",wid);
						}else{
								
							var imgsheight=img_width / img_bi;
							var hei=0 - (imgsheight - img_height) / 2;
							$(this).css("margin-top",hei);
						}
					})	
				})				
			</script>	
		</div>
                    <!-- 右边好友详情 -->
                    
                    
                    <!-- 添加弹框 -->
                    <div class="yinyings" style="display:none;"></div>
                    <div class="buju_add" style="display:none;">
                    	<div class="ba_left fl">
                              	<div class="ba_left_seach">
                                        	<input type="text" class="fl" placeholder="搜索" value="" id="so" onchange="selFriend(this)"/>
                                                  <img class="ba_lefts_seach fr" src="common/img/seach.png"/>
                                                  <img class="ba_lefts_close fr" style="display:none;" src="common/img/close.png"/>
                                        </div>
                                        <div class="ba_left_fri">
                                        	<div class="ba_leftf_scroll" style="position:absolute;right:0px;display:none;"></div>	
                                                  <div class="ba_leftf_box">
                                                  	<div>
                                                            	<div class="ba_leftf_first"></div>
                                                            	<div class="ba_leftf_block">
                                                                      	<div class="ba_lfb_face fl">
                                                                                	<img src="" id="headImg" />
                                                                                </div>
                                                                                <div class="ba_lfb_font fl" id="user"></div>
                                                                                <div class="ba_lfb_circle fr"><img src="" id="circle"/></div>
                                                                      </div>
                                                    
                                                            </div>
                                                  </div>     
                                        </div>			
                              </div>	
                              <div class="ba_right fl">
                              	<div class="buju_add_close" onclick="addclose()"></div>
                              	<div class="ba_right_top">请勾选需要添加的联系人</div>
                                        <div class="ba_right_fri">
                                        	<div class="ba_rif_scroll" style="position:absolute;right:0px;display:none;"></div>
                                                  <div class="ba_rif_box">
                                                  	<div></div>
                                                  </div>	
                                        </div>
                                        <div class="ba_ri_exit fr" onclick="addclose()">取消</div>
                                        <div class="ba_ri_but fr" onclick="addFriend()">确定</div>
                                        <input type="hidden" id="hid" value="${user.account}"/>
                                        
                              </div>
                              
                              <script>
                             
				function friface(){
					var image_width=$(".ba_lfb_face").width();
					var image_height=$(".ba_lfb_face").height();
					var image_bi=image_width/image_height;
					$(".ba_lfb_face img").each(function (){
						images_width=$(this).width();
						var images_height=$(this).height();
						var images_bi=images_width/images_height;
						if(image_bi<images_bi){
							$(this).css("height",image_height);
							var imgwidth=image_height * images_bi;
							var widths= 0 - (imgwidth - image_width) / 2;
							$(this).css("margin-left",widths);
						}else{
							
							var imgheight=image_width / images_bi;	
							var heights=0 - (imgheight - image_height) / 2;
							$(this).css("margin-top",heights);
						}
					})	
				}				
			</script>
                    </div>
                    <!-- 添加弹框 -->
                    
                    
                    
                    
          </div>
	

</body>
</html>
 