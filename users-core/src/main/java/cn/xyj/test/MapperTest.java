package cn.xyj.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/**
 * 使用spring的单元测试
 * @ContextConfiguration指定spring的位置
 * @author Administrator
 *
 */

import cn.xyj.bean.Department;
import cn.xyj.bean.Emplovee;
import cn.xyj.dao.DepartmentMapper;
import cn.xyj.dao.EmploveeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmploveeMapper emploveeMapper;
	@Autowired
	SqlSession sqlSession;
 	@Test
	public void testCRUD(){
//		System.out.println(departmentMapper);
//		departmentMapper.insertSelective(new Department(null, "开发部"));
//		departmentMapper.insertSelective(new Department(null, "测试部"));
//		emploveeMapper.insertSelective(new Emplovee(null, 1, "xx@qq.com", "f", "xx"));
 		EmploveeMapper mapper = sqlSession.getMapper(EmploveeMapper.class);
 		for(int i=0;i<1000;i++) {
 			String uudiname=UUID.randomUUID().toString().substring(0, 5);
 			mapper.insertSelective(new Emplovee(null, 1, uudiname+i+"@qq.com", "f", uudiname+i));
 		}
	}
}
