package org.academy.mapper;

import java.util.List;

import org.academy.domain.CourseAttachVO;

public interface CourseAttachMapper {

	public void insert(CourseAttachVO vo);
	
	public void delete(String uuid);
	
	public List<CourseAttachVO> findByCode(Long class_code);
	
	public List<CourseAttachVO> getOldFiles(Long class_code);
	
	public void deleteAll(Long class_code);
}
