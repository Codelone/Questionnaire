<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        
        <!-- 页面主体 -->
		<!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">编辑问卷</span>
                    </div>
                    
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title" id="survey-title"></div>
                                        <div class="description" id="survey-description"></div>
                                    </div>
                                    <div class="pull-right card-action">
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" onclick="loadQuestionModal()"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row" >
                                	<div class="col-xs-2">
                                	</div>
                                	<div class="col-xs-8">
                                	<form id="addQuestion">
                                	
                                    </form>
                                	</div>
                                	<div class="col-xs-2">
                                	</div>
                                	</div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    
                <div class="row">
                	<div class="col-xs-4"></div>
                	<div class="col-xs-2"><button type="button" class="btn btn-info" onclick="loadSave(1)">保存草稿</button></div>
                	<div class="col-xs-2"><button type="button" class="btn btn-info" onclick="loadSave(2)">提交问卷</button></div>
                	<div class="col-xs-4"></div>
                </div>
                </div>
            </div>        

<script type="text/javascript">



</script>

