package org.academy.mapper;

import java.util.List;

import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseVideoAttachVO;

public interface CourseVideoAttachMapper {
	
	public void insert(CourseVideoAttachVO videoAttach);
	
	public void delete(String uuid);
	
	public List<CourseVideoAttachVO> findByCode(String vno);
	
	public void deleteAll(String vno);
	
	public List<CourseVideoAttachVO> getOldFiles();

}
