package org.academy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Student_detailVO {
	
	
	private String STU_ID, BRANCHCODE,PWD,NAME,ADDRESS,GENDER,EMAIL,PHONE,AGREE_AD,STATUS; 
	private Date ENTER, UPDATEDATE;

}
