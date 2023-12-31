package com.myweb.www.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
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
	
	private final FileHandler fh;
	
	@GetMapping("/register")
	public String registerGet(Model model) {
		model.addAttribute("bvo", new BoardVO());
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String registerPost(@Validated @ModelAttribute("bvo")BoardVO bvo, BindingResult bindingResult,
			RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		
		if(bindingResult.hasErrors()) {
			log.info("에러메시지 = {}", bindingResult.getFieldError());
			return "/board/register";
		}
		
		
		log.info("bvo : {}",bvo);
		List<FileVO> flist = null;
		// file upload handler 생성
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		
		int isOk = bsv.insert(new BoardDTO(bvo, flist));
		log.info(">>> board register "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/board/list";

	}
	
	@GetMapping("/list")
	public String getList(Model model, PagingVO pgvo) {
//		log.info("pgvo : {}",pgvo);
		List<BoardVO> list = bsv.getList(pgvo);
		model.addAttribute("list",list);
		
		int totalCount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		model.addAttribute("ph", ph);
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void getDetail(@RequestParam("bno") long bno, Model model) {
//		BoardVO bvo = bsv.getDetail(bno);
		BoardDTO bdto = bsv.getDetailFile(bno);
		
		model.addAttribute("bvo", bdto.getBvo());
		model.addAttribute("BoardDTO", bdto);
	}
	
	@GetMapping("/cntDetail")
	public String cntDetail(@RequestParam("bno") long bno, Model model) {
//		BoardVO bvo = bsv.cntDetail(bno);
		BoardDTO bdto = bsv.cntDetailFile(bno);
		model.addAttribute("bvo", bdto.getBvo());
		model.addAttribute("BoardDTO", bdto);
		return "/board/detail";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files, Principal principal) {
		log.info("bvo : {}",bvo);
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		int isMod = bsv.modify(new BoardDTO(bvo, flist));
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
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid) {
		int isOk = bsv.removeFile(uuid);
		return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
