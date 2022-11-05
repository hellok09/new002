package org.academy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {
	private String BRANCH_NAME,ADMIN_CODE,ADMIN_ID,NAME,STATUS; 
	private Date ENTER, UPDATEDATE;

}

/*
 * select b."BRANCH_NAME" as 지점, l."ADMIN_NAME" as 회원분류, A."ADMIN_ID" as 아이디,
 * A."NAME" as 이름 from "ADMIN" A , "LEV" l ,"BRANCH" b where A."ADMIN_CODE" =
 * l."ADMIN_CODE" and A."BRANCHCODE" = b."BRANCHCODE";
 */