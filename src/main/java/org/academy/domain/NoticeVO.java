package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private String notice_code;
	private String admin_id;
	private String title;
	private String content;
	private String status;
	private int views;
	private Date enter;
	private Date updatedate;
}
