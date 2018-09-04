package cn.xyj.bean;

import javax.validation.constraints.Pattern;

public class Emplovee {
    private Integer empId;

    private Integer dId;

    @Pattern(regexp="(^[a-z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
    		message="+++用户名必须是2-5位汉字或者6-16位的英文组合！")
    private String email;

    private String gendar;

    @Pattern(regexp="(^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
    		message="+++邮箱格式不正确！")
    private String empName;
    //查询员工带上部门
    private Department department;
    
    public Emplovee() {
		super();
	}

	public Emplovee(Integer empId, Integer dId, String email, String gendar, String empName) {
		super();
		this.empId = empId;
		this.dId = dId;
		this.email = email;
		this.gendar = gendar;
		this.empName = empName;
	
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGendar() {
        return gendar;
    }

    public void setGendar(String gendar) {
        this.gendar = gendar == null ? null : gendar.trim();
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }
}