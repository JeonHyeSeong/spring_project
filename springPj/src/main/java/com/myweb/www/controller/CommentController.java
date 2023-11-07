package com.myweb.www.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/comment/*")
@RequiredArgsConstructor
public class CommentController {
	
	private final CommentService csv;
	
	@PostMapping(value = "/post", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> commentPost(@RequestBody CommentVO cvo){
		log.info("cvo : {}",cvo);
		int isOk = csv.post(cvo);
		return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{bno}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<CommentVO>> commentList(@PathVariable("bno") long bno){
		log.info("bno : {}",bno);
		List<CommentVO> list = csv.getList(bno);
		return new ResponseEntity<List<CommentVO>>(list,HttpStatus.OK);
	}
	
	@PutMapping(value = "/{cno}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> commentEdit(@RequestBody CommentVO cvo, Principal principal){
		log.info("cvo : {}",cvo);
		if(principal.getName().equals(cvo.getWriter())) {
			int isOk = csv.edit(cvo);
			return isOk > 0? new ResponseEntity<String>("1",HttpStatus.OK)
					: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/{cno}/{writer}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> commentRemove(@PathVariable("cno") long cno, @PathVariable("writer") String writer,
			Principal principal){
		log.info("cno : {}",cno);
		log.info("writer : {}",writer);
		log.info("principal : {}",principal.getName());
		
		if(principal.getName().equals(writer)) {
			int isOk = csv.remove(cno);
			return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK) :
				new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
}
