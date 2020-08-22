package com.wx.controller;

import java.io.File;

import java.io.IOException;


import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class UploadImgController {
	
	//ÉÏ´«Í·Ïñ
	@RequestMapping("/uploadHImg")
	public void uploadHeadImg(HttpServletRequest req,@RequestParam(value = "img") MultipartFile file
			,@RequestParam("acc")String account
			) throws IllegalStateException, IOException {

		ServletContext context =req.getServletContext();	
		
		String realPaths = context.getRealPath("/headImg");
		
		file.transferTo(new File(realPaths+"/"+account+".jpg"));
		
	}
}
