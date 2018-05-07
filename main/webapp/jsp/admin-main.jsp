<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setAttribute("webapp", request.getContextPath());
%>
<!DOCTYPE html>
<html>

<head>
    <title>问卷调查系统--管理员</title>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">管理员<span class="caret"></span></a>
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
                                <a href="admin">
                                    <span class="icon fa fa-tachometer"></span><span class="title">主页</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-book"></span><span class="title">课程管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" onclick="loadCourse()">课程列表</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon glyphicon glyphicon-user"></span><span class="title">人员管理</span>
                                </a>
                                
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" onclick="loadTeacher()">教师管理</a>
                                            </li>
                                            <li><a href="#" onclick="loadStudent()">学生管理</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-example">
                                    <span class="icon fa fa-slack"></span><span class="title">题目管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#" onclick="loadQuestion()">题目列表</a></li>
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
            
        <!-- 添加老师  -->
        <div class="modal fade" id="addTeacherModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加老师</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">教师编号</label>
                            <input type="text" class="form-control" id="teacher-number">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">教师名字</label>
                            <input type="text" class="form-control" id="teacher-name">
                        </div>
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="loadAddTeacher()">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 添加老师课程 -->
		<div class="modal fade" id="addTeacherCourseModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加课程</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">所属分类</label>
                      	 	<select id="select-category" class="form-control">
                         	   <option value='null'>--请选择--</option>
                      		</select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">所属课程</label>
                      	 	<select id="select-course" class="form-control">
                         	   <option value='null'>--请选择--</option>
                      		</select>
                        </div>
                        
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="loadAddTeacherCourse()">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 添加老师课程班级   -->
		<div class="modal fade" id="addTeacherCourseClassModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加班级</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">班级</label>
                      	 	<!-- <select id="select-class" class="form-control">
                         	   <option value='null'>--请选择--</option>
                      		</select> -->
                      		<input type="text" class="form-control" id="student-class">
                        </div>
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="loadAddTeacherCourseClass()">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 添加学生  -->
        <div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加学生</h4>
					</div>
					<div class="modal-body">
					<form>
                        <div class="form-group">
                    		<label for="recipient-name" class="control-label">学号</label>
                            <input type="text" class="form-control" id="student-number">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">姓名</label>
                            <input type="text" class="form-control" id="student-name">
                        </div>
                    </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="loadAddStudent()">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="addQuestionModal" tabindex="-1" role="dialog"
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

	if ("${user.username}" == "" || "${user.authority}" != "0") {
		logout();	
	}
});

var teacherNumber = 0;
var TCid = 0;
//模态框触发事件
$('#addTeacherCourseModal').on('show.bs.modal', function () {
	//alert(teacherNumber+","+TCid);
  // 加载班级列表
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
})
$("select#select-category").change(function(){
	var id = $(this).val();
	$.ajax({
		type : 'POST',
		url : '${webapp}/course/list',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({"categoryId":id}),
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
})
$('#addTeacherCourseClassModal').on('show.bs.modal', function () {
  // 加载班级列表
	//alert(teacherNumber+","+TCid);
})
// 加载课程列表页面
function loadCourse(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=course",
		success:function(data){
			$("#main-body").html(data);
			$("#list-title").html("课程管理");
			$("#list-description").html("这是所有的课程分类及其列表");
			loadCategoryList();
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

//加载课程种类列表
function loadCategoryList(){
	$.ajax({
        type : 'GET',
        url : '${webapp}/category/list', 
        async : true,

        success : function(data) {
        	$("#list-category").empty("");         
        	$.each(data.categorys,function(index, obj) {
                 $("#list-category").append('<a href="#" class="list-group-item" onclick="loadCourseList('+obj.categoryId+',\''+obj.categoryName+'\')"><span class="badge">'+obj.count +'</span>'+obj.categoryName+'</a>');          
            });
        },

        error : function(msg) {
            alert(JSON.stringify(msg));
        }

    });
}
//加载课程列表
function loadCourseList(id,name){
	$.ajax({
		type : 'POST',
		url : '${webapp}/course/list',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({"categoryId":id}),
		success : function(data) {
			$("#categoryName").html("课程分类:"+name);
			$("#category-id").val(id);
        	$("#list-course").empty("");         
        	$.each(data.courses,function(index, obj) {
                 $("#list-course").append('<li class="list-group-item"><a href="#" class="badge" onclick="loadDeleteCourse('+obj.courseId+')">X</a>'+obj.courseName+'</li>');           
            });
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载添加课程框
function loadAddCourseModal(){
	$("#addCourseModal").modal();
}
// 删除课程 
function loadDeleteCourse(id){
	$.ajax({
		type : 'GET',
		url : '${webapp}/course/delete/'+id,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			console.log(data);
			if(data.success){
				alert("删除成功");
				loadCategoryList();
				loadCourseList($("#category-id").val(),$("#categoryName").html());
			}else{
				$("#modal-body-survey-info").html("该课程尚有老师授课,不能删除!");
				$("#modalInfoWithSurvey").modal();
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 添加课程
function loadAddCourse(){
	var id = $("#category-id").val();
	$.ajax({
		type : 'POST',
		url : '${webapp}/course/add',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"courseName" : $("#course-name").val(),
			"categoryId" : id
		}),
		success : function(data) {
			if(data.success){
				alert("添加成功");
				loadCategoryList();
				loadCourseList(id,$("#categoryName").html());
			}
			$("#addCourseModal").modal("hide");
			
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载教师列表页面
function loadTeacher(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=people",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("教师人员");
			$("#tableDescription").html("这是所有的教师列表!");
			loadTeacherList(1);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载老师列表
function loadTeacherList(pageNumber){
	teacherNumber = 0;
	TCid = 0;
	$.ajax({
		type : 'POST',
		url : '${webapp}/teacher/list',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"pageNumber":pageNumber,
			"pageSize":3,
			"teacherName":$("#teacher-search").val()
		}),
		success : function(data) {
			$("#teacherList tr:not(:first)").html("");
			$("#teacherList").append("<tbody>");
			$.each(data.teachers.data,function(index, obj) {
			$("#teacherList").append("<tr><td>"
					+ (index + 1)
					+ "</td><td>"
					+ obj.teacherNumber
					+ "</td><td>"
					+ obj.teacherName
					+ "</td><td><a href='#' type='button' onclick='loadCourseByTeacher("
					+ obj.teacherNumber
					+ ")'><span class='glyphicon glyphicon-book' aria-hidden='true'></span>"
					+ "</button></td><td><a href='#' type='button' onclick='loadDeleteTeacher("
					+ obj.teacherNumber +","+data.teachers.pageNumber
					+ ")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#teacherList").append("</tbody>");
			$(".pagination").empty("");
			$(".pagination").append("<li " + (pageNumber == 1 ? "class='disabled'" : '') + "><a aria-label='Previous' onclick='loadTeacherList(" + (pageNumber-1) + ")'><span aria-hidden='true'>&laquo;</span></a></li>");
			for (var i = 1; i <= data.teachers.pageCount; i++) {
                $(".pagination").append("<li id='currentPage'" + (pageNumber == i ? "class='active'" : '') + "><a aria-label='Previous' onclick='loadTeacherList(" + i + ")'>" + i + "</a></li>");
            }
			$(".pagination").append("<li " + (pageNumber == data.teachers.pageCount ? "class='disabled'" : '') + "><a aria-label='Next' onclick='loadTeacherList(" + (pageNumber+1) + ")'><span aria-hidden='true'>&raquo;</span></a></li>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 删除老师
function loadDeleteTeacher(tid,pageNumber){
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/deleteBytid/'+tid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				loadTeacherList(pageNumber);
			}else{
				$("#courseModalInfo").html("该老师尚有课程授课,不能删除!");
				$("#modalInfo").modal();
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 通过老师id获取课程列表
function loadCourseByTeacher(tid){
	teacherNumber = tid;
	TCid = 0;
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/course/'+tid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			$("#classList tr:not(:first)").html("");
			$("#courseList tr:not(:first)").html("");
			$("#courseList").append("<tbody>");
			console.log(data)
			$.each(data.tc,function(index, obj) {
			$("#courseList").append("<tr><td><a href='#' type='button' onclick='loadClassByTC("+obj.teacherCourseId+")'>"
					+ obj.courseName
					+ "</a></td><td><a href='#' type='button' onclick='loadDeleteTeacherCourse("
					+ obj.teacherCourseId+"," + tid
					+ ")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#courseList").append("</tbody>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 删除课程 
function loadDeleteTeacherCourse(tcid,tid){
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/deleteBytcid/'+tcid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功");
				loadCourseByTeacher(tid);
			}else{
				$("#courseModalInfo").html("该课程尚有班级在学,不能删除!");
				$("#modalInfo").modal();
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 通过老师课程id加载班级列表
function loadClassByTC(tcid){
	TCid = tcid;
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/class/'+tcid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			console.log(data)
			$("#classList tr:not(:first)").html("");
			$("#classList").append("<tbody>");
			$.each(data.sc,function(index, obj) {
			$("#classList").append("<tr><td>"
					+ obj.studentClass
					+ "</td><td><a href='#' type='button' onclick='loadDeleteClass("
					+ obj.studentCourseId+","+tcid
					+ ")' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#classList").append("</tbody>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 删除班级
function loadDeleteClass(scid,tcid){
	$.ajax({
		type : 'GET',
		url : '${webapp}/teacher/deleteByscid/'+scid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功");
				loadClassByTC(tcid);
			}else{
				
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 添加老师
function loadAddTeacher(){
	var tnum = $("#teacher-number").val();
	$.ajax({
		type : 'POST',
		url : '${webapp}/teacher/addTeacher',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"teacherName" : $("#teacher-name").val(),
			"teacherNumber" : tnum
		}),
		success : function(data) {
			if(data.success){
				$("#addTeacherModal").modal("hide");
				$("#teacher-name").val("");
				$("#teacher-number").val("");
				loadTeacherList(1000);
			}else{
				alert("添加失败");
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	}); 
}

// 添加老师教授的课程
function loadAddTeacherCourse(){

	var cid = $("#select-course").val()
	alert($("#select-course").val());
	if(teacherNumber == 0){
		if(cid=="null"){
			alert("请选择课程!");
		}else{
			$("#courseModalInfo").html("请选择老师!");
			$("#addTeacherCourseModal").modal("hide");
			$("#modalInfo").modal();
		}
	}else{

	$.ajax({
		type : 'POST',
		url : '${webapp}/teacher/addTC',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"courseId" : cid,
			"teacherNumber" : teacherNumber
		}),
		success : function(data) {
			if(data.success){
				$("#addTeacherCourseModal").modal("hide");
				loadCourseByTeacher(teacherNumber);
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

// 添加老师教授课程的班级
function loadAddTeacherCourseClass(){
	if(TCid==0){
		$("#courseModalInfo").html("请选择该老师教授的课程!");
		$("#addTeacherCourseClassModal").modal("hide");
		$("#modalInfo").modal();
	}else{

	$.ajax({
		type : 'POST',
		url : '${webapp}/teacher/addTSC',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"tcid" : TCid,
			"studentClass" : $("#student-class").val()
		}),
		success : function(data) {
			if(data.success){
				$("#addTeacherCourseClassModal").modal("hide");
				loadClassByTC(TCid);
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

// 加载学生列表页面
function loadStudent(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=student",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("学生管理");
			$("#tableDescription").html("这是所有的学生信息");
			loadStudentList();
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 加载学生列表
function loadStudentList(){
	var studentClass = $("#studentClass-search").val();
	if(studentClass==""){
		studentClass="2014158";
	}
	$.ajax({
		type : 'POST',
		url : '${webapp}/student/list',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({"studentClass":studentClass}),
		success : function(data) {
			console.log(data);
			$("#studentList tr:not(:first)").html("");
			$("#studentList").append("<tbody>");
			$.each(data.students,function(index, obj) {
			$("#studentList").append("<tr><td>"
					+ (index + 1)
					+ "</td><td>"
					+ obj.studentNumber
					+ "</td><td>"
					+ obj.studentClass
					+ "</td><td>"
					+ obj.studentName
					+ "</td><td><a href='#' type='button' onclick='loadDeleteStudent("
					+ obj.studentId
					+ ")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#studentList").append("</tbody>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
// 添加学生
function loadAddStudent(){
	var snum = $("#student-number").val();
	$.ajax({
		type : 'POST',
		url : '${webapp}/student/add',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"studentName" : $("#student-name").val(),
			"studentNumber" : snum
		}),
		success : function(data) {
			if(data.success){
				$("#addStudentModal").modal("hide");
				$("#student-name").val("");
				$("#student-number").val("");
				loadStudentList();
			}else{
				alert("添加失败");
			}
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	}); 
}
// 删除学生
function loadDeleteStudent(sid){
	$.ajax({
		type : 'GET',
		url : '${webapp}/student/delete/'+sid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功");
				loadStudentList();
			}else{
				
			}
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}


// 显示题目列表
function loadQuestionList(pageNumber){
	var qtype = $("#select-qtype").val();
	var type = "";
	$.ajax({
		type : 'POST',
		url : '${webapp}/exquestion/list',
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"pageNumber":pageNumber,
			"pageSize":3,
			"qtype":qtype
		}),
		success : function(data) {
			console.log(data);
			
			$("#questionList tr:not(:first)").html("");
			$("#questionList").append("<tbody>");
			$.each(data.questions.data,function(index, obj) {
				if(obj.type==1){type="单选题"}else if(obj.type==2){type="多选题"}else{type="问答题"}
			$("#questionList").append("<tr><td>"
					+ (index + 1)
					+ "</td><td>"
					+ obj.topic
					+ "</td><td>"
					+ obj.optionList
					+ "</td><td>"
					+ type
					+ "</td><td><a href='#' type='button' onclick='loadDeleteQuestion("
					+ obj.exquestionId+","+pageNumber
					+ ")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
					+ "</a></td></tr>");
					})
			$("#questionList").append("</tbody>");
			$(".pagination").empty("");
			$(".pagination").append("<li " + (pageNumber == 1 ? "class='disabled'" : '') + "><a aria-label='Previous' onclick='loadQuestionList(" + (pageNumber-1) + ")'><span aria-hidden='true'>&laquo;</span></a></li>");
			for (var i = 1; i <= data.questions.pageCount; i++) {
                $(".pagination").append("<li id='currentPage'" + (pageNumber == i ? "class='active'" : '') + "><a aria-label='Previous' onclick='loadQuestionList(" + i + ")'>" + i + "</a></li>");
            }
			$(".pagination").append("<li " + (pageNumber == data.questions.pageCount ? "class='disabled'" : '') + "><a aria-label='Next' onclick='loadQuestionList(" + (pageNumber+1) + ")'><span aria-hidden='true'>&raquo;</span></a></li>");
			
        },
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}

//加载题目管理页面
function loadQuestion(){
	$.ajax({
		type:"POST",
		url:"${webapp }/system/chengePage",
		data:"path=exquestion",
		success:function(data){
			$("#main-body").html(data);
			$("#tableName").html("题目管理");
			$("#tableDescription").html("这是题库的题目信息");
			loadQuestionList(1);
		},
		error : function(msg) {
			alert(JSON.stringify(msg));
		}
	});
}
//动态添加input
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
//根据select选项调整选项内容
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

//获取问题内容并保存 
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
		url : '${webapp}/exquestion/add',
		async : true,
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify({
			"type" : $("#select-questionType").val(),
			"topic" : $("#question-name").val(),
			"optionList" : option
		}),
		success : function(data) {
			if(data.success){
				alert("添加成功");
				$("#addQuestionModal").modal("hide");
				loadQuestionList(1000);
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
// 删除题目
function loadDeleteQuestion(qid,pageNumber){
	$.ajax({
		type : 'GET',
		url : '${webapp}/exquestion/delete/'+qid,
		async : true,
		// 说明提交给
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		data : JSON.stringify(),
		success : function(data) {
			if(data.success){
				alert("删除成功");
				loadQuestionList(pageNumber);
			}else{
				alert("删除失败");
			}
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

</script>
</body>
</html>
