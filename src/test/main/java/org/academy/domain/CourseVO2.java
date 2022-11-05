package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CourseVO2 {

	
	private Long course_code;
	private String course_name;
	private String Status;
	private Date enter;
	private Date updatedate;
	private Long branchcode;
	private String branch_name;
}
