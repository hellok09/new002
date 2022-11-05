package org.academy.mapper;

import java.util.List;

import org.academy.domain.CourseVO;
import org.academy.domain.CourseCriteria;

public interface CourseMapper {

	public List<CourseVO> getList();
	
	public List<CourseVO> getPaging(CourseCriteria cri);
	
	public void insertCourse(CourseVO course);
	
	public CourseVO read(Long class_code);
	
	public int deleteCourse(Long class_code);
	
	public int modifyCourse(CourseVO class_code);
	
	public int getTotalCount(CourseCriteria cri);
}
