package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CourseAttachVO {
	
	private String uuid;
	private String class_code;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Date enter;
	private Date updatedate;
	

}
