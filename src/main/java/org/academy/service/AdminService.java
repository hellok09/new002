package org.academy.service;

import java.util.List;


import org.academy.domain.StudentVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.domain.Student_detailVO;

public interface AdminService {
	/*회원목록*/
	public List<StudentVO> getList();
	
	/*상세조회*/
	Student_detailVO getStudentView(String STU_ID);
	/*회원삭제*/
	void getStudentDelete(String STU_ID);
	
	//============================================================
	
	public List<AdminVO> getadminList();

	Admin_detailVO getAdminView(String ADMIN_ID);

	void getAdminDelete(String ADMIN_ID);



	
	
	


	


	

 
}


