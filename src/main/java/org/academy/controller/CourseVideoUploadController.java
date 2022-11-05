package org.academy.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;




import org.academy.domain.VideoAttachFileDTO2;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class CourseVideoUploadController {
	

	
	@GetMapping("/uploadAjax2")
	public void uploadAjax2() {
		log.info("upload ajax");
	}
	


	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@PostMapping(value="/uploadAjaxAction2", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<VideoAttachFileDTO2>> uploadAjaxPost2(MultipartFile[] uploadFile) {
		
		//이미지 정보 담는 객체
		List<VideoAttachFileDTO2> list = new ArrayList<>();
		
		
		
		String uploadFolder = "c:\\projectUpload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			//이미지정보
			VideoAttachFileDTO2 VADTO2 = new VideoAttachFileDTO2();
			
			//파일이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			
			VADTO2.setFileName(uploadFileName);
			VADTO2.setUploadPath(getFolder());
			
			//IE has file path 
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			
			//uuid적용
			String uuid = UUID.randomUUID().toString();
			
			VADTO2.setUuid(uuid);
			uploadFileName = uuid+"_"+uploadFileName;
			
			//파일 위치
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				//파일 저장
				multipartFile.transferTo(saveFile);
					
				if(checkImageType(saveFile)) {
					
					VADTO2.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					
					thumbnail.close();
				}
			
			
				list.add(VADTO2);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@GetMapping("/display2")
	@ResponseBody
	public ResponseEntity<byte[]> getFile2(String fileName){
		
		log.info("fileName: "+fileName);
		
		File file = new File("c:\\projectUpload\\"+fileName);
		
		log.info("file:" +file);

		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@PostMapping("/deleteFile2")
	@ResponseBody
	public ResponseEntity<String> deleteFile2(String fileName, String type){
		
		log.info("deleteFile: "+fileName);
		
		File file;
		
		try {
			//섬네일 파일삭제
			file = new File("c:\\projectUpload\\"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			if(type.equals("image")) {
			//원본파일삭제
			String OriginFileName = file.getAbsolutePath().replace("s_", "");
				
			log.info("OriginFileName: "+OriginFileName );
				
			file = new File(OriginFileName);
			file.delete();
			}
			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
}
