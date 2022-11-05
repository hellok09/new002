package org.academy.domain;

import java.util.Date;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MemberVO {
	
	private String admin_id;
	private String BRANCHCODE;
	private String admin_code;
	private String PWD;
	private String NAME;
	private String ADDRESS;
	private String GENDER;

	private String PHONE;
	
	private String STATUS;
	private Date ENTER;
	private Date UPDATEDATE;
	private String BIRTH;
	
}
