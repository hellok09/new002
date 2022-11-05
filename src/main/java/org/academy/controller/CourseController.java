package org.academy.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.List;



import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;
import org.academy.domain.CoursePageDTO;
import org.academy.domain.CourseVO;
import org.academy.domain.CourseVideoAttachVO;
import org.academy.domain.CourseVideoVO;
import org.academy.service.CourseService;
import org.academy.service.CourseVideoService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/course")
@Controller
@Log4j
@AllArgsConstructor
public class CourseController {

	
	private CourseService service;
	private CourseVideoService serviceV;
	
	@GetMapping("/classmanage")
	public void classmanage(CourseCriteria cri, Model model){
		log.info("list" + cri);
		
		
		
		int total = service.getTotalCount(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new CoursePageDTO(cri, total));
		model.addAttribute("classmanage" ,service.getList(cri));
		
		
	}
	
	@GetMapping("/classregister")
	public void register() {
		
	}
	
	@PostMapping("/classregister")
	public String register(CourseVO course, RedirectAttributes rttr) {
		
		log.info("register.........." + course);
		
		if(course.getCourseAttach() != null) {
			course.getCourseAttach().forEach(attach -> log.info(attach));
		}
		
		service.register(course);
		
		rttr.addFlashAttribute("result", course.getClass_code());
		
		return "redirect:/course/classmanage";
	}
	
	@GetMapping({"classread","classmodify"})
	public void get(@RequestParam("class_code") String class_code, @ModelAttribute("cri") CourseCriteria cri, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("course", service.get(class_code));
	}
	
	@PostMapping("/classmodify")
	public String modify(CourseVO course, @ModelAttribute("cri") CourseCriteria cri ,RedirectAttributes rttr) {
		
		log.info("modify: "+course);
		
		if(service.modify(course)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/course/classmanage";
	}
	
	
	
	@GetMapping(value="/getCourseAttach", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CourseAttachVO>> getCourseAttach(String class_code){
		
		log.info("class_code"+class_code);
		
		return new ResponseEntity<>(service.getCourseAttach(class_code), HttpStatus.OK);
	}
	
	@GetMapping("/classdelete")
	public String delete(@RequestParam("class_code") String class_code, @ModelAttribute("cri") CourseCriteria cri ,RedirectAttributes rttr) {
		
		log.info("remove....." + class_code);
		
		List<CourseAttachVO> courseAttach = service.getCourseAttach(class_code);
		
		if(service.deleteCourse(class_code)) {
			deleteFiles(courseAttach);
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/course/classmanage";
	}
	

	
	
private void deleteFiles(List<CourseAttachVO> attachList) {
		
		if(attachList == null || attachList.size()==0) {
			return;
		}
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get(attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		});
	}


		
		

		@GetMapping("/videolist")
		public void videolist(@RequestParam("class_code") String class_code, Model model) {
			
			
		

			log.info("videolist................................................");
			
			model.addAttribute("video", serviceV.getCourseList(class_code));
		
			model.addAttribute("listvideo", serviceV.videoGetList(class_code));
		}


		
		@GetMapping("/videoregister")
		public void videoregister(@RequestParam("class_code") String class_code, Model model) {

			model.addAttribute("classcode", class_code);
		}

		@PostMapping("/videoregister")
		public String videoregister(CourseVideoVO video, RedirectAttributes rttr) {
			log.info("register......................" + video);
			
			
			
			
			if(video.getVideoList() != null ) {
				video.getVideoList().forEach(attach -> log.info(attach));
			}
			
			
			

			serviceV.videoRegister(video);
			rttr.addFlashAttribute("result", video.getVno());

			return "redirect:/course/videolist?class_code="+video.getClass_code();
		}


		@GetMapping({"/videoread", "/videomodify"})
		public void videoget(@RequestParam("vno") String vno, Model model) {
			log.info("/get or /modify");

			model.addAttribute("video", serviceV.videoRead(vno));

		}

		@PostMapping("/videomodify")
		public String videomodify(CourseVideoVO video, RedirectAttributes rttr) {

			log.info("modify..........................");

		
			boolean result = serviceV.videoModify(video);
			if(result) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/course/videolist?class_code="+video.getClass_code();

		}

		@PostMapping("/videoremove")
		public String videoremove(@RequestParam("vno") String vno, CourseVideoVO video ,RedirectAttributes rttr) {

			log.info("remove......." +vno);
			
			
			List<CourseVideoAttachVO> videoList = serviceV.getVideoList(vno);

			if(serviceV.videoRemove(vno)) {
				deleteFiles2(videoList);
				rttr.addFlashAttribute("result","success");
			}

			return "redirect:/course/videolist?class_code="+video.getClass_code();
		}
		

		
	@GetMapping(value="/getVideoList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CourseVideoAttachVO>> getVideoList(String vno){
			
			log.info("vno"+vno);
			return new ResponseEntity<>(serviceV.getVideoList(vno), HttpStatus.OK);
		}
	
	
	private void deleteFiles2(List<CourseVideoAttachVO> attachList) {
			
			if(attachList == null || attachList.size()==0) {
				return;
			}
			
			attachList.forEach(attach -> {
				try {
					Path file = Paths.get("c:\\projectUpload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						Path thumbNail = Paths.get("c:\\projectUpload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
						Files.delete(thumbNail);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			});
		}
		
		
	

	}

