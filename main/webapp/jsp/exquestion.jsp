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
                                    <div class="title">题目列表</div>
                                    
                                    
                                    </div>
                                
                                	
                                
                                    <div class="pull-right card-action">
                                    	<div class="btn-group" role="group">
	                                    	<select id="select-qtype" class="form-control">
                         	  					<option value=0>--请选择题目类型--</option>
                         	  					<option value=1>单选题</option>
                         	  					<option value=2>多选题</option>
                         	  					<option value=3>问答题</option>
                      						</select>
                                   		</div>
                                    	<div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" onclick="loadQuestionList(1)"><i class="fa fa-search"></i></button>
                                    	</div>
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#addQuestionModal"><i class="fa fa-plus"></i></button>
                                        </div>
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
                                    <nav aria-label="Page navigation">
							            <ul class="pagination">
							               
							            </ul>
							        </nav>
                                </div>
                                <div class="col-xs-2"></div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
         
                </div>
            </div>
    