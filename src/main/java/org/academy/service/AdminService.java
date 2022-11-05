package org.academy.service;

import java.util.List;


import org.academy.domain.StudentVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.domain.Student_detailVO;

public interface AdminService {
	/*ȸ�����*/
	public List<StudentVO> getList();
	
	/*����ȸ*/
	Student_detailVO getStudentView(String STU_ID);
	/*ȸ������*/
	void getStudentDelete(String STU_ID);
	
	//============================================================
	
	public List<AdminVO> getadminList();

	Admin_detailVO getAdminView(String ADMIN_ID);

	void getAdminDelete(String ADMIN_ID);



	
	
	


	


	

 
}


