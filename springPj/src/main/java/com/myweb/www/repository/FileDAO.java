package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> DetailFile(long bno);

	List<FileVO> cntDetailFile(long bno);

	int removeFile(String uuid);

	List<FileVO> selectListAllFile();

}
