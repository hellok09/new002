package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InqueryVO {
	private String oi_code;
	private String class_code;
	private String stu_id;
	private String name;
	private String contact_detail;
	private String content;
	private String oi_status;
	private String branch_code;
	private String course_code;
	private Date enter;
	private Date updatedate;
	private String title;
	private String course_name;
}
