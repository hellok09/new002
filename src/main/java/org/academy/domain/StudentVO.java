package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StudentVO {
	private String BRANCH_NAME,ADMIN_CODE,STU_ID,NAME,STATUS; 
	private Date ENTER, UPDATEDATE;

}

/*
 * select b."BRANCH_NAME" as ����, l."ADMIN_NAME" as ȸ���з�, A."ADMIN_ID" as ���̵�,
 * A."NAME" as �̸� from "ADMIN" A , "LEV" l ,"BRANCH" b where A."ADMIN_CODE" =
 * l."ADMIN_CODE" and A."BRANCHCODE" = b."BRANCHCODE";
 */