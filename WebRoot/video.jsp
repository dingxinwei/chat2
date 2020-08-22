<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>视频聊天</title>
		 <link rel="shortcut icon" type="image/x-icon" href="common/img/vilog.ico" />
    <!-- Bootstrap4 CSS -->
    <link rel="stylesheet" href="common/css/bootstrap.min.css">
    <!-- Client CSS -->
    <link rel="stylesheet" href="common/css/client.css">

</head>

<body>


<div class="container">
    <div class="row">
        <div class="col-sm">
            <h2>Local Video</h2>
        </div>
        <div class="col-sm">
            <h2>Remote Video</h2>
        </div>
        
    </div>
    <div class="row">
        <div class="col-sm">
            <video id="local_video" autoplay ></video>
        </div>
        <div class="col-sm">
            <video id="remote_video" autoplay ></video>
        </div>
       
    </div>
    <div class="row">
        <div class="col-sm">
            <button type="button" class="btn btn-info" onclick="startVideo();">开启</button>
        </div>
        <div class="col-sm">
            <button type="button" class="btn btn-danger" onclick="stopVideo();">关闭</button>
        </div>
        <div class="col-sm">
            <button type="button" class="btn btn-info" onclick="connect();">呼叫</button>
        </div>
        <div class="col-sm">
            <button type="button" class="btn btn-danger" onclick="hangUp();">挂断</button>
        </div>
    </div>
   <input type="hidden" value="${user.account}" id="myaccount">
   <input type="hidden" value="${param.faccount}" id="faccount">
</div>


<!-- Bootstrap JS -->
<script type='text/javascript' src='common/js/jquery-1.10.2.js'></script>
<script type='text/javascript' src='common/js/popper.min.js'></script>
<script type='text/javascript' src='common/js/bootstrap.min.js'></script>

<!-- Main JS -->
<script type='text/javascript' src='common/js/webrtc.js'></script>


</body>
</html>
