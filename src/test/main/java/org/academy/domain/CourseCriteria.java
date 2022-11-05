package org.academy.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CourseCriteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	
	public CourseCriteria() {
		this(1,10);
	}
	
	public CourseCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		
		return type == null ? new String[] {} : type.split(""); 
	}
	
}
