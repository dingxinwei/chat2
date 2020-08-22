package com.wx.controller;

import java.io.File;

import java.io.IOException;


import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
/**
 * 处理文件上传请求
 * @author dxw
 *
 */
@Controller
public class UploadFileController {
	@RequestMapping("/uploadFile")
	public void uploadFile(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value = "file") MultipartFile file
			) throws IllegalStateException, IOException {
		
		ServletContext context = req.getServletContext();
		String realPaths = context.getRealPath("/chatFile");
		
		file.transferTo(new File(realPaths+"/"+file.getOriginalFilename()));	
		resp.getWriter().write(file.getOriginalFilename());
		
	}

}
