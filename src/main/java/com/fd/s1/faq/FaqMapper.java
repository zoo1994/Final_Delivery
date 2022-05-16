package com.fd.s1.faq;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.util.Pager;
@Mapper
public interface FaqMapper {
	public Long getTotal()throws Exception;
	
	public List<FaqVO> getList(EtcVO etcVO)throws Exception;
	
	public FaqVO getDetail(FaqVO faqVO)throws Exception;
	
	public int setAdd(FaqVO faqVO)throws Exception;
	
	public int setUpdate(FaqVO faqVO)throws Exception;
	
	public int setDelete(FaqVO faqVO)throws Exception;
	
	public Long getTotalCount(EtcVO etcVO)throws Exception;
	
}
