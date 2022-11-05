package org.academy.controller;

import java.util.List;

import org.academy.domain.CourseAttachVO;
import org.academy.domain.CourseCriteria;
import org.academy.domain.CoursePageDTO;
import org.academy.domain.CourseVO;
import org.academy.service.CourseService;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/classmanage")
	public void classmanage(CourseCriteria cri, Model model){
		log.info("list" + cri);
		
		model.addAttribute("classmanage" ,service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("totel: " + total);
		
		model.addAttribute("pageMaker", new CoursePageDTO(cri, total));
		
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
	
	
	@GetMapping(value="/getCourseAttach", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CourseAttachVO>> getCourseAttachList(Long class_code){
		
		log.info("class_code"+class_code);
		
		return new ResponseEntity<>(service.getCourseAttachList(class_code), HttpStatus.OK);
	}
}
