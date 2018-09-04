package cn.xyj.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.xyj.bean.Emplovee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	@Before
	public void initMokcMvc() {
		mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		MvcResult andReturn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		MockHttpServletRequest request = andReturn.getRequest();
		PageInfo<Emplovee> pageInfo=(PageInfo<Emplovee>) request.getAttribute("pageInfo");
		System.out.println("当前页码："+pageInfo.getPageNum());
		System.out.println("总页码："+pageInfo.getPages());
		System.out.println("总记录数："+pageInfo.getTotal());
		System.out.println("需要连续显示的页码");
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.println(""+i);
		}
		System.out.println("获取员工数据：");
		List<Emplovee> list = pageInfo.getList();
		for (Emplovee emplovee : list) {
			System.out.println("ID:"+emplovee.getdId()+"姓名："+emplovee.getEmpName());
			
		}
	}
}
