package org.academy.service;

import java.util.List;

import org.academy.domain.CourseVO;
import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;
import org.academy.mapper.CourseAttachMapper;
import org.academy.mapper.CourseMapper;
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
		
		course.getCourseAttach().forEach(attach -> {
			attach.setClass_code(course.getClass_code());
			
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public List<CourseAttachVO> getCourseAttachList(Long class_code){
			log.info("get attach...class_Code................"+class_code);
			
			return attachMapper.findByCode(class_code);
	}
	
	
	@Override
	public List<CourseVO> getList(CourseCriteria cri) {
		
		log.info("get List with criteria............................" +cri);
		
		return mapper.getPaging(cri);
	}
	
	
	@Override
	public int getTotal(CourseCriteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public CourseVO get(Long class_code) {
		// TODO Auto-generated method stub
		log.info("class_code..............." +class_code);
		
		return mapper.read(class_code);
	}
	
	@Transactional
	@Override
	public boolean delete(Long class_code) {
		// TODO Auto-generated method stub
		
		log.info("remove...." +class_code);
		
		attachMapper.deleteAll(class_code);
		return mapper.deleteCourse(class_code) == 1;
	}

	@Override
	@Transactional
	public boolean modify(CourseVO course) {
		// TODO Auto-generated method stub
		
		log.info("modify....."+ course);
		
		attachMapper.deleteAll(course.getClass_code());
		
		boolean modifyResult = mapper.modifyCourse(course) == 1;
		
		if(course.getCourseAttach() != null) {
		if(modifyResult && course.getCourseAttach().size() > 0) {
			course.getCourseAttach().forEach(attach -> {
				attach.setClass_code(course.getClass_code());
				attachMapper.insert(attach);
				
				});
			}
		}
		return modifyResult;
	}
}
