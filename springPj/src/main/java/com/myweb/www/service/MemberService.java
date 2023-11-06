package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int signup(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	List<MemberVO> getList();

	MemberVO getDetail(String email);

	int noPwdUpdate(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	int remove(String email);

}
