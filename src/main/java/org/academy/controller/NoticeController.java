package org.academy.controller;

import org.academy.domain.Criteria;
import org.academy.domain.NoticeVO;
import org.academy.domain.PageDTO;
import org.academy.service.NoticeService;
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
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	@GetMapping("/register")
	public void register() {

	} 
	
	/*
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
	}*/
	
	@GetMapping("/list")
	   public void list(Criteria cri, Model model) {
	      
	      log.info("list: "+cri);
	      model.addAttribute("list", service.getList(cri));
	      //model.addAttribute("pageMaker", new PageDTO(cri, 123));
	      
	      int total = service.getTotal(cri);
	      
	      log.info("total: "+total);
	      
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	   }					
	

	
	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		log.info("register: " + notice);
		
		service.register(notice);
		
		rttr.addFlashAttribute("result", notice.getNotice_code());
		
		return "redirect:/notice/list";
	} 
	
	   // 조회 처리
	   @GetMapping({"/get","/modify"})
	   public void get(@RequestParam("notice_code") String notice_code, @ModelAttribute("cri") Criteria cri, Model model) {
	      
	      log.info("/get or /modify");
	      model.addAttribute("notice", service.get(notice_code));
	   }
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("modify:" + notice);
		
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		
	    rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    
		return "redirect:/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_code") String notice_code, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + notice_code);
		if(service.remove(notice_code)) {
			rttr.addFlashAttribute("result", "success");
		}
	    rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/notice/list";
	}
	
	@GetMapping("/home")
	public void home() {

	}

}