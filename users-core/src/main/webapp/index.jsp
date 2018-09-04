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
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<title>员工列表</title>
</head>
<body>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			     <p class="form-control-static" id="empName_Update_input"></p>
			    	<span  class="help-block"></span> 
			    </div>
			  </div>
			  <div class="form-group">
			    	<label class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      	<input type="text"  name="email" class="form-control" id="email_Update_input" placeholder="xyj@qq.com">
				    	<span  class="help-block"></span> 
				    </div>
			  </div>
			  <div class="form-group">
			     	<label class="col-sm-2 control-label">gendar</label>
			     <div class="col-sm-10">
				   	<label class="radio-inline">
					  	<input type="radio" name="gendar" id="gendar1_Update_input" value="m" checked="checked">男
					</label>
					<label class="radio-inline">
					  	<input type="radio" name="gendar" id="gendar2_Update_input" value="f">女
					</label>
				</div>
		  </div>
			<div class="form-group">
			    	<label class="col-sm-2 control-label">deptName</label>
				   <div class="col-sm-4">
					   <select class="form-control" name="dId" id="dept_add_select">
					
						</select>
					</div>
			  </div>  
  		</div>
	</form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_Update_btn">更新</button>
      </div>
    </div>
  </div>
</div>

		<!-- 员工添加的模态框 -->
	<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
			    	<span  class="help-block"></span> 
			    </div>
			  </div>
			  <div class="form-group">
			    	<label class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      	<input type="text"  name="email" class="form-control" id="email_add_input" placeholder="xyj@qq.com">
				    	<span  class="help-block"></span> 
				    </div>
			  </div>
			  <div class="form-group">
			     	<label class="col-sm-2 control-label">gendar</label>
			     <div class="col-sm-10">
				   	<label class="radio-inline">
					  	<input type="radio" name="gendar" id="gendar1_add_input" value="m" checked="checked">男
					</label>
					<label class="radio-inline">
					  	<input type="radio" name="gendar" id="gendar2_add_input" value="f">女
					</label>
				</div>
		  </div>
			<div class="form-group">
			    	<label class="col-sm-2 control-label">deptName</label>
				   <div class="col-sm-4">
					   <select class="form-control" name="dId" id="dept_add_select">
					
						</select>
					</div>
			  </div>  
  		</div>
	</form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
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
			 	<button  class="btn btn-primary btn-sm" id="emp_add_btn">新增</button>
			 	<button class="btn btn-danger btn-sm" id="delete_all_btn">删除</button>
			 </div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered" id="emps_table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="check_all"/>
						</th>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>电子邮箱</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					</tbody>
					
				</table>
			
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info">
			</div>
			<div class="col-md-6" id="page_nav">
			
			</div>
		</div>
		
	</div>
	
<script type="text/javascript">
		//1、ajax
		var totalRecord,currentNum;
		$(function(){
			to_page(1);
		});
		function build_emps_table(result){
			$("#emps_table tbody").empty();
			var emps=result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var checkboxTd=$("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd=$("<td></td>").append(item.empId);
				var empNameTd=$("<td></td>").append(item.empName);
				var empgendarTd=$("<td></td>").append(item.gendar=='f'?"女":"男");
				var empemailTd=$("<td></td>").append(item.email);
				var empedeptNameTd=$("<td></td>").append(item.department.deptName);
				var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon  glyphicon-pencil")).append("编辑");
				editBtn.attr("edit-id",item.empId);
				var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon  glyphicon-trash")).append("删除");
				delBtn.attr("delete-id",item.empId);
				var btnTd=$("<td></td").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkboxTd)
				.append(empIdTd)
				.append(empNameTd)
				.append(empgendarTd)
				.append(empemailTd)
				.append(empedeptNameTd)
				.append(btnTd)
				.appendTo("#emps_table tbody");
			});
		}
		//解析分页信息
		function build_page_info(result){
			$("#page_info").empty();
			$("#page_info").append("当前"+result.extend.pageInfo.pageNum+"页，总共"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"记录");
			totalRecord=result.extend.pageInfo.total;
			currentNum=result.extend.pageInfo.pageNum;
		}
		//解析分页条
		function build_page_nav(result){
			$("#page_nav").empty();
			var ul=$("<ul></ul>").addClass("pagination");
			var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePage=$("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage==false){
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			}else{
				firstPage.click(function(){
					to_page(1);
				});
				prePage.click(function(){
					to_page(result.extend.pageInfo.pageNum-1);
				});
			}
			
			var netxPage=$("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage==false){
				netxPage.addClass("disabled");
				lastPage.addClass("disabled");
			}else{
				netxPage.click(function(){
					to_page(result.extend.pageInfo.pageNum+1);
				});
				lastPage.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			ul.append(firstPage).append(prePage);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			})
			ul.append(netxPage).append(lastPage);
			var navEle=$("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav");
		}
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"get",
				success:function(result){
					//console.log(result);
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		//表单重置
		function reset(ele){
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text();
		}
		//点击弹出模态框
		$("#emp_add_btn").click(function(){
			//$("#empAddModal form")[0].reset();
			reset("#empAddModal form");
			getDepts("#empAddModal select");
			//查出部门信息显示下拉列表
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		//查部门信息
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					//{"code":100,"msg":"处理成功！","extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
					//console.log(result);
					
					$.each(result.extend.depts,function(){
						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					});
			}
		});
		}
		//校验员工信息
		function validate_add_form(){
			var empName=$("#empName_add_input").val();
			var regName=/(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				show_validate_msg("#empName_add_input","error","用户名必须是2-5位汉字或者6-16位的英文组合！");
				//$("#empName_add_input").parent().addClass("has-warning");
				//$("#empName_add_input").next("span").text("用户名必须是2-5位汉字或者6-16位的英文组合！");
				return false;
			}else{
				show_validate_msg("#empName_add_input","success","");
				//$("#empName_add_input").parent().addClass("has-success");
				//$("#empName_add_input").next("span").text("");
			}
			var email=$("#email_add_input").val();
			var regEmail=	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确！");
				show_validate_msg("#email_add_input","error","邮箱格式不正确！");
				//$("#email_add_input").parent().addClass("has-warning");
				//$("#email_add_input").next("span").text("邮箱格式不正确！");
				return false;
			}else{
				show_validate_msg("#email_add_input","success","");
				//$("#email_add_input").parent().addClass("has-success");
				//$("#email_add_input").next("span").text("");
			}
			return true;
		}
		//前台校验
		function show_validate_msg(ele,status,msg){
			//清除元素状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//后台校验
		$("#empName_add_input").change(function(){
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				type:"post",
				data:"empName="+empName,
				success:function(result){
					if(result.code==100){
						show_validate_msg("#empName_add_input","success","用户名可用！");
						$("#emp_save_btn").attr("ajax-va","success");
					}else{
						show_validate_msg("#empName_add_input","error",result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//点击保存员工
		$("#emp_save_btn").click(function(){
			//校验员工信息
			if(!validate_add_form()){
				return false;
			}
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"post",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					if(result.code==100){
					//alert(result.msg);
					$('#empAddModal').modal('hide');
					to_page(totalRecord);
					}else{						
						if(undefind!=result.extent.errorFileds.email){
							show_validate_msg("#email_add_input","error",result.extend.email);
						}
						if(undefind!=result.extent.errorFileds.empName){
							show_validate_msg("#empName_add_input","error",result.extend.empName);
						}
					}
				}
			});
		});
		$(document).on("click",".edit_btn",function(){
			getDepts("#empUpdateModal select" );
			getEmp($(this).attr("edit-id"));
			$("#emp_Update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"get",
				success:function(result){
					var empDate=result.extend.emp;
					$("#empName_Update_input").text(empDate.empName);
					$("#email_Update_input").val(empDate.email);
					$("#empUpdateModal input[name=gendar]").val([empDate.gendar]);
					$("#empUpdateModal select").val([empDate.dId]);
				}
			});
		}
		//更新
		$("#emp_Update_btn").click(function(){
			
			var email=$("#email_Update_input").val();
			var regEmail=	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_Update_input","error","邮箱格式不正确！");
				//$("#email_add_input").parent().addClass("has-warning");
				//$("#email_add_input").next("span").text("邮箱格式不正确！");
				return false;
			}else{
				show_validate_msg("#email_Update_input","success","");
				//$("#email_add_input").parent().addClass("has-success");
				//$("#email_add_input").next("span").text("");
			}
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"put",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					$('#empUpdateModal').modal('hide');
					to_page(currentNum);
				}
			});
		});
		//删除
		$(document).on("click",".delete_btn",function(){
			var empName=$(this).parents("tr").find("td:eq(2)").text();
			var empId=$(this).attr("delete-id");
			if(confirm("确认删除【"+empName+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentNum);
					}
				});
			}
		});
		$("#check_all").click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
			
		});
		$(document).on("click",".check_item",function(){
			//判断是否是5个元素
			var flag=$(".check_item:checked").length==$(".check_item").length;
			
			$("#check_all").prop("checked",flag);
		});
		//全部批量删除
		$("#delete_all_btn").click(function(){
			var empNames="";
			var del_idstr="";
			$.each($(".check_item:checked"),function(){
				empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
				del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			del_idstr=del_idstr.substring(0,del_idstr.length-1)
			if(confirm("确认删除【"+empNames.substring(0,empNames.length-1)+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/emp/"+del_idstr,
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentNum);
					}
				});
			}
		});
		</script>

	
</body>
</html>