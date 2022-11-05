package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CourseAttachVO {
	
	private String uuid;
	private Long class_code;
	private String fileName;
	private String uploadPath;
	private boolean fileType;
	private Date enter;
	private Date upadtedate;
}
