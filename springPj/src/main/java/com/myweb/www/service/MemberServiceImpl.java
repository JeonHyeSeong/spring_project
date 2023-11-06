package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberDAO mdao;

	@Transactional
	@Override
	public int signup(MemberVO mvo) {
		mdao.signup(mvo);
		return mdao.insertAuth(mvo.getEmail());
	}

	@Override
	public boolean updateLastLogin(String authEmail) {
		
		return mdao.updateLastLogin(authEmail) > 0? true : false;
	}

	@Override
	public List<MemberVO> getList() {
		
		return mdao.getList();
	}

	@Override
	public MemberVO getDetail(String email) {
		
		return mdao.getDetail(email);
	}

	@Override
	public int noPwdUpdate(MemberVO mvo) {
		
		return mdao.noPwdUpdate(mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		
		return mdao.memberUpdate(mvo);
	}

	@Transactional
	@Override
	public int remove(String email) {
		mdao.authRemove(email);
		return mdao.remove(email);
	}
}
