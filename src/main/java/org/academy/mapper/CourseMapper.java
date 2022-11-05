package org.academy.mapper;

import java.util.List;

import org.academy.domain.CourseVO;
import org.academy.domain.CourseVideoVO;
import org.academy.domain.CourseCriteria;

public interface CourseMapper {

	
	
	public List<CourseVO> getPaging(CourseCriteria cri);
	
	public void insertCourse(CourseVO course);
	
	public CourseVO read(String class_code);
	
	public int delete(String class_code);
	
	public int modifyCourse(CourseVO course);
	
	public int getTotal(CourseCriteria cri);
	
	public List<CourseVO> findclasscode(String class_code);
}
