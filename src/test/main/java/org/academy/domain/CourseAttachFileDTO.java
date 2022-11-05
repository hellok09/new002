package org.academy.domain;

import lombok.Data;

@Data
public class CourseAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
