package cn.xyj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xyj.bean.Emplovee;
import cn.xyj.bean.EmploveeExample;
import cn.xyj.bean.EmploveeExample.Criteria;
import cn.xyj.dao.EmploveeMapper;
@Service
public class EmployeeService {

	@Autowired
	EmploveeMapper emploveeMapper;
	public List<Emplovee> getAll() {
		// TODO Auto-generated method stub
		return emploveeMapper.selectByExampleWithDept(null);
	}
	public void saveEmp(Emplovee emplovee) {
		emploveeMapper.insert(emplovee);
	}
	/**
	 * 
	 * @param empName
	 * @return true 表示可用
	 */
	public boolean checkuser(String empName) {
		EmploveeExample example=new EmploveeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count=emploveeMapper.countByExample(example);
		return count==0;
	}
	public Emplovee getEmp(Integer id) {
		// TODO Auto-generated method stub
		return emploveeMapper.selectByPrimaryKey(id);
	}
	public void upDateEmp(Emplovee emplovee) {
		emploveeMapper.updateByPrimaryKeySelective(emplovee);
	}
	public void deleteEmpById(Integer id) {
		emploveeMapper.deleteByPrimaryKey(id);
	}
	public void deleteBatch(List<Integer> ids) {
		EmploveeExample example=new EmploveeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpIdIn(ids);
		emploveeMapper.deleteByExample(example);
	}

}
