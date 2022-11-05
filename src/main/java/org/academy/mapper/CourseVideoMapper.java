package org.academy.mapper;

import java.util.List;


import org.academy.domain.CourseVO;
import org.academy.domain.CourseVideoVO;

public interface CourseVideoMapper {
	
	
	
	public List<CourseVideoVO> videoGetList(String class_code);
	
	
	public void videoInsert(CourseVideoVO video);
	
	public int videoModify(CourseVideoVO video);
	
	public CourseVideoVO read(String vno);
	
	public int deleteVideo(String vno);
	
	public CourseVideoVO code(String class_code);
	


}
