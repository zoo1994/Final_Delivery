package com.fd.s1.faq;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.member.MemberMapper;
import com.fd.s1.member.MemberVO;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class FaqService {

	@Autowired
	private FaqMapper faqMapper;

	@Autowired
	private MemberMapper memberMapper;


	public int setDelete(FaqVO faqVO, MemberVO memberVO)throws Exception{	
				
		if(memberVO != null) {
			memberVO = memberMapper.idCheck(memberVO);
		}else {
			return 0;
		}
		
		if(memberVO.getUserType() == 2L) {
			return faqMapper.setDelete(faqVO);
		}else {
			return 0;
		}
		
		
	}
	
	public int setUpdate(FaqVO faqVO)throws Exception{			
		return faqMapper.setUpdate(faqVO);
	}
	
	public FaqVO getDetail(FaqVO faqVO)throws Exception{
		return faqMapper.getDetail(faqVO);
	}
	
	public int setAdd(FaqVO faqVO)throws Exception{		
		return faqMapper.setAdd(faqVO);
	}
	
	public List<FaqVO> getList(Pager pager, FaqVO faqVO)throws Exception{
		EtcVO etcVO = new EtcVO();
		etcVO.setCategory(faqVO.getCategory());
		etcVO.setSearch(pager.getSearch());

		
		pager.makeRow();
		pager.makeNum(faqMapper.getTotalCount(etcVO));
		
		etcVO.setPerPage(pager.getPerPage());
		etcVO.setStartRow(pager.getStartRow());
		
		return faqMapper.getList(etcVO);
	}
	
	public Long getListCount(Pager pager, FaqVO faqVO) throws Exception{	
		EtcVO etcVO = new EtcVO();
		etcVO.setCategory(faqVO.getCategory());
		etcVO.setSearch(pager.getSearch());
		return faqMapper.getTotalCount(etcVO);
	}	
	
}
