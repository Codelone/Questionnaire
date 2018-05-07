<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setAttribute("webapp", request.getContextPath());
%>
<!DOCTYPE html>
<html>

<head>
    <title>问卷调查系统--学生</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/dataTables.bootstrap.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/themes/flat-blue.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-inverse navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li class="active">主页</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
              
                    <ul class="nav navbar-nav navbar-right">
                       
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="s_username"></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">${user.username}</h4>
                                        <p></p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <a type="button" class="btn btn-default" href="../cpwd.jsp"><i class="fa fa-user"></i>修改密码</a>
                                            <button type="button" class="btn btn-default" onclick="logout()"><i class="fa fa-sign-out"></i>退出</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <!-- 菜单栏 -->
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">菜单</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="student">
                                    <span class="icon fa fa-tachometer"></span><span class="title">主页</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon glyphicon glyphicon-duplicate"></span><span class="title">查看问卷</span>
                                </a>
                                
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" onclick="loadSurveyWritePage()">查看未答问卷</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
        <!-- 页面主体 -->            
        <div id="main-body">
        	<div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title"><br></span>
                        <div class="description"><br></div>
                    </div>
                     <div class="page-title">
                        <span class="title"><br></span>
                        <div class="description"><br></div>
                    </div>
					<div class="row">
						<div class="col-xs-2"></div>
						<div class="col-xs-8">
							<img class="img-responsive center-block" alt="logo" src="../img/ncwu_logo.jpg">
							<h2 align="center">欢迎使用华北水利水电大学课程问卷调查系统</h2>
						</div>
						<div class="col-xs-2"></div>
					</div>
				</div>
            </div>
        </div>

        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">1.0<a href="#"><i class="fa fa-long-arrow-up"></i></a></span>
                	华北水利水电大学课程问卷调查系统--by:李彦龙
            </div>
        </footer>
        </div>
            <!-- Javascript Libs -->
            <script type="text/javascript" src="../lib/js/jquery.min.js"></script>
            <script type="text/javascript" src="../lib/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="../lib/js/bootstrap-switch.min.js"></script>
            <script type="text/javascript" src="../lib/js/jquery.matchHeight-min.js"></script>
            <script type="text/javascript" src="../lib/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="../lib/js/dataTables.bootstrap.min.js"></script>
            <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
            <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
            <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
            <!-- Javascript -->
            <script type="text/javascript" src="../js/jquery.session.js"></script>
            <script type="text/javascript" src="../js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if ("${user.username}" == "" || "${user.authority}" != "2") {
		logout();	
	}else{
		loadUser();
	}
});
// 获取用户信息
function loadUser(){
	$.ajax({
		type : 'GET',
		url : '${webapp}/student/getStudent',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			$("#s_username").html(data.student.studentName+'<span class="caret"></span>');
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 展示问卷列表
function loadSurveyListForWrite(){
	$.ajax({
		type : 'GET',
		url : '${webapp}/survey/listForWrite',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
				$("#surveyList").html("<thead><tr><th>序号</th><th>标题</th><th>描述</th><th>课程</th><th>开始回答</th></tr></thead>");
				$("#surveyList").append("<tbody>");
				$.each(data.surveys,function(index, obj) {
				$("#surveyList").append("<tr><td>"
						+ (index + 1)
						+ "</td><td>"
						+ obj.title
						+ "</td><td>"
						+ obj.description
						+ "</td><td>"
						+ obj.course.courseName
						+ "</td><td><a href='#' type='button' onclick='loadAnswerSurvey("
						+ obj.questionnaireId
						+ ")' ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"
						+ "</a></td></tr>");
						})
				$("#surveyList").append("</tbody>");
			
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 加载查看要回答的问卷列表页面
function loadSurveyWritePage(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=datatable",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("待回答问卷");
			$("#tableDescription").html("这是您需要回答的问卷!");
			loadSurveyListForWrite();	
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载答卷页面
function loadAnswerSurvey(questionnaireId){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=answer-paper",
		success:function(data){
			$("#main-body").html(data);
			loadAnswerSurveyData(questionnaireId);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
var qodata;
function loadAnswerSurveyData(questionnaireId){
 		$.ajax({
			type : 'POST',
			url : '${webapp}/survey/waitAnswer',
			async : true,
			// 说明提交给
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({"status":2,"questionnaireId":questionnaireId}),
			success : function(data) {
				console.log(data);
				// 加载试卷内容
				$("#survey-title").html(data.questionnaire.title);
				$("#survey-description").html(data.questionnaire.description);
				$("#questionnaireId").val(data.questionnaire.questionnaireId);
				// 加载问题内容
				var type;
				qodata = data.qo;
				$.each(data.qo,function(index, qo) {
					if(qo.question.type==1){type="单选"}else if(qo.question.type==2){type="多选"}else{type="简答"}
					$("#showQuestions").append('<div class="sub-title">'+qo.question.topic+"&ensp;("+type+")"+'</div><div id="optionList'+qo.question.questionId+'"></div>');
					if(qo.question.type==1){
						$.each(qo.options,function(index, option) {
							$("#optionList"+qo.question.questionId).append('<div class="radio3 radio-check "><input type="radio" id="radio'+qo.question.questionId+index+'" name="radio'+qo.question.questionId+'" value="'+index+'" ><label for="radio'+qo.question.questionId+index+'">'+option+'</label></div>');
						});
					}
					if(qo.question.type==2){
						$.each(qo.options,function(index, option) {
							$("#optionList"+qo.question.questionId).append('<div class="checkbox3 checkbox-check checkbox-light" ><input type="checkbox" id="checkbox-fa-light-'+qo.question.questionId+index+'" name="checkbox'+qo.question.questionId+'" value="'+index+'"><label for="checkbox-fa-light-'+qo.question.questionId+index+'">'+option+'</label></div>');	
						});
					}
					if(qo.question.type==3){
						$("#optionList"+qo.question.questionId).append('<textarea class="form-control" id="textarea'+qo.question.questionId+'"></textarea>');
					}
				});
	        },
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		}); 
}	
// 提交问卷
function loadSubmitSurvey(){
	var result="";
	var submit = true;
   	$.each(qodata,function(index, qo) {
		if(qo.question.type==1){
			var radioValue = $("input[name=radio"+qo.question.questionId+"]:checked").val();
			if (radioValue == null) {
				submit = false;
				return false;
			} 
			var radio = qo.question.questionId+"&"+radioValue+";";
			result += radio;
		}
		if(qo.question.type==2){
			var check=qo.question.questionId+"-"
			var isValue = false;
			$("[name=checkbox"+qo.question.questionId+"]:checked").each(function(index, element) {
				check += $(this).val() + ",";
				isValue = true;
		    });
			if (!isValue) {
				submit = false;
				return false;
			}
			check = check.substring(0, check.length - 1);			
			check += ";";
			result += check;
		}
		if(qo.question.type==3){
			var textarea = qo.question.questionId+":"+$("#textarea"+qo.question.questionId+"").val()+";";
			result += textarea;
		}
	});
   	// 如果问题都完成了则提交 
   	if(submit){
   		$.ajax({
			type : 'POST',
			url : '${webapp}/answer/add',
			async : true,
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({
				"answerContent":result,
				"questionnaireId":$("#questionnaireId").val()
			}),
			success : function(data) {
				if(data.success){
					alert("提交成功!");
					location.href = "${webapp }/system/student"
				}else{
					alert("添加失败");		
				}
			},
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		});
   	}else{
		alert("有未完成的问题!");
   	}
}


//退出
function logout(){
	$.session.remove("user");
	location.href = "${webapp }";
}
</script>
</body>
</html>