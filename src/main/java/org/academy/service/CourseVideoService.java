package org.academy.service;

import java.util.List;


import org.academy.domain.CourseVO;
import org.academy.domain.CourseVideoAttachVO;
import org.academy.domain.CourseVideoVO;

public interface CourseVideoService {
	
	public void videoRegister(CourseVideoVO video);
	
	public CourseVideoVO videoRead(String vno);
	
	public boolean videoModify(CourseVideoVO video);
	
	public boolean videoRemove(String vno);
	
	public List<CourseVideoVO> videoGetList(String class_code);
	
	public List<CourseVideoAttachVO> getVideoList(String vno);
	
	
	public List<CourseVO> getCourseList(String class_code);


}
