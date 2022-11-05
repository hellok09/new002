package org.academy.mapper;

import java.util.List;

import org.academy.domain.StudentVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.domain.Student_detailVO;

public interface AdminMapper {

	
	// �Խù� �ҷ����� 
	public List<StudentVO> getList();
	
	//�л�����ȸ

	public Student_detailVO getStudentView(String STU_ID);
	
	//delete
	
	public void getStudentDelete(String STU_ID); 

//=============================================
	
	//������ȸ
	public List<AdminVO> getadminList();


	//�������ȸ

	public Admin_detailVO getAdminView(String ADMIN_ID);
	
	//����
	
	public void getAdminDelete(String ADMIN_ID); 

	
	
	
}
