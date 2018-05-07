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
                                    <div class="title">问卷信息</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-6">
                                <form>
                                <div class="row">
                                <div class="col-xs-6">
		                        <div class="form-group">
		                    		<label for="recipient-name" class="control-label">所属课程</label>
		                      	 	<select id="select-course-auto" class="form-control select-course">
		                         	   <option value='null'>--请选择--</option>
		                      		</select>
		                        </div>
                                </div>
                                </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">问卷标题</label>
                            <input type="text" class="form-control" id="survey-name-auto">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">描述</label>
                            <textarea class="form-control" id="description-auto"></textarea>
                        </div>
                    </form>
                    </div>
                                <div class="col-xs-4"></div>
                                </div>
                                </div>
                                 <div class="card-header">

                                    
                                    <div class="card-title">
                                    <div class="title">题目列表</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-8">
                                    <table class="datatable table table-striped" id="questionList" cellspacing="0" width="100%">
                                            <tr>
                                                <th>序号</th>
                                                <th>题目</th>
                                                <th>选项</th>
                                                <th>类型</th>
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
                    <div class="row">
                	<div class="col-xs-4"></div>
                	<div class="col-xs-2"><button type="button" class="btn btn-info" onclick="loadSaveAutoSurvey(1)">再次编辑</button></div>
                	<div class="col-xs-2"><button type="button" class="btn btn-info" onclick="loadSaveAutoSurvey(2)">确定出卷</button></div>
                	
                	<div class="col-xs-4"></div>
                	</div>
                
         
                </div>
            </div>
    