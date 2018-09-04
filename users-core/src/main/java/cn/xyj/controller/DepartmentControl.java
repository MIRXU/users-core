package cn.xyj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xyj.bean.Department;
import cn.xyj.bean.Msg;
import cn.xyj.service.DepartmentService;

/**
 * 处理部门有关信息
 * @author Administrator
 *
 */
@Controller
public class DepartmentControl {
	@Autowired
	private DepartmentService departmentService;
	/**
	 * 查询所有部门信息
	 */
	@RequestMapping("/depts")
	@ResponseBody
	private Msg getDepts() {
		List<Department> list=departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
