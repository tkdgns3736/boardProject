package com.webjjang.board.controller;


import java.util.Date;
import java.util.List;
import javax.inject.Inject;


import org.springframework.scheduling.annotation.EnableScheduling; //스케쥴러
import org.springframework.stereotype.Component;
import java.text.SimpleDateFormat;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.webjjang.board.mapper.BoardMapper;
import com.webjjang.board.vo.AdminVO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.board.vo.NoticeVO;
import com.webjjang.board.PageObject.pageObject;
import com.webjjang.board.PageObject.pageObject_notice;
import com.webjjang.board.vo.*;


@EnableScheduling
@Component
@Service
public class BoardService {
	@Inject
	private BoardMapper mapper;

	public List<BoardVO> list(pageObject pageObject) {

		pageObject.setTotalRow(mapper.getCount(pageObject));

		return mapper.list(pageObject);
	}

	public Integer write(BoardVO vo) {
		// TODO Auto-generated method stub

		return mapper.write(vo);
	}

	// 검색 게시판 보기
	public Object view(int no, int inc) {
		// TODO Auto-generated method stub
		if (inc == 1) {
			mapper.increase(no);
		}
		return mapper.view(no);
	}

	// 게시판 수정
	public Integer update(BoardVO vo) {
		return mapper.update(vo);
	}

	// 게시판 삭제
	public int delete(int no) {
		return mapper.delete(no);
	}
	public UserVO user_login_check(UserVO userVO) {
		// TODO Auto-generated method stub
		return mapper.user_login_check(userVO);
	}
	public int id_check(String userid) {
		return mapper.id_check(userid);
	}
	public int signup(UserVO userVO) {
		return mapper.signup(userVO);
	}
	
	public List<BoardVO> user_info(pageObject pageObject) {

		pageObject.setTotalRow(mapper.getCount_user_info(pageObject));

		return mapper.user_info(pageObject);
	}
	
	public UserVO user_data(String userid) {
		// TODO Auto-generated method stub
		return mapper.user_data(userid);
	}
//=========================================================================================================================== 공지사항
	public List<NoticeVO> notice(pageObject_notice pageObject_notice) {

		pageObject_notice.setTotalRow(mapper.notice_getCount(pageObject_notice));

		return mapper.notice_list(pageObject_notice);
		
	}
	//불러온 데이러틀 담기 위해서 Object 사용
	public Object notice_view(int no, int inc) {
		// TODO Auto-generated method stub
		if (inc == 1) {
			mapper.notice_increase(no);
		}
		return mapper.notice_view(no);
	}
	public AdminVO login_check(AdminVO adminVO) {
		// TODO Auto-generated method stub
		
		return mapper.login_check(adminVO);
	}
	public Integer notice_write(NoticeVO vo) {
		// TODO Auto-generated method stub

		return mapper.notice_write(vo);
	}
	public Integer notice_update(NoticeVO vo) {
		return mapper.notice_update(vo);
	}
	public int notice_delete(int no) {
		return mapper.notice_delete(no);
	}
	public List<NoticeVO> notice_popup(pageObject_notice pageObject_notice) {

		pageObject_notice.setTotalRow(mapper.notice_getCount_popup(pageObject_notice));

		return mapper.notice_list_popup(pageObject_notice);
		
	}
	public int popup_push(int no, String popup_date) {
		return mapper.popup_push(no, popup_date);
	}
	public int popup_delete(int no) {
		return mapper.popup_delete(no);
	}
	public List<String> popup_list() {
		return mapper.popup_list();
	}
	public void rank(String word) {
		 mapper.rank(word);
	}
	public List<rank> rank_data() {
		
		return mapper.rank_data();
	}
	public List<NoticeVO> hit_data() {
		
		return mapper.hit_data();
	}
	
	@Scheduled(fixedDelay = 100000)
    public void firstTask() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now_time = new Date();
		String now = format.format(now_time);
		System.out.println("스케줄러 popup 삭제완료"+now);
        mapper.schedul_popup(now);
    }
	@Scheduled(fixedDelay = 100000)
    public void secondTask() {
	
		System.out.println("스케줄러 search삭제 ");
        mapper.schedul_search();
    }
	
	public List<UserVO> user_list(pageObject pageObject) {

		pageObject.setTotalRow(mapper.getCount_user_list(pageObject));

		return mapper.user_list(pageObject);
	}
	
	public int user_delete(String id) {
		return mapper.user_delete(id);
	}
	
	public int user_board_delete(String id) {
		return mapper.user_board_delete(id);
	}
}


