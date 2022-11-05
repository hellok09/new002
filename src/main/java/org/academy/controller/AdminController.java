package org.academy.controller;



import org.academy.domain.StudentVO;
import org.academy.domain.Student_detailVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/Admin/*")
@AllArgsConstructor
public class AdminController {
	
	private AdminService service;
	// 화면처리
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
	
	}
	//관리자 화면처리
	@GetMapping("/adminlist")
	public void Adminlist(Model model) {
	log.info("list");
	model.addAttribute("alist", service.getadminList());
	}
	 
	
	//학생조회 처리
	@RequestMapping(value = "/Admin/read", method = RequestMethod.GET)
	public String read(@ModelAttribute("searchVO")Student_detailVO searchVO, @RequestParam("STU_ID") String STU_ID, Model model) {
		
		Student_detailVO StudentView = service.getStudentView(STU_ID);
		model.addAttribute("StudentView", StudentView);
		
		return "/Admin/read";
	}
	//관리자 조회
	@RequestMapping(value = "/Admin/adminread", method = RequestMethod.GET)
	public String read(@ModelAttribute("searchVO")Admin_detailVO searchVO, @RequestParam("ADMIN_ID") String ADMIN_ID, Model model) {
		
		Admin_detailVO AdminView = service.getAdminView(ADMIN_ID);
		model.addAttribute("AdminView", AdminView);
		
		return "/Admin/adminread";
	}
	
	  
	
//삭제처리
@RequestMapping(value = "/Admin/StudentDelete", method = RequestMethod.GET)
public String StudentDelete(@ModelAttribute("searchVO") StudentVO searchVO, @RequestParam("STU_ID") String STU_ID, RedirectAttributes redirect , Model model) {
	
	try {
		
		service.getStudentDelete(STU_ID);
		redirect.addFlashAttribute("msg", "삭제가 완료되었습니다.");
		
	} catch (Exception e) {
		redirect.addFlashAttribute("msg", "오류가 발생되었습니다.");
		
	}
	
	return "redirect:/Admin/list";
}//관리자 삭제처리
@RequestMapping(value = "/Admin/Admindelete", method = RequestMethod.GET)
public String delete(@ModelAttribute("searchVO") AdminVO searchVO, @RequestParam("ADMIN_ID") String ADMIN_ID, RedirectAttributes redirect , Model model) {
	
	try {
		
		service.getAdminDelete(ADMIN_ID);
		redirect.addFlashAttribute("msg", "삭제가 완료되었습니다.");
		
	} catch (Exception e) {
		redirect.addFlashAttribute("msg", "오류가 발생되었습니다.");
		
	}
	
	return "redirect:/Admin/adminlist";
}
}


	


