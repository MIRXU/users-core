package cn.xyj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xyj.bean.Department;
import cn.xyj.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	public List<Department> getDepts() {
		// TODO Auto-generated method stub
		return departmentMapper.selectByExample(null);
	}

}
