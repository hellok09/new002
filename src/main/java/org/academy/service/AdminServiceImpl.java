package org.academy.service;

import java.util.List;


import org.academy.domain.StudentVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.domain.Student_detailVO;
import org.academy.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	/*切积格废*/
	@Override
	public List<StudentVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList...................");
		
		return mapper.getList();
	}
	/*切积 惑技炼雀*/
	@Override
	public Student_detailVO getStudentView(String STU_ID) {
		// TODO Auto-generated method stubs
		log.info("get...................");
		
		return mapper.getStudentView(STU_ID);
	}
	
	/*切积 昏力*/
	@Override
	public void getStudentDelete(String STU_ID) {
		mapper.getStudentDelete(STU_ID);
	}
	
	
	//=========================================
	
	
	
	/*包府磊格废*/
	@Override
	public List<AdminVO> getadminList() {
		// TODO Auto-generated method stub
		return mapper.getadminList();
	}
	
	/*包府磊 惑技炼雀*/
	@Override
	public Admin_detailVO getAdminView(String ADMIN_ID) {
		// TODO Auto-generated method stub
		log.info("get...................");
		
		return mapper.getAdminView(ADMIN_ID);
	}
	/*包府磊 昏力*/
	@Override
	public void getAdminDelete(String ADMIN_ID) {
		mapper.getAdminDelete(ADMIN_ID);
		// TODO Auto-generated method stub
		
	}
	
}

 
	


	
 

