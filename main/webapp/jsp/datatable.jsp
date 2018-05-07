<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title" id="tableName">Datatable</span>
                        <div class="description" id="tableDescription">with jquery Datatable for display data with most usage functional. such as search, ajax loading, pagination, etc.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title">问卷列表</div>
                                    </div>
                                     <div class="pull-right card-action">
                                     	<div class="btn-group" role="group">
	                                    	<select id="query-select-course" class="form-control select-course">
                         	  					<option value=null>--请选择课程--</option>
                      						</select>
                                   		</div>
                                    	<div class="btn-group" role="group">
	                                    	<input type="text" id="time-search-begin" class="form-control" placeholder="请选择开始时间">
                                   		</div>
                                    	<div class="btn-group" role="group">
	                                    	<input type="text" id="time-search-end" class="form-control" placeholder="请选择结束时间">
                                   		</div>
                                    	<div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" id="survey-query-button" onclick="loadSurveyResultList(2)"><i class="fa fa-search"></i></button>
                                    	</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="datatable table table-striped" id="surveyList" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>标题</th>
                                                <th>描述</th>
                                                <th>课程</th>
                                                <th>创建时间</th>
                                                <th>编辑</th>
                                                <th>删除</th>
                                                <th>发布</th>
                                                
                                            </tr>
                                        </thead>   
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
<script type="text/javascript">
$(document).ready(function() {


});
</script>