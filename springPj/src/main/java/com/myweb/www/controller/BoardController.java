package com.myweb.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bsv;
	
	@GetMapping("/register")
	public void registerGet() {}
	
	@PostMapping("/register")
	public String registerPost(BoardVO bvo,RedirectAttributes re) {
		log.info("bvo : {}",bvo);
		int isOk = bsv.register(bvo);
		log.info(">>> board register "+(isOk > 0? "OK" : "Fail"));
		re.addFlashAttribute("isOk", isOk);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String getList(Model model, PagingVO pgvo) {
		log.info("pgvo : {}",pgvo);
		List<BoardVO> list = bsv.getList(pgvo);
		model.addAttribute("list",list);
		
		int totalCount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		model.addAttribute("ph", ph);
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void getDetail(@RequestParam("bno") long bno, Model model) {
		BoardVO bvo = bsv.getDetail(bno);
		model.addAttribute("bvo", bvo);
	}
	
	@GetMapping("/cntDetail")
	public String cntDetail(@RequestParam("bno") long bno, Model model) {
		BoardVO bvo = bsv.cntDetail(bno);
		model.addAttribute("bvo", bvo);
		return "/board/detail";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, RedirectAttributes re) {
		log.info("bvo : {}",bvo);
		int isMod = bsv.modify(bvo);
		log.info(">>> board modify "+(isMod > 0? "OK" : "Fail"));
		re.addAttribute("bno", bvo.getBno());
		re.addFlashAttribute("isMod", isMod);
		return "redirect:/board/detail";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") long bno, RedirectAttributes re) {
		int isDel = bsv.remove(bno);
		log.info(">>> board remove "+(isDel > 0? "OK" : "Fail"));
		re.addFlashAttribute("isDel", isDel);
		return "redirect:/board/list";
	}
}
