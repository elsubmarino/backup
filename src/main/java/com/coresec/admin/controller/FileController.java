package com.coresec.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String rootPath=request.getSession().getServletContext().getRealPath("/");
			System.out.println(rootPath);
			String uploadPath = rootPath+"\\resources\\boardImgs\\" + fileName;

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String fileUrl = "/resources/boardImgs/" + fileName;// url경로
			String json="{\"filePath\":\""+fileUrl+"\",\"msg\":\"이미지 업로드에 성공하였습니다!\"}";

			printWriter = response.getWriter();
			printWriter.println(json);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
}
