package org.academy.service;

import java.util.List;

import org.academy.domain.CourseVO;
import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;

public interface CourseService {

	public void register(CourseVO course);
	
	public CourseVO get(Long class_code);

	public boolean modify(CourseVO course);
	
	public boolean delete(Long class_code);
	
	
	
	public List<CourseVO> getList(CourseCriteria cri);
	
	public int getTotal(CourseCriteria cri);
	
	public List<CourseAttachVO> getCourseAttachList(Long class_code);
}
