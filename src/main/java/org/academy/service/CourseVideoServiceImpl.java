package org.academy.service;

import java.util.List;

import org.academy.domain.CourseVO;
import org.academy.domain.CourseVideoAttachVO;
import org.academy.domain.CourseVideoVO;
import org.academy.mapper.CourseMapper;
import org.academy.mapper.CourseVideoAttachMapper;
import org.academy.mapper.CourseVideoMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class CourseVideoServiceImpl implements CourseVideoService {


	private CourseVideoMapper mapper;
	private CourseVideoAttachMapper videoMapper;
	private CourseMapper coMapper;
	
	@Override
	@Transactional
	public void videoRegister(CourseVideoVO video) {
		// TODO Auto-generated method stub
		
		mapper.videoInsert(video);
		
		if(video.getVideoList() == null || video.getVideoList().size()<0) {
			return;
		}
		
		video.getVideoList().forEach(attach -> {
			attach.setVno(video.getVno());
			
			videoMapper.insert(attach);
		});

	}

	@Override
	public CourseVideoVO videoRead(String vno) {
		// TODO Auto-generated method stub
		return mapper.read(vno);
	}

	@Override
	@Transactional
	public boolean videoModify(CourseVideoVO video) {
		// TODO Auto-generated method stub
		
		log.info("modify....."+ video);
		
		
		videoMapper.deleteAll(video.getVno());
		
		boolean modifyResult = mapper.videoModify(video) == 1;
	
		if(modifyResult && video.getVideoList() != null && video.getVideoList().size() > 0) {
			
			video.getVideoList().forEach(attach -> {
				
				attach.setVno(video.getVno());
				videoMapper.insert(attach);
			});
		}
		return modifyResult;
	
	}

	@Override
	@Transactional
	public boolean videoRemove(String vno) {
		// TODO Auto-generated method stub
		
		log.info("remove...." +vno);
		
		videoMapper.deleteAll(vno);
		return mapper.deleteVideo(vno) == 1;
	}

	@Override
	@Transactional
	public List<CourseVideoVO> videoGetList(String class_code) {
		// TODO Auto-generated method stub
		log.info("getList...........");
		
		
	 return mapper.videoGetList(class_code);
	}
	
	@Override
	public List<CourseVideoAttachVO> getVideoList(String vno){
		log.info("get attach.......................");
		
		return videoMapper.findByCode(vno);
	}
	
	public List<CourseVO> getCourseList(String class_code){
		log.info("classcode.............................................");
		
		return coMapper.findclasscode(class_code);
	};

	


}
