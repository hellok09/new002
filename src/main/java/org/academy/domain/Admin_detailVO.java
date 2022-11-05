package org.academy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Admin_detailVO {
	
	
	private String ADMIN_ID, BRANCHCODE,PWD,NAME,ADDRESS,BIRTH,GENDER,PHONE,STATUS; 
	private Date ENTER, UPDATEDATE;

}
