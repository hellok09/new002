package org.academy.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CourseVO{

	private String class_code;
	private String branchcode;
	private String course_code;
	private String status;
	private String class_name;
	private String teacher_name;
	private int tuition;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_date;
	private String start_time;
	private String end_time;
	private String class_target;
	private Date enter;
	private Date updatedate;
	
	private String course_name;
	private String branch_name;
	




	
	
	private List<CourseAttachVO> courseAttach;
}

