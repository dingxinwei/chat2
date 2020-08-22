<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head lang="en">
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>微信 for Web</title>
   
    <link href="css/bootstrap-datetimepicker.min.css"  type="text/css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link href="css/mycss.css" rel="stylesheet" type="text/css">
    <link href="css/buttons.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" type="image/x-icon" href="common/img/favicon1fbcbe.ico" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   	<script  src="js/bootstrap-datetimepicker.min.js"></script>
	<script  src="js/bootstrap-datetimepicker.zh-CN.js" charset="utf-8"></script>
    <script src="js/fontShow.js"></script>
    <script type="text/javascript" src="common/js/ajax.js"></script>
</head>
<body>
    <header>
        <img src="common/img/img3.JPG">
    </header>
    <div id="content">
        <div id="content_left">
            <h2>微信 For</h2>
            <h3>Windows</h3>
            <button class="button button-glow button-border button-rounded button-primary" data-toggle="modal" data-target="#myModal">登录</button>
        </div>

       <!-- 登陆Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content"  style="background-color: #333333">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" style="color: #ffffff">登录</h4>
                    </div>
                    <div class="modal-body">
                        <form  action="user" class="form-horizontal" id="login_submit" method="post">
                          	<input type="hidden" name="oper" value="login">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" style="color: #ffffff">账号</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                        <input type="text" class="form-control" id=account placeholder="账号" name="account" onblur="checkAccount('#account')">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label" style="color: #ffffff">密码  </label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input type="password" class="form-control" id="password" placeholder="密码" name="password" onblur="checkPassword('#password')">
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="signlog">
                                <div class="col-sm-offset-2 col-sm-4" id="login">
                                <input type="button" value="登录" class="button button-glow button-border button-rounded button-primary" onclick="Login()"> 
                                   
                                </div>
                                <div class="col-sm-offset-2 col-sm-4">
                                    <a href="#" class="button button-glow button-border button-rounded button-primary" data-toggle="modal" data-target="#myModal_sign">注册</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div >
        </div>


<!--注册Model-->
        <div class="modal fade" id="myModal_sign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content"  style="background-color: #333333">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel_sign" style="color: #ffffff">注册</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="sign_submit" method="post" action="User">
                            <div class="form-group">
                                <label for="inputEmail1" class="col-sm-2 control-label" style="color: #ffffff">账号 </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="Email_id">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                        <input type="text" name="account" class="form-control" id="account1" placeholder="账号" onblur="checkAccount('#account1')">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputUser1" class="col-sm-2 control-label" style="color: #ffffff">昵称 </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="User_id">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                        <input type="username" name="nickname" class="form-control" id="nickname" placeholder="昵称">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1" class="col-sm-2 control-label" style="color: #ffffff">密码  </label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="Pa_id">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input type="password" name="password" class="form-control" id="password1" placeholder="密码" onblur="checkPassword('#password1')">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPasswordagain" class="col-sm-2 control-label" style="color: #ffffff">确认密码</label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="Con_id">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-check"></span></span>
                                        <input type="password" class="form-control" id="ackPassword" placeholder="确认密码" onblur="reAck()">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputNumber" class="col-sm-2 control-label" style="color: #ffffff">年龄</label>
                                <div class="col-sm-10">
                                    <div class="input-group" id="Num_id">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
                                        <input type="text" name="age" class="form-control" id="age" placeholder="年龄">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="inputNumber" class="col-sm-2 control-label" style="color: #ffffff">性别</label>
                                <div  >
                                    <div class="input-group" id="Num_id" style="margin-top:4px">
                                      
                                       	$nbsp;<span style="color:white;font-size: 15px">男:</span><input type="radio" name="sex" id="sex" value="1" checked="checked">
                                    		<span style="color:white;font-size: 15px">女:</span><input type="radio" name="sex"   value="0">
                                    </div>
                                </div>
                            </div>
                           <div class="control-group" >
				                <label for="inputNumber" class="col-sm-2 control-label" style="color: #ffffff">出生年月</label>
				                <div class="controls input-append date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"  data-date-forma="yyyy mm dd" data-link-format="yyyy-mm-dd">
				                    <input size="16" type="text" id="birth"  readonly>
				                    <span class="add-on" ><i class="icon-remove"></i></span>
									<span class="add-on" ><i class="icon-th"></i></span>
				                </div>
								<input type="hidden" id="dtp_input2" value="" /><br/>
           				 </div>
                            <div class="form-group">
                                <div class="col-sm-offset-8 col-sm-4">
                                    <a  class="button button-glow button-border button-rounded button-primary"  onclick="reg()">确认注册</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="close_id" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div >
        </div>
        
        <div id="content_right">
            <img src="common/img/img1.jpg">
        </div>
        <div id="content_img">
            <img src="common/img/img2.jpg">
        </div>
        <div id="text1"></div>
    </div>
    <footer>
        <p id="copy">微信 For Web<br/>Copyright &copy; 2016 Soft207 All Rights Reserved</p>
    </footer>
    <script type="text/javascript">
    		$('#close_id').click(function(){
    			 document.getElementById("account1").value="";
    			 document.getElementById("nickname").value="";
    			 document.getElementById("password1").value="";
    			 document.getElementById("ackPassword").value="";
    			 document.getElementById("age").value="";
    			 document.getElementById("birth").value="";
    		})
    		//校验账号格式
    		function checkAccount(id){
    			var data = $(id).val();
    			var login=/^\d{6,10}$/;
    			if(""== data || null == data){
    				alert("账号不能为空");
    				return false;
    			}else if(login.test(data)){
    				return true;
    			}else{
    				alert("账号格式不正确(6-10位数字)");
    				return false;
    			}
    		}
    		//校验密码格式
    		 function checkPassword(id){
				var data = $(id).val();
				
				var login = /^[a-z]\w{5,10}$/;
				if(""== data || null == data){
    				alert("密码不能为空");
    				return false;
    			}else if(login.test(data)){
    				return true;
    			}else{
    				alert("密码格式不正确(密码为数字和字母组合 必须字母为首)");
    				return false;
    			}
			}
    		//确认密码校验
    		function reAck(){
    			var data = $('#password1').val();
    			var newData = $('#ackPassword').val();
    			if("" == newData || null == newData){
    				alert("确认密码不能为空");
    			}else if(data == newData){
    				return true;
    			}else{
    				alert("两次密码不一致");
    			}
    		}
    		//昵称校验
    		var checkNickname = function(){
    			var data = $('#nickname').val();
    			if("" == data || null == data){
    				alert("昵称不能为空");
    				
    				return false;
    			}else{
    				return true;
    			}
    		}
    		$('#nickname').blur(checkNickname);
    		//日期设置
		$('.form_date').datetimepicker({
				
		        language:  'zh-CN',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		    });
  		var deal = function(ajax){
  			var data = ajax.responseText;
    		
    		if("0"==data){
    			alert("用户名或密码错误");
    		}else if("1"==data){
    			window.location.href="http://localhost:8080/wxchat/chat.jsp";
    		}
  		}
  		//登录
		 function Login(){
			 var account = $("#account").val();
	  			var password = $("#password").val();
	  			var data = "account="+account+"&"+"password="+password;
	  		if(checkAccount('#account')&&checkPassword('#password')){
	  			myAjax("post","user/login",data,true,"application/x-www-form-urlencoded",deal);
	  		}
			 
		 }
  		//注册
		function reg(){
			var account = $("#account1").val();
			var pwd = $("#password1").val();
			var nickname = $("#nickname").val();
			var age = $("#age").val();
			var birth = $("#birth").val();
			var sex;
			var radio = $("input[name='sex']");
				
			if(radio[0].checked){
				sex = radio[0].value;
			}else if(radio[1].checked){
				sex = radio[1].value;
			}
			
			var data = "account="+account+"&pwd="+pwd+"&nickname="+nickname+"&age="+age+"&birth="+birth+"&sex="+sex;
			if(checkAccount('#account1')&&checkPassword('#password1')&&reAck()&&checkNickname()&&checkPassword('#ackPassword')){
				myAjax("post","user/reg",data,true,"application/x-www-form-urlencoded",dealReg);
			}
			
		}
  		var dealReg = function (ajax){
  			var data = ajax.responseText;
  			if(data == "1"){
  				alert("注册成功");
  				$('#close_id').click();
  			}else if(data == "0"){
  				alert("注册失败请重新注册");
  			}else if(data == "2"){
  				alert("此账号已被注册...");
  			}
  		}
    </script>
</body>
</html>