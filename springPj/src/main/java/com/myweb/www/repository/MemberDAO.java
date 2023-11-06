package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

public interface MemberDAO {

	int signup(MemberVO mvo);

	int insertAuth(String email);

	int updateLastLogin(String authEmail);

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	List<MemberVO> getList();

	MemberVO getDetail(String email);

	int noPwdUpdate(MemberVO mvo);

	int memberUpdate(MemberVO mvo);

	void authRemove(String email);

	int remove(String email);

}
