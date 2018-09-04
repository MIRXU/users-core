package cn.xyj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.xyj.bean.Emplovee;
import cn.xyj.bean.Msg;
import cn.xyj.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids=new ArrayList<Integer>();
			String[] split = ids.split("-");
			for (String string : split) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		}else {
			int id=Integer.valueOf(ids);
			employeeService.deleteEmpById(id);
		}
		return Msg.success();
	}
	@RequestMapping(value="emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg upDateEmp(Emplovee emplovee) {
		employeeService.upDateEmp(emplovee);
		return Msg.success();
	}
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Emplovee emplovee=employeeService.getEmp(id);
		return Msg.success().add("emp",  emplovee);
	}
	
	@RequestMapping(value="checkuser",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkuse(@RequestParam(value="empName")String empName) {
		String relName="(^[a-z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(relName)) {
			return Msg.fail().add("va_msg", "---用户名必须是2-5位汉字或者6-16位的英文组合！");
		}
		boolean isValidate=employeeService.checkuser(empName);
		if(isValidate) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
		
	}
	@RequestMapping(value="emp",method=RequestMethod.POST)
	@ResponseBody
	public  Msg saveEmp(@Valid Emplovee emplovee,BindingResult result) {
		Map<String, Object> map=new HashMap<String, Object>();
		if(result.hasErrors()) {
			List<FieldError> fieldError = result.getFieldErrors();
			for (FieldError iterable_element : fieldError) {
				map.put(iterable_element.getField(), iterable_element.getDefaultMessage());
			}
			return Msg.fail().add("errorFileds", map);
		}else {
			employeeService.saveEmp(emplovee);
			return Msg.success();
		}
		
	}
	@RequestMapping("emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		System.out.println(pn);
		PageHelper.startPage(pn, 5);
		List<Emplovee> emps=employeeService.getAll();
		PageInfo<Emplovee> pageInfo = new PageInfo<Emplovee>(emps,5);
		System.out.println(pageInfo);
		return Msg.success().add("pageInfo", pageInfo);
	}
//	@RequestMapping("/emps")
	private String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<Emplovee> emps=employeeService.getAll();
		PageInfo<Emplovee> pageInfo = new PageInfo<Emplovee>(emps,5);
		model.addAttribute("pageInfo",pageInfo);
		return "list";
	}
}
