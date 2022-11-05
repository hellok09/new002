package org.academy.mapper;

import java.util.List;

import org.academy.domain.CourseAttachVO;

public interface CourseAttachMapper {
	
	public void insert(CourseAttachVO courseAttachVo);
	
	
	
	public List<CourseAttachVO> findByCode(String class_code);
	
	public void deleteAll(String class_code);
	
	public List<CourseAttachVO> getOldFiles();

}
