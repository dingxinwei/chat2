<%@ page language="java" import="java.util.*,com.wx.service.*,com.wx.service.impl.*,com.wx.pojo.*,com.wx.util.*;" pageEncoding="utf-8"%>
<%-- 更新session中的数据--%>
<% 
	QChatService qservice = (QChatService) WebUtils.getBean("qchat");

	FriendService fservice = (FriendService) WebUtils.getBean("friend");
	User u =(User) session.getAttribute("user");
	if(u != null){
		Friends friends = fservice.selAllFriendsService(u.getAccount());
		if(friends!= null){
			session.setAttribute("friends", friends.getFriends());
		}
		List<QChat> qList = qservice.selAllQByAccountService(u.getAccount());
		if(null != qList){ 
			session.setAttribute("qList", qList);	
		}
	}
	
%>
<%-- 把查询到的群聊信息存放到session中--%>
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
<title>聊天</title>
<link rel="stylesheet" type="text/css" href="common/css/common.css"/>
<link rel="stylesheet" type="text/css" href="common/css/style.css"/>
<link rel="shortcut icon" type="image/x-icon" href="img/chatFlag.ico" />
<script type="text/javascript" src="common/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="common/js/seach.js"></script>
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
	font-size: 2px;
}
</style>

<script>

	$(function (){
		res();
		scrolls();
		chatscr();
		$(window).resize(function(){
			res();
			scrolls();
			chatscr();	
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
			$(".buju_install").height(winds - 61);
			$(".bcen_box").height(winds - 62);
			$(".buju_right").width(windw - 312);
			$(".bri_bottom").width(windw - 310);
			$(".brce_block_box").width(windw - 310);
			$("#editMsg").width(windw - 360);
			$(".bri_center").height(winds - 205);
			$(".brce_block_box").height(winds - 205);
		}
		
		$(".bcen_block").mouseenter(function (){
			$(this).not(".bcen_background").css("background-color","#ddd");	
		})
		$(".bcen_block").mouseleave(function (){
			$(this).not(".bcen_background").css("background-color","#e7e8e9");	
		})
		$(function(){
			var data = "rAccount="+$("#hid").val();
			myAjax("post","msgcache/select",data,true,"application/x-www-form-urlencoded",dealOk);
		})
		function dealOk(ajax){
			var msgnum = 1;
			var data = ajax.responseText;
			if(data.length != 2){
			if( data != undefined || data != null || data != ""){
				eval("var msg="+data);
				alert("aaaa")
			var apps_two = "</div></div></div><div class='clear'></div></div>";
			
			for(var i=0;i<msg.length;i++){
				var apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + msg[i].sAccount + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl'><div>";
				 
				if(!document.getElementById(msg[i].sAccount)){
	        		
	        		$(".brce_block_box").append("<div id='"+msg[i].sAccount+"'></div>");
	        		$("#"+msg[i].sAccount).css("display","none");
	        		
	        	}
				if(i != msg.length-1){
					if(msg[i].sAccount == msg[i+1].sAccount){
						msgnum++;
					}else{
						msgnum=1;
					}	
				}
				
				
				var sd = new Date(msg[i].sendTime);
				var nd = new Date();
				
				if(sd.getFullYear() == nd.getFullYear() && sd.getMonth() == nd.getMonth()){
					if(sd.getDate() == (nd.getDate()-1)){
						$("#t"+msg[i].sAccount).html("昨天");
					}else if(sd.getDate() == (nd.getDate()-2)){
						$("#t"+msg[i].sAccount).html("前天");
					}else if(sd.getDate() == nd.getDate()){
						var minutes = sd.getMinutes();
						if(sd.getMinutes()<10){
							minutes = "0"+minutes
						}
						$("#t"+msg[i].sAccount).html(sd.getHours()+":"+minutes);
					}else{
						
						$("#t"+msg[i].sAccount).html((sd.getMonth()+1)+"月"+sd.getDate()+"日");
					}
				}else if(sd.getFullYear() == nd.getFullYear() && sd.getMonth() != nd.getMonth()){
					$("#t"+msg[i].sAccount).html((sd.getMonth()+1)+"月"+sd.getDate()+"日");
				}else{
					$("#t"+msg[i].sAccount).html(sd.getFullYear()+"年"+(sd.getMonth()+1)+"月"+sd.getDate()+"日");
				}
				$("#b"+msg[i].sAccount).append("<div class='bcen_block_nums'>"+msgnum+"</div>");
				$("#"+msg[i].sAccount).append(apps_one + msg[i].message+ apps_two);
				$("#a"+msg[i].sAccount).html(msg[i].message);
				
			}
			
			
				var info = "rAccount="+$("#hid").val();
				myAjax("post","msgcache/delete",info,true,"application/x-www-form-urlencoded");
			}
		}	
	}
		$(".bcen_block").click(function (){
			msgNum=1;
			qmsgnum=1;
			$(this).removeAttr("style");
			$(this).addClass("bcen_background");
			$(".bcen_block").not(this).removeClass("bcen_background");
			$(this).find(".bcen_block_dian").css("display","none");
			$(this).find(".bcen_block_nums").css("display","none");
		})
		
		$(".bri_bottom div").focus(function (){
			$(".bri_bottom").css("background-color","#fff");
		})
		$(".bri_bottom div").blur(function (){
			$(".bri_bottom").css("background-color","#f5f5f5");
		})
		
		$(".bri_bottom_face").click(function (){	
			$(".bri_bottom_look").css("display","block");	
		})
		
		$(document).bind("click",function(e){
			//id为menu的是菜单，id为open的是打开菜单的按钮        
			if($(e.target).closest(".bri_bottom_look").length == 0 && $(e.target).closest(".bri_bottom_face").length == 0){
				//点击id为menu之外且id不是不是open，则触发
				$(".bri_bottom_look").css("display","none");
			}
        		})
		
		$(".bri_bottom_file").click(function (){
			$(".bri_bottom_files").click();	
		})
		var socket = new WebSocket("ws://localhost:8080/wxchat/chat?account="+$("#myAcc").val());//websocket连接
		var qSocket = new WebSocket("ws://localhost:8080/wxchat/qchat?account="+$("#myAcc").val());//websocket连接
		//发送消息
		//发送消息
		$(".bri_bottom_but").click(function (){
			
				
			
			var chats = $("#editMsg").html();
			
			var apps_one = "<div class='brce_right'><div class='brce_left_face fr'><img src='headImg/" + $("#myAcc").val() + ".jpg' class='fimg'/></div><div class='brce_left_talk fr'></div><div class='brce_rt_jiao fr'></div><div class='brce_rt_block fr'><div>";
			var apps_two = "</div></div></div><div class='clear'></div></div>";
			var d = new Date();
			var st = d.getHours()+":";
			var minutes = d.getMinutes();
			if(minutes < 10){
				minutes = "0"+minutes
			}
			st = st + minutes;
			if(chats == ""){
				$(".bri_bottom_empty").css("display","block");
				setTimeout(function () {$(".bri_bottom_empty").hide();}, 2000)
			}else{
				
				$("#"+$("#acc").val()).append(apps_one + chats + apps_two);
				if($("#chatFlag").val() == "1"){//单聊消息
					if($("#u"+$("#acc").val()).val() == "yes"){//用户在线直接发送
						
						socket.send("@"+$("#acc").val()+":"+st+"@"+chats);
					}else{//用户离线则把消息存储到数据库中
						var date = new Date();
						var sendtime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+ date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
						
						var data = "rAccount="+$("#acc").val()+"&sAccount="+$("#hid").val()+"&message="+chats+"&sendTime="+sendtime;
						
						myAjax("post","msgcache/insert",data,true,"application/x-www-form-urlencoded");
					}
				}else{//群聊消息
					qSocket.send("@"+$("#uname").html()+";"+$("#hidName").val()+":"+st+"@"+chats);
				}
				
				$("#editMsg").html("");
					
			}
		})
		$("#sendFile").click(function(){
			
			$("#chatFile").change(uploadFile);
		})
		var flag = false;
		qSocket.onclose=function(){
			qSocket=new WebSocket("ws://localhost:8080/wxchat/qchat?account="+$("#myAcc").val());//websocket连接
		}
      		var qmsgnum = 1;
      	qSocket.onmessage=function(info){
			var msg = info.data;
			
			var index1 = msg.indexOf(";");
			var index2 = msg.indexOf(":");
			var index3 = msg.indexOf("@");
			var stime = msg.substring(index2+1,index3);
			
			var acc = msg.substring(0,index1);
			var qnickName = msg.substring(index1+1,index2);
			var lmsg = msg.substring(index3+1,msg.length);
			
			var apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='common/img/face001.jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_name'>"+qnickName+"</div><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl'><div>";
			var apps_two = "</div></div></div><div class='clear'></div></div>";
			if(!document.getElementById(acc)){
        		
        		$(".brce_block_box").append("<div id='"+acc+"'></div>");
        		$("#"+acc).css("display","none");
        	}
			$("#t"+acc).html(stime);
			$("#"+acc).append(apps_one + lmsg + apps_two);
			$("#a"+acc).html(lmsg);
			if(flag){
				$("#b"+acc).append("<div class='bcen_block_dian'></div>");
			}else{
				$("#b"+acc).append("<div class='bcen_block_nums'>"+(qmsgnum++)+"</div>");
			}
			
			if($("#acc").val() == acc){
				
				$("#b"+acc).find(".bcen_block_nums").css("display","none");
			}
		}
      	function uploadFile(){
      		var formData = new FormData();
      		formData.append('file',$('#chatFile')[0].files[0]);
      		 myAjax("post","uploadFile",formData,true,undefined,dealReslut); 
      	}
		var dealReslut = function(ajax){
      		var fileName  = ajax.responseText;
      		
      		var msg = "<a href='downloadFile?fileName="+fileName+"' style='margin-left:50px;color:black'>下载</a>"
      		var index = fileName.indexOf(".");
      		var filetype = fileName.substring(index+1,fileName.length);
      		var logo;
      		var lastMsg;
      		if(filetype == "doc" || filetype == "docx"){
      			logo = "<img src='common/img/word.png' >"+fileName;
      			lastMsg = logo+msg;
      		}else if(filetype == "png" || filetype == "jpg" || filetype == "jpeg"){
      			logo = "<img src='chatFile/" + fileName + "' >";
      			lastMsg = logo;
      		}else if(filetype == "xlsx" || filetype == "xls"){
      			logo = "<img src='common/img/excel.png' >"+fileName;
      			lastMsg = logo+msg;
      		}else if(filetype == "pptx" || filetype == "ppt"){
      			logo = "<img src='common/img/ppt.png' >"+fileName;
      			lastMsg = logo+msg;
      		}else{
      			logo = "<img src='common/img/donot.png' >"+fileName;
      			lastMsg = logo+msg;
      		}
      		 
      		var apps_one = "<div class='brce_right'><div class='brce_left_face fr'><img src='headImg/" + $("#myAcc").val() + ".jpg' class='fimg'/></div><div class='brce_left_talk fr'><div class='brce_rt_jiao fr'></div><div class='brce_rt_block fr' style='background-color:rgb(245,245,245);border:solid 1px black;'><div>";
			var apps_two = "</div></div></div><div class='clear'></div></div>";
			if(filetype == "png" || filetype == "jpg" || filetype == "jpeg"){
				apps_one = "<div class='brce_right'><div class='brce_left_face fr'><img src='headImg/" + $("#myAcc").val() + ".jpg' class='fimg'/></div><div class='brce_left_talk fr'><div class='brce_rt_jiao fr'></div><div class='brce_rt_block fr' style='background-color:rgb(245,245,245);border:none;'><div>";
			}
			$("#"+$("#acc").val()).append(apps_one + lastMsg + apps_two);
			
			socket.send("@%"+$("#acc").val()+":"+ fileName);
			return;
      	}
		
		socket.onclose=function(){
			socket = new WebSocket("ws://localhost:8080/wxchat/chat?account="+$("#myAcc").val());//websocket连接
		}
		var msgNum = 1;
	
		socket.onmessage=function(info){
			var msg = info.data;
			
			var index = msg.indexOf(":");
			var index1 = msg.indexOf("@");
			var acc;
			var stime = msg.substring(index+1,index1);
			var lmsg = msg.substring(index1+1,msg.length);
			
			var apps_one;
			var apps_two = "</div></div></div><div class='clear'></div></div>";
			if(msg.indexOf("%") == 0){//文件消息
				acc = msg.substring(1,index);
				lmsg = msg.substring(index+1,msg.length);
				apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl'><div>";
				var inde = lmsg.indexOf(".");
				var fileType = lmsg.substring(inde + 1 , lmsg.length);
				var a = "<a href='downloadFile?fileName="+lmsg+"' style='margin-left:50px;color:black'>下载</a>"
				var logo;
				
	      		if(fileType == "doc" || fileType == "docx"){
	      			logo = "<img src='common/img/word.png' >"+lmsg;
	      			$("#a"+acc).html("[文档]"+lmsg);//显示消息到消息提示框
	      			lmsg = logo  + a;
	      			apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl' style='background-color:rgb(245,245,245);border:solid 1px black;'><div>";
	      			
	      		}else if(fileType == "png" || fileType == "jpg" || fileType == "jpeg"){
	      			logo = "<img src='chatFile/" + lmsg + "' >";
	      			lmsg = logo;
	      			
	      			apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl' style='background-color:rgb(245,245,245);border:none'><div>";
	      			$("#a"+acc).html("[图片]");//显示消息到消息提示框
	      		}else if(fileType == "pptx" || fileType == "ppt"){
	      			logo = "<img src='common/img/ppt.png' >"+lmsg;
	      			$("#a"+acc).html("[幻灯片]"+lmsg);//显示消息到消息提示框
	      			lmsg = logo  + a;
	      			apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl' style='background-color:rgb(245,245,245);border:solid 1px black;'><div>";
	      			
	      		}else if(fileType == "xlsx" || fileType == "xls"){
	      			logo = "<img src='common/img/excel.png' >"+lmsg;
	      			$("#a"+acc).html("[表格]"+lmsg);//显示消息到消息提示框
	      			lmsg = logo  + a;
	      			apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl' style='background-color:rgb(245,245,245);border:solid 1px black;'><div>";
	      			
	      		}else{
	      			logo = "<img src='common/img/donot.png' >"+lmsg;
	      			$("#a"+acc).html("[文件]"+lmsg);//显示消息到消息提示框
	      			lmsg = logo  + a;
	      			apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl' style='background-color:rgb(245,245,245);border:solid 1px black;'><div>";
	      		}
	    
			
			}else{//字符消息
				acc = msg.substring(0,index);
				apps_one = "<div class='brce_left'><div class='brce_left_face fl'><img src='headImg/" + acc + ".jpg' class='fimg'/></div><div class='brce_left_talk fl'><div class='brce_lt_jiao fl'></div><div class='brce_lt_block fl'><div>";
				$("#a"+acc).html(lmsg);//显示消息到消息提示框
				$("#t"+acc).html(stime);//显示发送时间
			}
			
			if(!document.getElementById(acc)){
        		$(".brce_block_box").append("<div id='"+acc+"'></div>");
        		$("#"+acc).css("display","none");
        	}
			$("#u"+acc).val("yes");
			$("#"+acc).append(apps_one + lmsg + apps_two);
			$(".bleft_iconnum").css("display","block");
	
			$(".bleft_iconnum").html(msgNum);
			
			if(flag){
				$("#b"+acc).append("<div class='bcen_block_dian'></div>");
			}else{
				$("#b"+acc).append("<div class='bcen_block_nums'>"+(msgNum++)+"</div>");
			}
			
			if($("#acc").val() == acc){
				
				$("#b"+acc).find(".bcen_block_nums").css("display","none");
			}
		}
		//单击资料
		$(".bri_top_more").click(function (){
		
			
			$("#qname").html($("#uname").html());
			$("#hidqname").val($("#uname").html());
			var oldName = $("#uname").html();

			$(".bin_four").css("display","block");
			$(".bin_five").css("display","block");
			$(".bin_six").css("display","block");
			$("#selResult").css("display","none");
			$(".bin_three input").val("");
			$("#hidqname").change(function(){
				if($("#qFlag").val() == "0"){
					
					var data = "oldName="+oldName+"&newName="+$("#hidqname").val();
					
					myAjax("post","qchat/updateQName",data,"true","application/x-www-form-urlencoded");
				}else{
					$("#uname").html(oldName);
					$("#hidqname").val(oldName);
				}
			})
		
			var bl = $(".buju_install").css("display");
			if($("#chatFlag").val() == "1"){//单聊
				$(".bin_one").css("display","block");
				$(".bin_four_box").css("display","none");
				$("#friname").html($("#uname").html());
				var imgurl = "headImg/" + $("#acc").val() + ".jpg";
				$("#friImg").attr("src",imgurl);
				$("#friImg").attr("height","100%");
			}else if($("#chatFlag").val() == "0"){//群聊
				var data = "qname=" + $("#uname").html();
				myAjax("post","qchat/selAllQ",data,true,"application/x-www-form-urlencoded",dealSuccess);
				$(".bin_four_box").css("display","block");
				$(".bin_one").css("display","none");
			}else{
				$(".bin_four_box").css("display","none");
				$(".bin_one").css("display","none");
			}
			
			if(bl == "block"){
				$(".buju_install").css("display","none");	
			}else if(bl == "none"){
				$(".buju_install").css("display","block");	
			}	
		})
		//处理服务器返回的数据
		function dealSuccess(ajax){
			var data = ajax.responseText;
			if(data != undefined || data != null){
				eval("var allUser="+data);
			}
			$(".bin_four").html("");
			for(var i=0;i<allUser.length;i++){
				$(".bin_four").append("<div class='fl'><div class='bin_one_face'><img src='headImg/"+allUser[i].qAccount+".jpg' style='width:100%;height:100%'/></div> <div class='bin_four_name over'>"+allUser[i].qNickname+"</div></div>");
			}
			$(".bin_four").append("<div class='clear'></div><div class='bin_four_more'><label>查看更多群成员</label> <img src='common/img/down001.png'/></div><div class='bin_four_border'></div>");
			
            
            
		}
		$(".bin_two_but").click(function (){
			var imgs = $(this).find("img").attr("src");
			imgs = imgs.replace("common/img/","");
			imgs = imgs.replace(".png","");
			if(imgs == "butclose"){
				$(this).find("img").attr("src","common/img/butopen.png");
				flag = true;
				if($("#chatFlag").val() == "1"){
					$("#f"+$("#acc").val()).css("display","block");	
				}else{
					$("#f"+$("#uname").html()).css("display","block");	
				}
			}else if(imgs == "butopen"){
				$(this).find("img").attr("src","common/img/butclose.png");	
				flag = false;
				if($("#chatFlag").val() == "1"){
					$("#f"+$("#acc").val()).css("display","none");	
				}else{
					$("#f"+$("#uname").html()).css("display","none");	
				}
			}	
		})
		
		$(".bin_three input").focus(function (){
			$(".bin_three").css("background-color","#fff");
		})
		
		$(".bin_three input").keyup(function (){
			var val = $(this).val();
		
			if(val == ""){
				$(".bin_three_close").css("display","none");
				$(".bin_three_seach").css("display","block");
			}else if(val != ""){
				$(".bin_three_close").css("display","block");
				$(".bin_three_seach").css("display","none");
			}
		})
		//查询群成员
		$(".bin_three input").change(function(){
			var val = $(this).val();
			var data = "nickname="+val+ "&qname=" + $("#uname").html();
			myAjax("post","qchat/searchQmem",data,true,"application/x-www-form-urlencoded",dealSearch);
		})
		function dealSearch(ajax){
			var data = ajax.responseText;
			
			$(".bin_four").css("display","none");
			$(".bin_five").css("display","none");
			$(".bin_six").css("display","none");
			if(data != undefined || data != null || data != ""){
				eval("var obje="+data);
				$("#selResult").css("display","block");
				$("#selResult").html("<div class='bcen_block'><div class='bcen_block_face fl'><img src='headImg/"+obje.qAccount+".jpg' style='width:100%;height:100%'/></div><div class='bcen_block_font fl'><div class='bcen_block_title' style='line-height:40px;'>"+obje.qNickname+"</div></div> </div>");
			}
		}
		$(".bin_three_close").click(function (){
			$(".bin_three input").val("");
			$(".bin_three_close").css("display","none");
			$(".bin_three_seach").css("display","block");
			$(".bin_three").css("background-color","#f5f5f5");
		});
		
		$(".bin_four_more").click(function (){
			var hts = $(this).find("label").html();	
			if(hts == "查看更多群成员"){
				$(this).find("label").html("收起群成员");	
				$(this).find("img").attr("src","common/img/up001.png");	
			}else if(hts == "收起群成员"){
				$(this).find("label").html("查看更多群成员");	
				$(this).find("img").attr("src","common/img/down001.png");	
			}
		})
		
		$(".bin_five_text").mouseenter(function (){
			$(this).next("img").css("display","block");	
		})
		
		$(".bin_five_text").mouseleave(function (){
			$(this).next("img").css("display","none");	
		})
		
		$(".bin_five_text").click(function (){
			$(this).next("input").attr("type","text");
			$(this).css("display","none");
			$(this).next("input").focus();
		})
		
		$(".bin_five_text").next("input").blur(function (){
			var bin = $(this).val();
			if(bin != ""){
				$(this).prev(".bin_five_text").html(bin);
			}
			$(this).prev(".bin_five_text").css("display","block");
			$(this).attr("type","hidden");
		})
		
		$(".bin_five_text").eq(0).next("input").blur(function (){
			var bin = $(this).val();
			$(".bri_top_font").html(bin);
		})
		
		$(".bin_five_butname").click(function (){
			var imgs = $(this).attr("src");
			imgs = imgs.replace("common/img/","");
			imgs = imgs.replace(".png","");
			if(imgs == "butclose"){
				$(this).attr("src","common/img/butopen.png");
				$(".brce_lt_name").css("display","block");		
			}else if(imgs == "butopen"){
				$(this).attr("src","common/img/butclose.png");
				$(".brce_lt_name").css("display","none");			
			}	
		})
		
		$(".bin_five_but").click(function (){
			
			var imgs = $(this).attr("src");
			imgs = imgs.replace("common/img/","");
			imgs = imgs.replace(".png","");
			if(imgs == "butclose"){
				$(this).attr("src","common/img/butopen.png");
				flag = true;
				if($("#chatFlag").val() == "1"){
					$("#f"+$("#acc").val()).css("display","block");	
				}else{
					$("#f"+$("#uname").html()).css("display","block");	
				}
				
			}else if(imgs == "butopen"){
				$(this).attr("src","common/img/butclose.png");	
				flag = false;
				if($("#chatFlag").val() == "1"){
					$("#f"+$("#acc").val()).css("display","none");	
				}else{
					$("#f"+$("#uname").html()).css("display","none");	
				}
			}	
		})
		
		$(".bin_five_note").click(function (){
			
			$(".bin_note").css("display","block");	
		})
		$("#qNote").click(function (){
			
			$(".bin_note").css("display","block");	
		})
		$(".bin_note_close").click(function (){
			$(".bin_note").css("display","none");	
		})
		
	})
		
      
      
</script>
<body>
	<div class="buju">
          	<!-- 最左侧功能图标 -->
          	<div class="buju_left fl">
                    	<div class="bleft_face fl">
                    		<input type="hidden" id="myAcc" value="${user.account}"/>
                              	<img src="" class="headImg"/>		
                              </div>
                              <div class="bleft_iconone fl">
                              	<a href="chat.jsp"><img src="common/img/chat011.png" width="100%"/></a>
                              </div>
                              <div class="bleft_iconnum" style="display:none"></div>
                              <div class="bleft_iconone fl">
                              	<a href="friends.jsp"><img src="common/img/chat020.png" width="100%"/></a>
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
			})				
		</script>
                    <!-- 最左侧功能图标 -->
                    <!-- 中间消息列表-->
                    <div class="buju_center fl">
                    	<div class="bcen_seach fl">
                              	<div class="bcen_seach_font fl">搜索</div>
                              	<input type="text" style="display:none;" class="fl" id="seachFri"/>
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
                                             <c:forEach items="${friends}" var="f">
                                             	
                                                   <div class="bcen_block" id="b${f.account}">
                                                            <div class="bcen_block_face fl">
                                                                      <img src="headImg/${f.account}.jpg" class="fimg" alt="图片加载失败"/>
                                                            </div>	
                                                            
                                                            <div class="bcen_block_font fl">
                                                                      <div class="bcen_block_title">${f.nickname}</div>
                                                                      <input type="hidden" value="${f.account}"/>
                                                                      <input type="hidden" value="1"/><!-- 区分群聊和单聊的标记 1代表单聊 -->
                                                                      <input type="hidden" value="${f.online}" id="u${f.account}"/><!-- 区分在线和离线 no代表离线   yes代表在线 -->
                                                                      <div class="bcen_block_fonts over" id="a${f.account}"></div>	
                                                            </div>
                                                            <div class="bcen_block_right fr">
                                                                      <div class="bcen_block_time" id="t${f.account}"></div>
                                                                     <div class="bcen_block_note fr" id="f${f.account}" style="display: none">
                                                                                <img src="common/img/nonote.png" width="100%"/>
                                                                      </div>
                                                            </div>
                                                  </div>
                                                  </c:forEach>
                                                  <c:forEach items="${qList}" var="q">
                                                  		 <div class="bcen_block" id="b${q.qName}">
                                                            <div class="bcen_block_face fl">
                                                                      <img src="common/img/face003.jpg" class="fimg"/>
                                                            </div>	
                                                            
                                                            <div class="bcen_block_font fl">
                                                                      <div class="bcen_block_title">${q.qName}</div>
                                                                      <input type="hidden">
                                                                      <input type="hidden" value="0"/><!-- 区分群聊和单聊的标记 0代表群聊 -->
                                                                      <div class="bcen_block_fonts over" id="a${q.qName}"></div>
                                                                      	<input type="hidden" value="${q.qFlag}"/>
                                                                      	<input type="hidden" value="${q.qNote}"/>
                                                                      	<input type="hidden" value="${q.qNickname}"/>
                                                            </div>
                                                            <div class="bcen_block_right fr">
                                                                      <div class="bcen_block_time" id="t${q.qName}"></div>
                                                                     <div class="bcen_block_note fr" id="f${q.qName}" style="display: none">
                                                                                <img src="common/img/nonote.png" width="100%" />
                                                                      </div>
                                                            </div>
                                                  </div>
                                                  </c:forEach>
                                                  
                                               </div>
                                                  <script>
                                                  var obj;
                                                  $("#seachFri").change(function(){
                                                	  $("#friend").html("");
                                                	  var data = "name="+$("#seachFri").val()+"&account="+$("#hid").val();
                                                	  myAjax("post","friend/selByName",data,true,"application/x-www-form-urlencoded",seachSuccess);
                                                  })
                                                  function sendMessage(i){
                                                	  $("#uname").html(obj[i].nickname);
                                                	  $("#acc").val(obj[i].account);
                                                	  $("#chatFlag").val("1");
                                                	  $(".bcen_block").css("background-color","#c9c8c8");
                                                  }
                                                  var seachSuccess = function(ajax){
                                                	  var result = ajax.responseText;
                                                	if(result != ""){
                                                		eval("obj="+result);

                                                   	 for(var i=0;i<obj.length;i++){
                                                   		
                                                   		 	$("#friend").append("<div class='bcen_block' onmousemove='addBackground("+this+")' onmouseout='rmBackground("+this+")' onclick='sendMessage("+i+")'><div class='bcen_block_face fl'><img src='headImg/"+obj[i].account+".jpg' style='width:100%;height:100%'/></div><div class='bcen_block_font fl'><div class='bcen_block_title' style='line-height:40px;'>"+obj[i].nickname+"</div></div> </div>");
                                                   		 
                                                   	 }
                                                   	 
                                                	}     
                                                	
                                                  }
                                                 
                                                  function addBackground(obj){
                                                	  obj.style="background-color:#ddd";
                                                	 
                                                  }
												function rmBackground(obj){
													obj.style="background-color:#e7e8e9";
												
                                                  }
                                                  
                                                  
                                                    $(".bcen_block").click(function(){
                                                    	
                                                    	$(".bleft_iconnum").css("display","none");
                                                    	var arr = this.childNodes;
                                                    	var arr2 = arr[3].childNodes;
                                                    	//单聊
                                                    	if(arr2[5].value == "1"){
                                                    		$("#uname").html(arr2[1].innerHTML);
                                                    		
                                                        	$("#acc").val(arr2[3].value);
                                                        	$("#chatFlag").val(arr2[5].value);
                                                       
                                                        	$("#onlineFlag").val(arr2[8].value);
                                                        	$(".brce_block_box").children("div").css("display","none");
                                                        	$("#videoFlag").css("display","block");
                                                        	
                                                        	if(!document.getElementById($("#acc").val())){
                                                        		
                                                        		$(".brce_block_box").append("<div id='"+$("#acc").val()+"'></div>");
                                                        	}
                                                        	document.getElementById($("#acc").val()).style="display";
                                                    	}else{//群聊
                                                    		$("#videoFlag").css("display","none");
                                                    		
                                                    		$("#uname").html(arr2[1].innerHTML);
                                                    		$("#acc").val(arr2[1].innerHTML);
                                                    		$("#chatFlag").val(arr2[5].value);
                                                    		$("#qFlag").val(arr2[10].value);
                                                    		
                                                			$(".over3").html(arr2[12].value);
                                                			$(".bin_nd_detail").html(arr2[12].value);
                                                			$("#note").val(arr2[12].value);
                                                    		$(".brce_block_box").children("div").css("display","none");
                                                    		$("#nickName").html(arr2[14].value);
                                                    		$("#hidName").val(arr2[14].value);
															if(!document.getElementById($("#acc").val())){
                                                        		
                                                        		$(".brce_block_box").append("<div id='"+$("#acc").val()+"'></div>");
                                                        	}
                                                        	document.getElementById($("#acc").val()).style="display";
                                                    	}
                                                    	
                                                    })
                                                  
                                                  
                                                  
                                                  
                                                  
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
                                                                                          $(this).css("width","100%");	
                                                                                          var imgheights=image_widths / images_bis;	
                                                                                          var heightss=0 - (imgheights - image_heights) / 2;
                                                                                          $(this).css("margin-top",heightss);
                                                                                }
                                                                      })	
                                                            })				
                                                  </script>	
                                                  <div class="bcen_jilu" style="display:none;" id="friend">
                                        	
                                                 
                                                 
                                                  
                                        
                                        </div>
                                        </div>	
                                        
                                        
                                        
                              </div>
		</div>       
                    <!-- 中间消息列表-->
                    <!-- 右边对话框 -->
                    <div class="buju_right fl">
                    	<div class="bri_top">
                              	<div class="bri_top_font fl" id="uname">
                                        	${param.uname}
                                        	
                                        </div>
                                        <input type="hidden" id="acc" value="${param.account}"/>
                                        <input type="hidden" value="" id="chatFlag"><!-- 区分群聊和单聊 -->
                                         <input type="hidden" value="" id="qFlag"><!-- 群聊标记 区分群主和普通群成员 -->
                                          <input type="hidden" value="" id="onlineFlag"><!-- 区分在线的标记 -->
                                        <div class="bri_top_more fr"></div>
                                        <div class="clear"></div>
                              </div>
                              
                              <div class="bri_center" >
                              	<div class="bri_center_scroll" style="display:none;"></div>
                                        <div class="bri_center_block">
                                        	<div class="brce_block_box">
                                        	
                                        	
                                        	
                                        	
                                                  </div>
                                        </div>
                              </div>
                              
               <script>
				 $(function(){
					 $(".bri_blook_center div").click(function(){
						
						 $("#editMsg").html($("#editMsg").html()+this.innerHTML);
						 $("#editMsg").click();
					 })
				 })
					
			</script>	
                    	<div class="bri_bottom">
                              	<div class="bri_bottom_face fl" title="表情"></div>
                                        <div class="bri_bottom_look" style="display:none;">
                                        	<div class="bri_blook_center">
                                                            <div class="fl">
                                                                      <img src="common/img/look001.png" title="微笑"/>	
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look002.png" title="撇嘴"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look003.png" title="色"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look004.png" title="发呆"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look005.png" title="得意"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look006.png" title="流泪"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look007.png" title="害羞"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look008.png" title="闭嘴"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look009.png" title="睡"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0010.png" title="大哭"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0011.png" title="尴尬"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0012.png" title="发怒"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0013.png" title="调皮"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0014.png" title="龇牙"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0015.png" title="惊讶"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0016.png" title="爱心"/>	
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0017.png" title="傲慢"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0018.png" title="白眼"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0019.png" title="菜刀"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0020.png" title="大兵"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0021.png" title="奋斗"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0022.png" title="憨笑"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0023.png" title="坏笑"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0024.png" title=饥饿/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0025.png" title="惊恐"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0026.png" title="可爱"/>
                                                            </div>
                                                            
                                                            <div class="fl">
                                                                      <img src="common/img/look0028.png" title="可怜"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0029.png" title="酷"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0030.png" title="困"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0031.png" title="篮球"/>	
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0032.png" title="泪奔"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0033.png" title="冷汗"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0034.png" title="流汗"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0035.png" title="难过"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0036.png" title="啤酒"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0037.png" title="闪电"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0038.png" title="偷笑"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0039.png" title="吐"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0040.png" title="西瓜"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0041.png" title="斜眼笑"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0042.png" title="疑问"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0043.png" title="月亮"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0044.png" title="炸弹"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0045.png" title="晕"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0046.png" title="咒骂"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0047.png" title="抓狂"/>
                                                            </div>
                                                             <div class="fl">
                                                                      <img src="common/img/look0048.png" title="卖萌"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0049.png" title="眨眼睛"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0050.png" title="惊喜"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0051.png" title="小纠结"/>
                                                            </div>
                                                             <div class="fl">
                                                                      <img src="common/img/look0052.png" title="敲打"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0053.png" title="太阳"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0054.png" title="再见"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0055.png" title="哈欠"/>
                                                            </div>
                                                              <div class="fl">
                                                                      <img src="common/img/look0056.png" title="喷血"/>
                                                            </div>
                                                             <div class="fl">
                                                                      <img src="common/img/look0057.png" title="鼓掌"/>
                                                            </div>
                                                             <div class="fl">
                                                                      <img src="common/img/look0058.png" title="笑哭"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0059.png" title="衰"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0060.png" title="红包"/>
                                                            </div>
                                                            <div class="fl">
                                                                      <img src="common/img/look0061.png" title="棒棒糖"/>
                                                            </div>
					</div>  
                                        </div>
                                        <div class="bri_bottom_file fl" title="发送文件" id="sendFile"></div>
                                        <form enctype="multipart/form-data">
                                       		 <input type="file" class="bri_bottom_files" id ="chatFile" style="display:none;"　name="file"/>
                                        </form>
                                        <a href="javascript:videoChat()"><div class="bri_bottom_iphone fr" id="videoFlag" title="视频聊天" style="display:none"></div></a>
                                        <div class="clear"></div>
                                        <div id="editMsg" contenteditable="true" style="overflow:auto;font-size: 17px"></div>
                                        <div class="bri_bottom_but fr">发送</div>
                                        <div class="bri_bottom_empty" style="display:none;">不能发送空白信息</div>
                              </div>
                    </div>
                    <!-- 右边对话框 -->
                    <!-- 最右设置框 -->
                    <div class="buju_install fr" style="display:none;">
                    	
                    	    <!-- 单聊设置 -->
                    	<div class="bin_one">
                              	<div class="bin_one_face">
                                        	<img src="" id="friImg"/>
                                        </div>
                                        <div class="bin_one_name over" id="friname"></div>
                                        <div class="bin_two">
                              	<div class="bin_two_font">消息免打扰</div>
                                        <div class="bin_two_but">
                                        	<img src="common/img/butclose.png"/>
                                        </div>
                              </div>
                              </div>
                              
                          
                              <!-- 群聊设置 -->
                              <div class="bin_four_box">
                              	<div>
                                        <div class="bin_three">
                                                  <input type="text" placeholder="搜索群成员" class="fl"/>
                                                  <img src="common/img/seach.png" class="bin_three_seach fr"/>
                                                  <img src="common/img/close.png" class="bin_three_close fr" style="display:none"/>
                                        </div>
                                        <div id="selResult"></div>
                              	<div class="bin_four">
                                                            
                                                            
                                                            
                                                            
                              		</div>
                                                  <!-- 群聊设置 -->
                                                  <script>
                                                  	
                                                  function videoChat(){
                                                	  var data = "faccount="+$("#acc").val();
                                                	  window.location.href="http://localhost:8080/wxchat/video.jsp?" + data;
                                                  }
                                                  
                                                  
                                                            $(function (){
                                                                      var iw = $(".bin_one_face").width();
                                                                      var ih = $(".bin_one_face").height();
                                                                      var ib = iw/ih;
                                                                      $(".bin_one_face img").each(function (){
                                                                                var isw=$(this).width();
                                                                                var ish=$(this).height();
                                                                                var isb=isw/ish;
                                                                                if(ib<isb){
                                                                                          $(this).css("height",ih);
                                                                                          var iwi=ih * isb;
                                                                                          var ws= 0 - (iwi - iw) / 2;
                                                                                          $(this).css("margin-left",ws);
                                                                                }else{
                                                                                          $(this).css("width","100%");	
                                                                                          var ihe=iw / isb;	
                                                                                          var hs=0 - (ihe - ih) / 2;
                                                                                          $(this).css("margin-top",hs);
                                                                                }
                                                                                          
                                                                      })
                                                            })
                                                            function updateNote(){
			                                                	  $("#note").val($(".bin_nd_detail").html());
			                                                		$(".bin_nd_detail").attr("contenteditable","true");
			                                                		$("#note").attr("type","text");
			                                                		$(".bin_nd_detail").css("display","none");
			                                                		$("#note").change(function(){
			                                                			var data = "note="+$("#note").val()+"&qName="+$("#uname").html();
			                                                			//仅群主可修改
			                                                			if($("#qFlag").val() == "0"){
			                                                				
			                                                				myAjax("post","qchat/updateQNote",data,"true","application/x-www-form-urlencoded");
			                                                				$(".bin_nd_detail").html($("#note").val());
			                                                				$(".over3").html($("#note").val());
			                                                			}
			                                                			$("#note").attr("type","hidden");
			                                                			$(".bin_nd_detail").css("display","block");
			                                                			
			                                                		})
			                                                		$("#note").blur(function(){
			                                                			$("#note").attr("type","hidden");
			                                                			$(".bin_nd_detail").css("display","block");
			                                                		}) 
                                                 		 }
                                                  </script>
                                                  <div class="bin_five">
                                                  	<p>群名</p>
                                                            <div class="bin_five_text fl" id="qname"></div>
                                                            <input type="hidden" value="" class="bin_five_name" id="hidqname"/>
                                                            <img src="common/img/edit.jpg" class="fl" style="display:none;"/>
                                                            <div class="clear"></div>
                                                            <p id="qNote">群公告</p>
                                                            <div class="bin_five_note over3"></div>
                                                            <p id="myName">我在本群的昵称</p>
                                                            <div class="bin_five_text fl" id="nickName"></div>
                                                            <input type="hidden" value="" class="bin_five_name" id="hidName"/>
                                                            <img src="common/img/edit.jpg" class="fl" style="display:none;"/>
                                                            <div class="clear"></div>
                                                            <p >显示群成员昵称</p>
                                                            <img class="bin_five_butname" src="common/img/butopen.png"/>
                                                            <p>消息免打扰</p>
                                                            <img class="bin_five_but" src="common/img/butclose.png"/>
                                                  </div>
                                                  <a href="javascript:void(0)"><div class="bin_six">退出群聊</div></a>
                                                  <div class="bin_note" style="display:none;">
                                                  	<div class="bin_note_title fl">群公告</div>
                                                            <div class="bin_note_close fr" title="关闭"></div>
                                                            <div class="clear"></div>
                                                            <div class="bin_note_detail">
                                                            	<div class="bin_nd_face fl">
                                                                      	<img src="common/img/face003.jpg"/>
                                                                      </div>	
                                                                     
                                                                      <div class="clear"></div>
                                                                      <p onclick="updateNote()">群公告</p>
                                                                      <div class="bin_nd_detail"></div>
                                                                  		<input type="hidden" value="" id="note">
                                                                      <div class="bin_nd_warn">————— 仅群主可编辑 —————</div>
                                                            </div>
                                                  </div>
                                                  <script>
                                                  $(".bin_six").click(function(){
                                                	  var data = "account="+$("#hid").val()+"&qName="+$("#uname").html();
                                                	  myAjax("post","qchat/outQ",data,true,"application/x-www-form-urlencoded",deleteSuccess);

                                                  })
                                                  var deleteSuccess = function(ajax){
                                                	var result =  ajax.responseText;
                                                	if(result == "1"){
                                                		$(".bin_four_box").css("display","none");
                                                	}
                                                  }
                                                  $("#myName").click(function(){
                                                	  $("#hidName").attr("type","text");
                                                  })
                                                  $("#hidName").change(function(){
                                                	  var data = "qNickname="+$("#hidName").val()+"&qName="+$("#uname").html()+"&qAccount="+$("#hid").val();
                                                	  myAjax("post","qchat/updateNickname",data,true,"application/x-www-form-urlencoded");
                                                  })
                                                  	$(".bin_nd_detail").click(updateNote);
                                                            $(function (){
                                                                      var iw = $(".bin_nd_face").width();
                                                                      var ih = $(".bin_nd_face").height();
                                                                      var ib = iw/ih;
                                                                      $(".bin_nd_face img").each(function (){
                                                                                var isw=$(this).width();
                                                                                var ish=$(this).height();
                                                                                var isb=isw/ish;
                                                                                if(ib<isb){
                                                                                          $(this).css("height",ih);
                                                                                          var iwi=ih * isb;
                                                                                          var ws= 0 - (iwi - iw) / 2;
                                                                                          $(this).css("margin-left",ws);
                                                                                }else{
                                                                                          $(this).css("width","100%");	
                                                                                          var ihe=iw / isb;	
                                                                                          var hs=0 - (ihe - ih) / 2;
                                                                                          $(this).css("margin-top",hs);
                                                                                }
                                                                                          
                                                                      })
                                                            })
                                                  </script>
				</div>
			</div>
                    </div>
                    <!-- 最右设置框 -->
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
                                                                                	<img src="" id="headImg"/>
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
							$(this).css("width","100%");	
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
   