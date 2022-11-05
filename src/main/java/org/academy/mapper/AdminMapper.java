package org.academy.mapper;

import java.util.List;

import org.academy.domain.StudentVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.domain.Student_detailVO;

public interface AdminMapper {

	
	// 게시물 불러오기 
	public List<StudentVO> getList();
	
	//학생상세조회

	public Student_detailVO getStudentView(String STU_ID);
	
	//delete
	
	public void getStudentDelete(String STU_ID); 

//=============================================
	
	//강사조회
	public List<AdminVO> getadminList();


	//강사상세조회

	public Admin_detailVO getAdminView(String ADMIN_ID);
	
	//강사
	
	public void getAdminDelete(String ADMIN_ID); 

	
	
	
}
