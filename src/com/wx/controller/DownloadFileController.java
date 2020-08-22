package com.wx.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
/**
 * 处理文件下载请求
 * @author dxw
 *
 */
@Controller
public class DownloadFileController{
	@RequestMapping("/downloadFile")
	public  ResponseEntity<byte[]> downloadFile(ServletRequest request,@RequestParam("fileName")String fileName) throws IOException{
		HttpHeaders header = new HttpHeaders();
		
	    header.set("Content-Disposition","attachment;filename="+URLEncoder.encode(fileName, "utf-8"));
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/chatFile/"+fileName);
		InputStream is = new FileInputStream(realPath);
	    byte[] data = new byte[is.available()];
	    is.read(data);
	    return new ResponseEntity<byte[]>(data,header, HttpStatus.OK);
	}
}
