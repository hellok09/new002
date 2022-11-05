package org.academy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CourseVideoVO {


	private String class_code;
	
	private String movietitle;
	
	
	private Date enter;
	private Date updatedate;
	
	private String vno;
	
	private String classnum;
	private String class_name;
	
	private List<CourseVideoAttachVO> videoList;
	
	private List<CourseVO> courseList;
	
	
}
