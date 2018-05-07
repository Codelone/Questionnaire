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
                                    <div class="title">人员列表</div>
                                    </div>
                                    <div class="pull-right card-action">
                                    	<div class="btn-group" role="group">
	                                    	<input type="text" id="teacher-search" placeholder="请输入教师名字">
                                   		</div>
                                    	<div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" onclick="loadTeacherList(1)"><i class="fa fa-search"></i></button>
                                    	</div>
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#addTeacherModal"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                <div class="row">
                                <div class="col-xs-6">
                                    <table class="datatable table table-striped" id="teacherList" cellspacing="0" width="100%">
                                            <tr>
                                                <th>序号</th>
                                                <th>教师编号</th>
                                                <th>教师姓名</th>
                                                <th>查看课程</th>
                                                <th>删除</th> 
                                            </tr>
                                    </table>
                                    <nav aria-label="Page navigation">
							            <ul class="pagination">
							               
							            </ul>
							        </nav>
                                </div>
                                <div class="col-xs-3">
                                    <table class="datatable table table-striped" id="courseList" cellspacing="0" width="100%">
                                            <tr>
                                                <th>课程</th>
                                                <th><div><a type="button" data-toggle="modal" data-target="#addTeacherCourseModal">
                                    			<i class="fa fa-plus"></i>
                                    			</a></div></th>
                                            </tr>
                                    </table>
                                </div>
                                <div class="col-xs-3">
                                    <table class="datatable table table-striped" id="classList" cellspacing="0" width="100%">
                                            <tr>
                                                <th>班级</th>
                                                <th><div><a type="button" data-toggle="modal" data-target="#addTeacherCourseClassModal">
                                    			<i class="fa fa-plus"></i></a></div></th>                                          
                                            </tr>
                                    </table>
                                </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                		<!-- 删除提示 -->
			<div class="modal fade modal-info" id="modalInfo" tabindex="-1"
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
						<div class="modal-body" id="courseModalInfo">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
						</div>
					</div>
				</div>
			</div>

		
                </div>
            </div>
