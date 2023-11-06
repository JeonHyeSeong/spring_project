package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;
	
	private final FileDAO fdao;

//	@Override
//	public int register(BoardVO bvo) {
//		log.info("board register check");
//		return bdao.insert(bvo);
//	}

	@Transactional
	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		bdao.commentCount();
		bdao.fileCount();
		return bdao.getList(pgvo);
	}

	@Override
	public BoardVO getDetail(long bno) {
		
		return bdao.getDetail(bno);
	}

	@Transactional
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

	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		log.info("board register check");
		int isUp = bdao.insert(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			return isUp;
		}
		
		
		if(isUp > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			// 모든 파일에 bno set
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isUp *= fdao.insertFile(fvo);
			}
		}
		return isUp;
	}

	@Transactional
	@Override
	public BoardDTO getDetailFile(long bno) {
		BoardDTO bdto = new BoardDTO();
		bdto.setBvo(bdao.getDetail(bno));
		bdto.setFlist(fdao.DetailFile(bno));
		return bdto;
	}

	@Transactional
	@Override
	public BoardDTO cntDetailFile(long bno) {
		bdao.readCount(bno);
		BoardDTO bdto = new BoardDTO();
		bdto.setBvo(bdao.cntDetail(bno));
		bdto.setFlist(fdao.cntDetailFile(bno));
		return bdto;
	}

	@Override
	public int removeFile(String uuid) {
		
		return fdao.removeFile(uuid);
	}

	@Transactional
	@Override
	public int modify(BoardDTO bdto) {
		int isOk = bdao.update(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		
		return isOk;
	}
}
