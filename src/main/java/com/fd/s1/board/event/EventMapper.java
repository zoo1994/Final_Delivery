package com.fd.s1.board.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.util.Pager;


@Mapper
public interface EventMapper {
	
	public Long getTotal(Pager pager)throws Exception;
	
	public List<EventFilesVO> getFileList(EventVO eventVO)throws Exception;
	
	public int setFileAdd(EventFilesVO eventFilesVO)throws Exception;
	public int setThumbFileAdd(EventFilesVO eventFilesVO)throws Exception;
	
	public int setFileDelete(EventFilesVO eventFilesVO)throws Exception;
	
	public List<EventVO> getList(Pager pager)throws Exception;
	public int setHit(EventVO eventVO)throws Exception;
	public EventVO getDetail(EventVO eventVO)throws Exception;
	public List<EventFilesVO> getThumb(EventVO eventVO)throws Exception;
	
	public int setAdd(EventVO eventVO)throws Exception;
	
	public int setEventCouponAdd(Event_couponVO ecVO)throws Exception;
	public int setEventCouponDelete(Event_couponVO ecVO)throws Exception;
	
	public int setUpdate(EventVO eventVO)throws Exception;
	public int setUpdateCoupon(Event_couponVO event_couponVO)throws Exception;
	public int getUpdateCouponSearch(Event_couponVO event_couponVO)throws Exception;
	public int setDelete(EventVO eventVO)throws Exception;
}
