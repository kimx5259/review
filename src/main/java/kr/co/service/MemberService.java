package kr.co.service;

import java.util.List;

import kr.co.domain.MemberVO;

public interface MemberService {
	
	public void insertMember(MemberVO vo);

	public MemberVO read(String userid);

	public MemberVO updateUI(String userid);

	public void update(MemberVO vo);

	public void delete(MemberVO vo);

	public List<MemberVO> list();

	public List<MemberVO> searchByName(String userid);

	public MemberVO idcheck(String userid);

	public MemberVO login(MemberVO vo);

	public int passChk(MemberVO vo);





}
