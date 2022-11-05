package org.academy.mapper;

import java.util.List;

import org.academy.domain.Criteria;
import org.academy.domain.NoticeVO;

public interface NoticeMapper {

	//@Select("select * from notice where notice_code > 0")
	
	// 게시물 불러오기 
	public List<NoticeVO> getList();
	
	//creat(insert처리)
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	//read
	
	public NoticeVO read(String notice_code);
	
	//delete
	
	public int delete(String notice_code);
	
	// UPDATE 처리
	public int update(NoticeVO notice);
	
	   // 페이징 처리
	   public List<NoticeVO> getListWithPaging(Criteria cri);
	   
	   public int getTotalCount(Criteria cri);
}
