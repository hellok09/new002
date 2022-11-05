package org.academy.service;

import java.util.List;

import org.academy.domain.CourseVO;

import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;
import org.academy.mapper.CourseAttachMapper;
import org.academy.mapper.CourseMapper;
import org.academy.mapper.CourseVideoMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CourseServiceImpl implements CourseService {
	
	private CourseMapper mapper;
	private CourseAttachMapper attachMapper;
	
	
	
	@Override
	@Transactional
	public void register(CourseVO course) {
		log.info("register" + course);
		
		mapper.insertCourse(course);
	
		if(course.getCourseAttach() == null || course.getCourseAttach().size()<=0) {
			
			return;
		}
		course.getCourseAttach().forEach(attach -> {
			attach.setClass_code(course.getClass_code());
			
			attachMapper.insert(attach);
		});
		
		
		
		
	}
	

	
	
	
	@Override
	public List<CourseVO> getList(CourseCriteria cri) {
		
		
	
		log.info("get List with criteria............................" +cri);
		
		return mapper.getPaging(cri);
	}
	
	
	@Override
	public int getTotalCount(CourseCriteria cri) {
		
		log.info("get total count");
		return mapper.getTotal(cri);
	}
	
	@Override
	public CourseVO get(String class_code) {
		// TODO Auto-generated method stub
		log.info("class_code..............." +class_code);
		
		return mapper.read(class_code);
	}
	
	
	@Override
	@Transactional
	public boolean deleteCourse(String class_code) {
		// TODO Auto-generated method stub
		
		log.info("remove...." +class_code);
		
		attachMapper.deleteAll(class_code);
		return mapper.delete(class_code) == 1;
	}

	@Override
	@Transactional
	public boolean modify(CourseVO course) {
		// TODO Auto-generated method stub
		
		log.info("modify....."+ course);
		
		
		attachMapper.deleteAll(course.getClass_code());
		
		boolean modifyResult = mapper.modifyCourse(course) == 1;
	
		if(modifyResult && course.getCourseAttach() != null && course.getCourseAttach().size() > 0) {
			
			course.getCourseAttach().forEach(attach -> {
				
				attach.setClass_code(course.getClass_code());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Override
	public List<CourseAttachVO> getCourseAttach(String class_code){
			log.info("get attach...class_Code................"+class_code);
			
			return attachMapper.findByCode(class_code);
	}
}
