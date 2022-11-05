package org.academy.service;

import java.util.List;

import org.academy.domain.CourseVO;

import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;

public interface CourseService {

	public void register(CourseVO course);
	
	public CourseVO get(String class_code);

	public boolean modify(CourseVO course);
	
	public boolean deleteCourse(String class_code);
	
	
	
	public List<CourseVO> getList(CourseCriteria cri);
	
	public int getTotalCount(CourseCriteria cri);
	
	public List<CourseAttachVO> getCourseAttach(String class_code);
}
