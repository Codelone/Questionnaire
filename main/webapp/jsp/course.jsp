<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title" id="list-title">List</span>
                        <div class="description" id="list-description">A list-group elements.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title">课程列表</div>
                                    </div>
                                    
                                </div>
                                <div class="card-body">
                                <div class="row">
                        			<div class="col-xs-6">
                                    <div class="sub-title">课程分类</div>
                                    <div>
                                        <div class="list-group" id="list-category">
                                            
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-xs-6">
                                    	<div class="sub-title">课程
                                    	<div class="pull-right">
                                    	<button type="button" class="btn btn-xs btn-default" onclick="loadAddCourseModal()">
                                    	<i class="fa fa-plus"></i>
                                    	</button></div>
                                    	</div>
                                    	
                                    	<div>
                                        <ul class="list-group" id="list-course">
                                            
                                        </ul>
                                    	</div>
                                    </div>

                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 模态框 -->
                    <!-- 添加课程模态框   -->
                    <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">添加课程</h4>
								</div>
								<div class="modal-body">
								<form>
			                        <div class="form-group">
			                            <label for="recipient-name" class="control-label" id="categoryName"></label>
			                            <input type="text" class="form-control" id="category-id">
			                        </div>
			                    </form>
								<form>
			                        <div class="form-group">
			                            <label for="recipient-name" class="control-label">课程名</label>
			                            <input type="text" class="form-control" id="course-name">
			                        </div>
			                    </form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" onclick="loadAddCourse()">确定</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 删除提示  -->
                    <div class="modal fade modal-info" id="modalInfoWithSurvey" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
			

		</div>
            </div>
         </div>