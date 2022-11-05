package org.academy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CourseVideoAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Date enter;
	private Date updatedate;
	
	private String vno;
	
	
}
