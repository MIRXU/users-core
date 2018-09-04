<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.8.2.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>员工列表</title>
</head>
<body>
	<div class="container">
	<!-- 标题 -->
		<div class="row">
			<dir class="col-md-12">
				<h1>SSM-CRUD</h1>
			</dir>
		</div>
		<!-- 按钮 -->
		<div class="row">
			 <div class="col-md-4 col-md-offset-8">
			 	<button  class="btn btn-primary btn-sm">新增</button>
			 	<button class="btn btn-danger btn-sm">删除</button>
			 </div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>电子邮箱</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<th>${emp.empId }</th>
						<th>${emp.empName }</th>
						<th>${emp.gendar=="f"?"女":"男" }</th>
						<th>${emp.email }</th>
						<th>${emp.department.deptName }</th>
						<th>
							<button class="btn btn-primary btn-sm">
								<span class="glyphicon  glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon  glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</th>
					</tr>
					</c:forEach>
					
				</table>
			
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6">
				当前${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }记录
			</div>
			<div class="col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
			  <c:if test="${pageInfo.hasPreviousPage}">
			   <li>
			      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  </c:if>
			   
			    <c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
			    		 <c:if test="${pageNum==pageInfo.pageNum }">
			    		 <li class="active"><a href="#">${pageNum }</a></li>
			    		 </c:if>
			    		 <c:if test="${pageNum!=pageInfo.pageNum }">
			    		 <li><a href="${APP_PATH }/emps?pn=${pageNum }">${pageNum }</a></li>
			    		 </c:if>
			    </c:forEach>
			    <c:if test="${pageInfo.hasNextPage }">
			    <li>
			      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
			    
			    <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">尾页</a></li>
			  </ul>
		</nav>
			</div>
		</div>
	</div>
</body>
</html>