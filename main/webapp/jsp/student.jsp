<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title" id="tableName">Datatable</span>
                        <div class="description" id="tableDescription"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">                      
                                    <div class="card-title">
                                    <div class="title">学生列表</div>                                            
                                    </div>
                                    <div class="pull-right card-action">
                                    	<div class="btn-group" role="group">
	                                    	<input type="text" id="studentClass-search" placeholder="请输入班级">
                                   		</div>
                                    	<div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" onclick="loadStudentList()"><i class="fa fa-search"></i></button>
                                    	</div>
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#addStudentModal"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-8">
                                    <table class="datatable table table-striped" id="studentList" cellspacing="0" width="100%">
                                            <tr>
                                                <th>序号</th>
                                                <th>学号</th>
                                                <th>班级</th>
                                                <th>姓名</th>
                                                <th>删除</th> 
                                            </tr>
                                    </table>
                                </div>
                                <div class="col-xs-2"></div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    