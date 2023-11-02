package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;

	@Override
	public int register(BoardVO bvo) {
		log.info("board register check");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		
		return bdao.getList(pgvo);
	}

	@Override
	public BoardVO getDetail(long bno) {
		
		return bdao.getDetail(bno);
	}

	@Override
	public BoardVO cntDetail(long bno) {
		bdao.readCount(bno);
		return bdao.cntDetail(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		
		return bdao.update(bvo);
	}

	@Override
	public int remove(long bno) {
		
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		
		return bdao.getTotalCount(pgvo);
	}
}
