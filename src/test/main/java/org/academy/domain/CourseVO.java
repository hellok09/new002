package org.academy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CourseVO {

	private Long class_code;
	
	private Long course_code;
	private String Status;
	private String class_name;
	private String teacher_name;
	private int tuition;
	private Date start_date;
	private Date end_date;
	private String start_time;
	private String end_time;
	private String class_target;
	private Date enter;
	private Date updatedate;



	private List<CourseVO2> coursevo2;
	private List<CourseAttachVO> courseAttach;
}
