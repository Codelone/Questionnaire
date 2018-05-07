<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("webapp", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Login Form Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>课程问卷管理系统</strong></h1>
                            <div class="description">
                            	
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>修改密码</h3>
                            		<p id="loginInfo">输入你的旧密码和新密码</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">旧密码</label>
			                        	<input type="password" name="form-password" placeholder="OldPassword..." class="form-password form-control" id="form-password">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">新密码</label>
			                        	<input type="password" name="form-password" placeholder="NewPassword..." class="form-password form-control" id="form-newPassword">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">再次输入</label>
			                        	<input type="password" name="form-password" placeholder="NewPassword..." class="form-password form-control" id="form-newPassword2">
			                        </div>
			                        <button type="button" class="btn" onclick="updatePassword()">确认</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        <script type="text/javascript" src="js/jquery.session.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

<script type="text/javascript">
$(document).ready(function() {
	if ("${user.username}" == "") {
		location.href = "${webapp }";
	}
});
function updatePassword(){
	
	var password = $("#form-password").val();
	var newPassword = $("#form-newPassword").val();
	var newPassword2 = $("#form-newPassword2").val();
	if(newPassword != newPassword2){
		$("#loginInfo").html("两次密码输入不一致");
		document.getElementById("loginInfo").style.color = "red";
	} else {
		
		$.ajax({
			type : 'POST',
			url : '${webapp}/user/changePassword',
			async : true,
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({
				"password" : password,
				"newPassword" : newPassword
			}),
			success : function(data) {
				if (data.success) {
					$.session.remove("user");
					location.href="${webapp }";		
				} else {					
					$("#loginInfo").html("修改失败!");
				}
			},
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		});
	}
	
}

</script>
</body>
</html>