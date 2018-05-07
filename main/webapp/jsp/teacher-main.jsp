<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("webapp", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>问卷调查系统--教师</title>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="t_username"><span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username" id="username">${user.username}</h4>
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
                                <a href="teacher">
                                    <span class="icon fa fa-tachometer"></span><span class="title">主页</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-credit-card"></span><span class="title">出卷</span>
                                </a>
                                
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" data-toggle="modal" data-target="#createRandomSurveyModal">自动出卷</a>
                                            </li>
                                            <li><a href="#" onclick="isEditSurvey(1)">手动出卷</a>
                                            </li>
                                            <li><a href="#" onclick="loadDrafts()">查看草稿</a>
                                            </li>
                                            <li><a href="#" onclick="isEditSurvey(2)">查看编辑中的试卷</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-history"></span><span class="title">查看记录</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" onclick="loadResult()">已发布的问卷</a>
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
       
        <!-- 创建问卷模态框 -->
		<div class="modal fade" id="createSurveyModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">创建问卷</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">所属课程</label>
                      	 	<select id="select-course" class="form-control select-course">
                         	   <option value='null'>--请选择--</option>
                      		</select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">问卷标题</label>
                            <input type="text" class="form-control" id="survey-name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">描述</label>
                            <textarea class="form-control" id="description"></textarea>
                        </div>
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="createSurvey(0)">确定</button>
						<!-- <button type="button" class="btn btn-primary" onclick="loadMakePaper()">跳转</button> -->
					</div>
				</div>
			</div>
		</div>
		
		<!-- 创建问卷模态框 -->
		<div class="modal fade" id="createRandomSurveyModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">自动创建问卷</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">单选题数量</label>
                            <input type="number" max="12" min="0" value=0 class="form-control" id="survey-question-type1">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">多选题数量</label>
                            <input type="number" max="12" min="0" value=0 class="form-control" id="survey-question-type2">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">问答题数量</label>
                            <input type="number" max="5" min="0" value=0 class="form-control" id="survey-question-type3">
                        </div>
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="loadQuestion()">确定</button>
						<!-- <button type="button" class="btn btn-primary" onclick="loadMakePaper()">跳转</button> -->
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="createQuestionModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">设计问题</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">题目类型</label>
                      	 	<select id="select-questionType" class="form-control">
                         	   <option value='null'>--请选择--</option>
                         	   <option value=1>单选题</option>
                         	   <option value=2>多选题</option>
                         	   <option value=3>问答题 </option>
                      		</select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">题目</label>
                            <input type="text" class="form-control" id="question-name">
                            <input type="hidden" class="form-control" id="questionnaireId">
                        </div>
                        
							<div class="form-group" id="optionInput">
							<div class="row"><div id="InputsWrapper">
							</div></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
					<a href="#" rel="external nofollow" id="AddMoreFileBox" class="btn btn-info">添加选项</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="insertQuestion()">确定</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade modal-info" id="modalInfoWithSurvey" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示信息</h4>
					</div>
					<div class="modal-body" id="modal-body-survey-info">...</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
						<button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade modal-danger" id="modalDelete" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">警告信息</h4>
					</div>
					<div class="modal-body">你确定要删除吗?<input type="hidden" id="delete-survey-id"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger" onclick="loadDeleteSurvey()">OK</button>
					</div>
				</div>
			</div>
		</div>


		<footer class="app-footer">
            <div class="wrapper">
                	华北水利水电大学课程问卷调查系统--by:李彦龙
                <span class="pull-right">1.0<a href="#"><i class="fa fa-long-arrow-up"></i></a></span>
            </div>
        </footer>
    </div>
        
            <!-- Javascript Libs -->
            <script type="text/javascript" src="../lib/js/jquery.min.js"></script>
            <script type="text/javascript" src="../lib/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="../js/echarts.js"></script>
            <script type="text/javascript" src="../lib/js/bootstrap-switch.min.js"></script>
            <script type="text/javascript" src="../lib/js/jquery.matchHeight-min.js"></script>
            <script type="text/javascript" src="../lib/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="../lib/js/dataTables.bootstrap.min.js"></script>
            <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
            <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
            <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
            <!-- Javascript -->
            <script type="text/javascript" src="../js/jquery.session.js"></script>
            <script type="text/javascript" src="../js/laydate/laydate.js"></script>
            <script type="text/javascript" src="../js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if ("${user.username}" == "" || "${user.authority}" != "1") {
		logout();	
	}else{
		loadUser();
	}
	
});
//获取用户信息
function loadUser(){
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/getTeacher',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			$("#t_username").html(data.teacher.teacherName+'<span class="caret"></span>');
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 动态添加input
	var MaxInputs    = 8; //maximum input boxes allowed
	var InputsWrapper  = $("#InputsWrapper"); //Input boxes wrapper ID
	var AddButton    = $("#AddMoreFileBox"); //Add button ID
	var x = InputsWrapper.length; //initlal text box count
	var FieldCount=1; //to keep track of text box added
	$(AddButton).click(function (e) //on add input button click
	{
	    if(x <= MaxInputs) //max input box allowed
	    {
	      FieldCount++; //text box added increment
	      //add input box
	      $(InputsWrapper).append('<div><div class="col-xs-8"><input type="text" class="form-control" name="mytext[]" id="field_'+ FieldCount +'" value="选项 '+ FieldCount +'"/></div><div class="col-xs-4"><button type="button" class="btn btn-default removeclass" >删除</button></div></div>');
	      x++; //text box increment
	    }
	});
	$("body").on("click",".removeclass", function(e){ //user click on remove text
	    if( x > 1 ) {
	        $(this).parent('div').parent('div').remove(); //remove text box
	        x--; //decrement textbox
	    }
	});
// 根据select选项调整选项内容
$("select#select-questionType").change(function(){
	var type = $(this).val();
	if(type==1||type==2){
		x = InputsWrapper.length;
		FieldCount=1;
		$("#InputsWrapper").empty();
		$("#InputsWrapper").append('<div><div class="col-xs-8"><input type="text" class="form-control" name="mytext[]" id="field_1" value="选项 1" /></div><div class="col-xs-4"><button type="button" class="btn btn-default removeclass">删除</button></div></div>');
		document.getElementById("AddMoreFileBox").style.visibility="visible";
	}else{
		$("#InputsWrapper").empty();
		document.getElementById("AddMoreFileBox").style.visibility="hidden";
	}
});

// 获取问题内容并保存 
function insertQuestion(){
	var valArr = new Array;
	$("input[name='mytext[]']").each(function(i){
	    valArr[i] = $(this).val();
	});
	var option = valArr.join(',');
	if($("#question-name").val()=="" || $("#select-questionType").val()=="null"){
		//alert($("#question-name").val());
		//alert($("#select-questionType").val());
		alert("请输入问题类型和问题内容!");
	}else {
		if($("#select-questionType").val()==3){
			option="";
			//alert(option);
		}
		
	    $.ajax({
			type : 'POST',
			url : '${webapp}/question/insertOne',
			async : true,
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({
				"type" : $("#select-questionType").val(),
				"topic" : $("#question-name").val(),
				"option" : option,
				"questionnaireId" : $("#questionnaireId").val()
			}),
			success : function(data) {
				if(data.success){
					alert("添加成功");
					var type;
					if($("#select-questionType").val()==1){type="单选"}else if($("#select-questionType").val()==2){type="多选"}else{type="简答"}
					$("#createQuestionModal").modal("hide");
					// 加载问题到页面上					
					$("#addQuestion").append('<div><div class="sub-title">'+$("#question-name").val()+"&ensp;("+type+")"+'<button type="button" id="deleteButton'+data.questionId+'" class="btn btn-link" onclick="loadDeleteQuestionModal('+data.questionId+')"><i class="fa fa-remove"></i></button></div><div><ol id="optionListLi'+data.questionId+'"></ol></div></div>');
					if($("#select-questionType").val() != 3){
						for (var i=0;i<valArr.length;i++)
						{
							$("#optionListLi"+data.questionId).append("<li>"+ valArr[i] + "</li>");
						}
					}
					
				}else{
					alert("添加失败");		
				}
			},
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		});
	}
	
}

// 弹出创建试卷的模态框
function loadInsertSurveyModal(){
	$("#survey-name").val("");
	$("#description").val("");
	loadCourseList();
	$("#createSurveyModal").modal();
}

//弹出创建题目的模态框
function loadQuestionModal(){
	x = InputsWrapper.length;
	FieldCount=1;
    $("#select-questionType").val("null");
	$("#InputsWrapper").empty();
	document.getElementById("AddMoreFileBox").style.visibility="hidden";
	$("#createQuestionModal").modal();
}
// 加载课程种类列表
function loadCategoryList(){
	$.ajax({
        type : 'GET',
        url : '${webapp}/category/list', 
        async : true,

        success : function(data) {
        	$("#select-category").empty("");
            $("#select-category").append("<option value='null'>--请选择--</option>");          
        	$.each(data.categorys,function(index, obj) {
                 $("#select-category").append("<option value='"+obj.categoryId+"'>"+obj.categoryName+"</option>");          
            });
        },

        error : function(msg) {
            alert(JSON.stringify(msg));
        }

    });
}

$("select#select-category").change(function(){
	var id = $(this).val();
	$.ajax({
		type : 'GET',
		url : '${webapp}/course/list/'+id,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
        	$("#select-course").empty("");
            $("#select-course").append("<option value='null'>--请选择--</option>");          
        	$.each(data.courses,function(index, obj) {
                 $("#select-course").append("<option value='"+obj.courseId+"'>"+obj.courseName+"</option>");          
            });
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
});
// 加载课程列表
function loadCourseList(){
	$.ajax({
		type : 'GET',
		url : '${webapp}/courseByTeacher',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
        	$(".select-course").empty("");
            $(".select-course").append("<option value='null'>--请选择--</option>");          
        	$.each(data.courses,function(index, obj) {
                 $(".select-course").append("<option value='"+obj.courseId+"'>"+obj.courseName+"</option>");          
            });
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 创建试卷
function createSurvey(status){
	if($("#survey-name").val()==""){
		alert("请输入问卷标题!");
	}else if($("#select-course").val()=="null"){
		alert("请选择课程!");		
	}else if($("#description").val()==""){
		alert("请输入问卷描述!");				
	}else{
		$.ajax({
			type : 'POST',
			url : '${webapp}/survey/insertOne',
			async : true,
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({
				"title" : $("#survey-name").val(),
				"courseId" : $("#select-course").val(),
				"description" :$("#description").val(),
				"status" : status
			}),
			success : function(data) {
				//alert(data.questionnaireId);
				$("#questionnaireId").val(data.questionnaireId);
				loadMakePaper(1);
			},
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		});
	}
}

//加载试卷 (暂时不用)
function loadSurvey(questionnaireId){
	$.ajax({
		type : 'POST',
		url : '${webapp}/survey/selectOne',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"questionnaireId" : questionnaireId,
		}),
		success : function(data) {
			if(data.success){

				//alert(data.questionnaire.title);
			}else{
				alert("加载失败!");
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 判断是否有待编辑的问卷
function isEditSurvey(type){
	$.ajax({
		type : 'GET',
		url : '${webapp}/survey/isEdit',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			// 有待编辑的
        	if(data.success){
        		// 说明是点击出卷
        		if(type==1){
        			$("#modalInfoWithSurvey").modal();
        			$("#modal-body-survey-info").html("您还有未编辑完成的问卷,请先进行编辑!");
        		}
        		// 说明是点击编辑
        		if(type==2){
        			loadMakePaper(2);
        		}
        	}else{
        		// 说明是点击出卷
        		if(type==1){
	        		loadInsertSurveyModal();
        		}
        		// 说明是点击编辑
        		if(type==2){
        			$("#modalInfoWithSurvey").modal();
        			$("#modal-body-survey-info").html("您没有未编辑完成的问卷,请点击出卷!");
        		}
        	}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
	
}
// 加载出卷的页面
function loadMakePaper(type,questionnaireId){
	//alert("最终id"+questionnaireId);
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=make-paper",
		success:function(data){
			$("#main-body").html(data);
			// 出卷
			if(type==1){
				$("#createSurveyModal").modal("hide");
				$("#survey-title").html($("#survey-name").val());
				$("#survey-description").html($("#description").val());
			}
			// 编辑未完成的问卷
			if(type==2){
				loadEditSurvey(0);
			}
			// 编辑草稿的问卷
			if(type==3){
				loadEditSurvey(1,questionnaireId);				
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 加载草稿箱 
function loadDrafts(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=datatable",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("草稿箱");
			$("#tableDescription").html("这是您未发布的问卷!");
			$("select#query-select-course").hide();
			$("#time-search-begin").hide();
			$("#time-search-end").hide();
			$("#survey-query-button").hide();
			loadSurveyList(1);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 读取草稿问卷列表
function loadSurveyList(status){
	$.ajax({
		type : 'POST',
		url : '${webapp}/survey/selectList',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"status" : status,
		}),
		success : function(data) {
			
				$("#surveyList thead:not(:first)").html("");
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
						+ "</td><td>"
						+ obj.createtime
						+ "</td><td><a href='#' type='button' onclick='loadMakePaper(3,"
						+ obj.questionnaireId
						+ ")'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>"
						+ "</a></td><td><a href='#' type='button' onclick='loadDeleteForm("
						+ obj.questionnaireId
						+ ")' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
						+ "</a></td><td><a href='#' type='button' onclick='loadSave(2,"
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

//加载发布试卷 页面
function loadResult(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=datatable",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("已发布的问卷");
			$("#tableDescription").html("这是您已经发布的问卷!");
			laydate.render({
				elem : '#time-search-begin',
				type : 'datetime'
			});
			laydate.render({
				elem : '#time-search-end',
				type : 'datetime'
			});
			var today=new Date();
			$("#time-search-begin").attr('value',today.getFullYear()+"-01-01 00:00:00");
			loadCourseList();
			loadSurveyResultList(2);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载删除模态框
function loadDeleteForm(qid){
	$("#modalDelete").modal();
	$("#delete-survey-id").val(qid);
}

// 删除试卷
function loadDeleteSurvey(){
	$.ajax({
		type : 'GET',
		url : '${webapp}/survey/delete/'+$("#delete-survey-id").val(),
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功!");
				$("#modalDelete").modal("hide");
				loadSurveyList(1);
			}else{
				alert("删除失败!");				
			}		
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 读取已发布问卷列表
function loadSurveyResultList(status){
	$.ajax({
		type : 'POST',
		url : '${webapp}/survey/selectList',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"status" : status,
			"beginTime" : $("#time-search-begin").val(),
			"endTime" : $("#time-search-end").val(),
			"courseId" : $("#query-select-course").val()
		}),
		success : function(data) {
			
				$("#surveyList").html("<thead><tr><th>序号</th><th>标题</th><th>描述</th><th>课程</th><th>创建时间</th><th>查看结果</th><th>再次发布</th></tr></thead>");
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
						+ "</td><td>"
						+ obj.createtime
						+ "</td><td><a href='#' type='button' onclick='loadQuestionnaireResultPage("
						+ obj.questionnaireId
						+ ")' ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span>"
						+ "</a></td><td><a href='#' type='button' onclick='loadQuestionnaireRepublish("
						+ obj.questionnaireId
						+ ")' ><span class='glyphicon glyphicon-repeat' aria-hidden='true'></span>"
						+ "</a></td></tr>");
						})
				$("#surveyList").append("</tbody>");
			
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 重新发布问卷
function loadQuestionnaireRepublish(questionnaireId){
	$.ajax({
		type : 'GET',
		url : '${webapp}/survey/republish/'+questionnaireId,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("发布成功!");
			}else{
				alert("今年不能再发布该问卷了!");								
			}		
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 查看在编辑或者草稿的问卷
function loadEditSurvey(status,questionnaireId){
	$.ajax({
		type : 'POST',
		url : '${webapp}/survey/getEdit',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({"status":status,"questionnaireId":questionnaireId}),
		success : function(data) {
			console.log(data);
			// 加载试卷内容
			$("#survey-title").html(data.questionnaire.title);
			$("#survey-description").html(data.questionnaire.description);
			$("#questionnaireId").val(data.questionnaire.questionnaireId);
			// 加载问题内容
			var type;
			$.each(data.qo,function(index, qo) {
				if(qo.question.type==1){type="单选"}else if(qo.question.type==2){type="多选"}else{type="简答"}
				$("#addQuestion").append('<div><div class="sub-title">'+qo.question.topic+"&ensp;("+type+")"+'<button type="button" id="deleteButton'+qo.question.questionId+'" class="btn btn-link" onclick="loadDeleteQuestionModal('+qo.question.questionId+')"><i class="fa fa-remove"></i></button></div><div><ol id="optionListLi'+qo.question.questionId+'"></ol></div></div>');
				if(qo.question.type==1 || qo.question.type==2){
					$.each(qo.options,function(index, option) {
						$("#optionListLi"+qo.question.questionId).append("<li>"+ option + "</li>");
					});
					
				}
			});
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 删除问题
function loadDeleteQuestionModal(questionId){
	
 	$.ajax({
		type : 'GET',
		url : '${webapp}/question/delete/'+questionId,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功!");
				$("#deleteButton"+questionId).parent('div').parent('div').remove();
			}else{
				alert("删除失败!");				
			}		
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 发布或存到草稿箱 
function loadSave(status,questionnaireId){
	if(questionnaireId==null){
		questionnaireId=$("#questionnaireId").val();
	}
	$.ajax({
		type : 'POST',
		url : '${webapp}/survey/save',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"status":status,
			"questionnaireId":questionnaireId
		}),
		success : function(data) {
			if(data.success){
				alert("保存成功!转到主页!");
				// 跳转到主页
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 跳转到展示结果页面
function loadQuestionnaireResultPage(questionnaireId){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=answerResult",
		success:function(data){
			$("#main-body").html(data);
			loadQuestionnaireResult(questionnaireId);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
//展示结果
function loadQuestionnaireResult(questionnaireId){
	$.ajax({
		type : 'POST',
		url : '${webapp}/answer/result',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"questionnaireId":questionnaireId
		}),
		success : function(data) {
			
			console.log(data);
			$("#survey-title").html(data.questionnaire.title);
			$("#survey-description").html(data.questionnaire.description);
			
			$.each(data.resultShows,function(index, result) {
				if(result.question.type==1){
					$("#showResult").append('<div class="sub-title">'+(index+1)+'.&ensp;'+result.question.topic+'&ensp;(单选)</div>');
					$("#showResult").append('<div id="qChart'+result.question.questionId+'" style="height: 350px;"></div>');
					var valueName = new Array();
					for(var i=0;i<result.options.length;i++){
						valueName[i] = {
							        value:result.countList[i],
							        name:result.options[i] }
					}
					
					option = {
		         		    title : {
		         		        
		         		    },
		         		    tooltip : {
		         		        trigger: 'item',
		         		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		         		    },
		         		    legend: {
		         		        orient : 'horizontal',
		         		        "x":"center",
		         		        data: result.options
		         		    },
		         		    series : [
		         		        {
		         		            name: '选择数量',
		         		            type: 'pie',
		         		            radius : '55%',
		         		            center: ['50%', '60%'],
		         		            data:valueName,
		         		            itemStyle: {
		         		                emphasis: {
		         		                    shadowBlur: 10,
		         		                    shadowOffsetX: 0,
		         		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		         		                }
		         		            }
		         		        }
		         		    ]
		         		};
					var my_aChart = echarts.init(document.getElementById('qChart'+result.question.questionId));
			         my_aChart.setOption(option);
			         window.addEventListener("resize", function() {
			         		my_aChart.resize();
			         });
					
				}
				if(result.question.type==2){
					$("#showResult").append('<div class="sub-title">'+(index+1)+'.&ensp;'+result.question.topic+'&ensp;(多选)</div>');
					$("#showResult").append('<div id="qChart'+result.question.questionId+'" style="height: 350px;"></div>');
					var width = "20%";
					if(result.options.length>4){
						width = "60%";
					}
					option = {
		         		    color: ['#3398DB'],
		         		    tooltip : {
		         		        trigger: 'axis',
		         		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		         		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		         		        }
		         		    },
		         		    grid: {
		         		        left: '3%',
		         		        right: '4%',
		         		        bottom: '3%',
		         		        containLabel: true
		         		    },
		         		    xAxis : [
		         		        {
		         		            type : 'category',
		         		            data : result.options,
		         		            axisTick: {
		         		                alignWithLabel: true
		         		            }
		         		        }
		         		    ],
		         		    yAxis : [
		         		        {
		         		            type : 'value'
		         		        }
		         		    ],
		         		    series : [
		         		        {
		         		            name:'选择数量',
		         		            type:'bar',
		         		            barWidth: width,
		         		            data:result.countList
		         		        }
		         		    ]
		         		};
			         var my_aChart = echarts.init(document.getElementById('qChart'+result.question.questionId));
			         my_aChart.setOption(option);
			         window.addEventListener("resize", function() {
			         		my_aChart.resize();
			         });
				}
				if(result.question.type==3){
					$("#showResult").append('<div class="sub-title">'+(index+1)+'.&ensp;'+result.question.topic+'&ensp;(问答)</div>');
					$("#showResult").append('<div><ul class="list-group" id="qtext'+result.question.questionId+'"></ul></div>');
					$.each(result.type3List,function(index, text) {
						if(text != ""){							
						$("#qtext"+result.question.questionId).append("<li class='list-group-item'>"+text+"</li>");
						}
					});
				}
			});
			
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

// 退出
function logout(){
	$.session.remove("user");
	location.href = "${webapp }";
}
/////////////////自动出卷部分/////////////////////
// 监听输入框输入的数量
$("#survey-question-type1").blur(function() {
	var typenum = $("#survey-question-type1").val();
	if( typenum > 12 ){
		$("#survey-question-type1").val(12);
	}
	if(typenum < 0){
		$("#survey-question-type1").val(0);		
	}
});
$("#survey-question-type2").blur(function() {
	var typenum = $("#survey-question-type2").val();
	if( typenum > 12 ){
		$("#survey-question-type2").val(12);
	}
	if(typenum < 0){
		$("#survey-question-type2").val(0);		
	}
});
$("#survey-question-type3").blur(function() {
	var typenum = $("#survey-question-type3").val();
	if( typenum > 5 ){
		$("#survey-question-type3").val(5);
	}
	if(typenum < 0){
		$("#survey-question-type3").val(0);		
	}
});
//加载题目管理页面
function loadQuestion(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=autoquestion",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("出卷信息");
			$("#tableDescription").html("这是自动组建的题目信息");
			$("#createRandomSurveyModal").modal("hide");
			loadCourseList();
			loadQuestionList();
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
var questionIdList = new Array();
//显示题目列表
function loadQuestionList(){
	$.ajax({
		type : 'POST',
		url : '${webapp}/exquestion/auto',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"type1":$("#survey-question-type1").val(),
			"type2":$("#survey-question-type2").val(),
			"type3":$("#survey-question-type3").val()
		}),
		success : function(data) {
			console.log(data);
			$("#questionList tr:not(:first)").html("");
			$("#questionList").append("<tbody>");
			$.each(data.questions,function(index, obj) {
			questionIdList[index] = obj.exquestionId;
				
				if(obj.type==1){type="单选题"}else if(obj.type==2){type="多选题"}else{type="问答题"}
			$("#questionList").append("<tr><td>"
					+ (index + 1)
					+ "</td><td>"
					+ obj.topic
					+ "</td><td>"
					+ obj.optionList
					+ "</td><td>"
					+ type
					+ "</td><td><a href='#' type='button' onclick='loadDeleteAutoQuestion(this)'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#questionList").append("</tbody>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 删除自动创建的题目
function loadDeleteAutoQuestion(o){
	//获取表格  
    var t=document.getElementById('questionList');  
    delete questionIdList[o.parentNode.parentNode.rowIndex-1]
    //alert(questionIdList);
    //删除当前行  
    t.deleteRow(o.parentNode.parentNode.rowIndex);
}
// 保存自动出卷的结果
function loadSaveAutoSurvey(status){
	if($("#survey-name-auto").val()==""){
		alert("请输入问卷标题!");
	}else if($("#select-course-auto").val()=="null"){
		alert("请选择课程!");		
	}else if($("#description-auto").val()==""){
		alert("请输入问卷描述!");				
	}else{
		$.ajax({
			type : 'POST',
			url : '${webapp}/survey/insertOne',
			async : true,
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : JSON.stringify({
				"title" : $("#survey-name-auto").val(),
				"courseId" : $("#select-course-auto").val(),
				"description" :$("#description-auto").val(),
				"status" : status
			}),
			success : function(data) {
				//alert("返回的id"+data.questionnaireId);
				$("#questionnaireId").val(data.questionnaireId);
				// 保存问题  
				loadSaveAutoQuestion(status,data.questionnaireId);
				
				
			},
			error : function(msg) {
				alert(JSON.stringify(msg));
			}
		});
	}
}
// 将所选的题目保存到对应问卷下
function loadSaveAutoQuestion(status,questionnaireId){
	//alert(questionnaireId);
	$.ajax({
		type : 'POST',
		url : '${webapp}/question/insertList',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"questionIdList" : questionIdList,
			"questionnaireId" : questionnaireId
		}),
		success : function(data) {
			if(data.success){
				alert("保存成功！");
				if(status==1){
					// 如果是编辑再转去编辑页面
					loadMakePaper(3,questionnaireId);
				}else{
					location.href = "${webapp }/system/teacher"
				}
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
</script>
</body>

</html>
