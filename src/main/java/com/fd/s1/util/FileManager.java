package com.fd.s1.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	@Autowired
	private ServletContext servletContext;
	
	public String fileSave(MultipartFile mf, String path)throws Exception{
		path = servletContext.getRealPath(path);
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+mf.getOriginalFilename();
		file = new File(file,fileName);
		mf.transferTo(file);

		return fileName;
	}
	
	public boolean remove(String fileName, String path)throws Exception{
		path = servletContext.getRealPath(path);
		File file = new File(path,fileName);
		return file.delete();
	}
}
