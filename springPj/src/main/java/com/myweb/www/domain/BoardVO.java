package com.myweb.www.domain;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private long bno;
	
	@NotBlank(message = "제목을 입력하세요.")
	private String title;
	
	private String writer;
	@NotBlank(message ="내용을 입력하세요.")
	private String content;
	
	private String regDate;
	private String modDate;
	private int readCount;
	private int cmtCount;
	private int fileCount;
}
