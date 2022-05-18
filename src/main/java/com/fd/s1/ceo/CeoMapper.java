package com.fd.s1.ceo;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CeoMapper {
	
	public int setMenu(Map<Integer, Integer> map) throws Exception;
}
