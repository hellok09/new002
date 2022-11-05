package org.academy.service;

import java.util.List;

import org.academy.domain.Criteria;
import org.academy.domain.NoticeVO;
import org.academy.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class NoticeServicelmpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO notice) {
		// TODO Auto-generated method stub
		
		log.info("register................." + notice);
		
		mapper.insertSelectKey(notice);
	}

	@Override
	public NoticeVO get(String notice_code) {
		// TODO Auto-generated method stub
		log.info("get...................");
		
		return mapper.read(notice_code);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		log.info("modify..................." + notice);
		
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(String notice_code) {
		// TODO Auto-generated method stub
		log.info("remove..................." + notice_code);
		
		return mapper.delete(notice_code) == 1;
	}
	/*
	@Override
	public List<NoticeVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList...................");
		
		return mapper.getList();
	}*/
	
   @Override
   public List<NoticeVO> getList(Criteria cri) {
      
      log.info("get List with criteria: " +cri);
      
      return mapper.getListWithPaging(cri);
   }
   
   
   @Override
   public int getTotal(Criteria cri) {
      
      log.info("get total count");
      
      return mapper.getTotalCount(cri);
   }	

}
