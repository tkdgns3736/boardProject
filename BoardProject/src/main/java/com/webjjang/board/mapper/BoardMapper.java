package com.webjjang.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.webjjang.board.vo.AdminVO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.board.vo.NoticeVO;
//import com.webjjang.util.PageObject;
import com.webjjang.board.PageObject.pageObject;
import com.webjjang.board.PageObject.pageObject_notice;
import com.webjjang.board.vo.*;
public interface BoardMapper {

	// 게시판 리스트
	public List<BoardVO> list(pageObject pageObject);

	// 전체 데이터 가져오기
	public Integer getCount(pageObject pageObject);

	// 게시판 글보기
	public BoardVO view(int no);

	// 조회수 1증가
	public Integer increase(int no);

	// 게시판 글쓰기
	public Integer write(BoardVO vo);

	// 게시판 글수정
	public Integer update(BoardVO vo);

	// 게시판 글제거
	public int delete(int no);
	
	// 로그인 체크
	public UserVO user_login_check(UserVO userVO);
	
	// id 체크
	public int id_check(String userid);
	
	//회원가입
	public int signup(UserVO userVO);
	
	// 내정보 게시판 리스트
	public List<BoardVO> user_info(pageObject pageObject);
	
	// 내정보 게시판 리스트 갯수 가져오기
	public Integer getCount_user_info(pageObject pageObject);
	
	// 유저 정보 가져오기
	public UserVO user_data(String userid);
//=========================================================================================================================== 공지사항
	
	//공지 사항 리스트 데이터 가져오기
	public List<NoticeVO> notice_list(pageObject_notice pageObject);
	
	//공지 사항 리스트 갯수
	public Integer notice_getCount(pageObject_notice pageObject);
	
	//공지 사항 상세보기
	public NoticeVO notice_view(int no);
	
	//공지 사항 조회수
	public Integer notice_increase(int no);
	
	//admin 로그인
	public AdminVO login_check(AdminVO adminVO);
	
	//공지 사항 작성
	public Integer notice_write(NoticeVO vo);
	
	//공지 사항 수정
	public Integer notice_update(NoticeVO vo);
	
	//공지 사항 삭제
	public int notice_delete(int no);
	
	//팝업 관리 페이지 가져오기
	public List<NoticeVO> notice_list_popup(pageObject_notice pageObject);
	
	//공지사항 갯수 가져오기
	public Integer notice_getCount_popup(pageObject_notice pageObject);
	
	// 팝업 등록
	public int popup_push(@Param("no")int no, @Param("popup_date") String popup_date);

	// 팝업 삭제
	public int popup_delete(int no);
	
	//팝업창 공지사항 가져오기
	public List<String> popup_list();

	// 실시간 검색순위 체크를 위한 DB insert
	public void rank(String word);
	
	// 실시간 공지사항 순위를 위한 5개 데이터 가져오기
	public List<rank> rank_data();
	
	// 실시간 순위를 위한 조회수 순위 가져오기
	public List<NoticeVO> hit_data();
	
	// popup삭제 스케쥴링
	public void schedul_popup(String now);
	
	// 검색 순위 삭제 스케쥴링
	public void schedul_search();
	
	// 회원관리 회원 데이터 가져오기
	public List<UserVO> user_list(pageObject pageObject);
	
	// 회원관리 회원 데이터 값 체크
	public Integer getCount_user_list(pageObject pageObject);
	
	// 회원관리 회원 정보 삭제
	public int user_delete(String id);
	
	// 회원관리 회원 삭제 시 게시판도 삭제
	public int user_board_delete(String id);
}
