<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title" id="tableName">填写问卷</span>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title" id="survey-title"></div>
                                    <div class="description" id="survey-description"></div>
                                    <input type="hidden" class="form-control" id="questionnaireId"/>
                                    </div>
                                </div>
                                <div class="card-body">
                                	<div class="row">
                                		<div class="col-xs-2"></div>
                                		<div class="col-xs-8" id="showQuestions">
                                    	
                                        </div>
                                		<div class="col-xs-2"></div>
                                </div>
                                <div class="row">
				                	<div class="col-xs-5"></div>
				                	<div class="col-xs-7"><button type="button" class="btn btn-info" onclick="loadSubmitSurvey()">提交答案</button></div>
                				</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>

                                   
                                     
                                        
