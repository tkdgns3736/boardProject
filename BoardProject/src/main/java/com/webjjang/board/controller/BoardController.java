package com.webjjang.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.webjjang.board.PageObject.pageObject;
import com.webjjang.board.PageObject.pageObject_notice;
import com.webjjang.board.vo.AdminVO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.board.vo.NoticeVO;
import com.webjjang.board.vo.UserVO;
@Controller
//get, post다 받아냄.
@RequestMapping("/board")
public class BoardController {
	private final String MODULE_NAME = "board";

	// 서비스 연결해줌
	@Autowired
	private BoardService service;
	

	// model = 데이터를 담는용
	// 게시판 list 출력
	@GetMapping("/list.do")
	public String list(Model model, pageObject pageObject, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_name= (String) session.getAttribute("user_name");
		if(user_name==null) {
		return "redirect:user_login.do";
		}

		model.addAttribute("list", service.list(pageObject));
		System.out.print(service.list(pageObject).toString());
		model.addAttribute("pageObject", pageObject);

		return MODULE_NAME + "/list";
	}
	@GetMapping("/home.do")
	public String list_home() {
		return MODULE_NAME + "/home";
	}

	// 글쓰기 페이지 이동
		@GetMapping("/write.do")
		public String writeForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writeverify = (String) session.getAttribute("writeverify"); //본인 인증여부 확인하는 session값
		if(writeverify==null) {
		return "redirect:list.do";
		}
		if(writeverify.equals("1")) {
		session.removeAttribute("writeverify");// 글쓰기 상태 값 세션 삭제
		return MODULE_NAME + "/write";
		}
		
		
		return "redirect:list.do";
	}
	
	// 글쓰기 페이지 이동 test
		@GetMapping("/write_request.do")
		public String write_request(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String getverify = (String) session.getAttribute("getverify"); //본인 인증여부 확인하는 session값


			
		 if(getverify==null||getverify.equals("0")){
				
			
				model.addAttribute("param1", service.user_data((String) session.getAttribute("user_id")));
				
					return MODULE_NAME + "/kakao";
				}
		 
		 if(getverify.equals("1")){
			 session.removeAttribute("getverify");// 상태 값 세션 삭제
				session.setAttribute("writeverify","1");
			 
			return MODULE_NAME + "/write";
			}
		 
		 
		 return MODULE_NAME + "/kakao";
		}


	// 게시판 글쓰기	
	@PostMapping("/write.do")
	public String write(BoardVO vo, HttpServletRequest request ) throws Exception {

		HttpSession session = request.getSession();
		String user_name= (String) session.getAttribute("user_name");
		String user_id= (String) session.getAttribute("user_id");
		// DB사용
		String fileName="";
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();

			fileName= originalFileName;
			uploadFile.transferTo(new File("C:\\Users\\pinplenet\\Desktop\\게시판\\" + fileName));
		}
		vo.setFile_name(fileName);
		vo.setWriter(user_name); //작성자 이름
		vo.setUserid(user_id); //작성자 id
		service.write(vo);
		
		return "redirect:list.do";

	}

	// 게시판 글보기
	@GetMapping("/view.do")
	public String view(int no, Model model, int inc, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userid= (String) session.getAttribute("user_id");
		model.addAttribute("vo", service.view(no, inc));
		model.addAttribute("id", userid);
		return MODULE_NAME + "/view";
	}

	// 게시판 글수정 폼
	@GetMapping("update.do")
	public String updateForm(Model model, int no, int inc) {
		// model에 담아서 no, inc값을 넘긴다.
		model.addAttribute("vo", service.view(no, inc));
		System.out.println("update_page_in");

		return MODULE_NAME + "/update";
	}

	// 게시판 글수정 처리 - 제목, 내용, 작성자, 비밀번호 확인부분
	@PostMapping("/update.do")
	public String update(BoardVO vo, pageObject pageObject) throws UnsupportedEncodingException, Exception {

		System.out.println("update_page_out");
		String fileName="";
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();

			fileName= originalFileName;
			uploadFile.transferTo(new File("C:\\Users\\pinplenet\\Desktop\\게시판\\" + fileName));
			
		}
		vo.setFile_name(fileName);
		service.update(vo);

		// 검색어 한글처리

		if (pageObject.getWord() == null)
			pageObject.setWord("");

		return "redirect:view.do?no=" + vo.getNo() + "&inc=1" + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word="
				+ URLEncoder.encode(pageObject.getWord(), "utf-8") + "&start_date=" + pageObject.getStart_date()
				+ "&end_date=" + pageObject.getEnd_date()+ "&sort=" + pageObject.getSort()+ "&value=1";
	}

	// 게시판 삭제처리 폼 글번호, 패스워드 필요
	@GetMapping("/delete.do")
	public String delete(int no, pageObject pageObject) throws UnsupportedEncodingException {

		service.delete(no);

		return "redirect:list.do?page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum() + "&Key="
				+ pageObject.getKey() + "&word=" + URLEncoder.encode(pageObject.getWord(), "utf-8") + "&start_date="
				+ pageObject.getStart_date() + "&end_date=" + pageObject.getEnd_date()+ "&sort=" + pageObject.getSort();

//		

	}

	@PostMapping("/delete_check.do")
	public String delete_check(HttpServletRequest request) {
		String value = request.getParameter("value");
		String[] num = value.split(",");
		System.out.println("write_check_success");
		for (int i = 0; i < num.length; i++) {
			// DB사용
			service.delete(Integer.parseInt(num[i]));
		}

		return "redirect:list.do";
	}
	
	@GetMapping("/FileDownload.do")
	public void download(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 String filename =request.getParameter("file_name");
		 String filename1 =""; //다운 시 보여줄 파일 이름
	        String realFilename="";
	        try {
	            String browser = request.getHeader("User-Agent"); 
	            //파일 인코딩 
	            if (browser.contains("MSIE") || browser.contains("Trident")
	                    || browser.contains("Chrome")) {
	            	filename1 = new String(filename.getBytes("utf-8"),"ISO-8859-1");
	            } else {
	            	filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+","%20");
	            }
	        } catch (UnsupportedEncodingException ex) {
	            System.out.println("UnsupportedEncodingException");
	        }
	        realFilename = "C:\\Users\\pinplenet\\Desktop\\게시판\\" + filename;
	        File file1 = new File(realFilename);
	        if (!file1.exists()) {

	        //	return "redirect:list.do";
	        }
	         
	        // 파일명 지정        
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename1 + "\"");
	        try {
	            OutputStream os = response.getOutputStream();
	            FileInputStream fis = new FileInputStream(realFilename);
	 
	            int ncount = 0;
	            byte[] bytes = new byte[512];
	 
	            while ((ncount = fis.read(bytes)) != -1 ) {
	                os.write(bytes, 0, ncount);
	            }
	            fis.close();
	            os.close();
	            

	        	//return "redirect:list.do";
	        } catch (Exception e) {
	           // System.out.println("FileNotFoundException : " + e);
	
	        	//return "redirect:write.do";
	        }
	    }
	@GetMapping("/user_login.do")
	public String user_login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username= (String) session.getAttribute("user_name");
		if(username==null) {

			return MODULE_NAME + "/user_login";
			
		}
		else {

			return "redirect:list.do";
		}
	}
	
		//관리자 로그인 페이지
		@PostMapping("/user_login.do")
		public @ResponseBody Object user_check(UserVO userVO, HttpServletRequest request) {
		try {	
				//DB 통해서 가져온 유저 이름정보 생성

				String username = service.user_login_check(userVO).getUsername();
				
				//session 생성
				HttpSession session = request.getSession();
				session.setAttribute("user_name",username);
				session.setAttribute("user_id", userVO.getUserid());

				
				//검색해온 사용자 이름이 없을경우(로그인 실패)
				if(username.equals("")||username==null) {
					return 0;
					
				}
				//로그인 성공 시
				return 1;
		}
			//DB 접속 오류 시(로그인 실패)
		catch(NullPointerException e) {
			return 2;
			
		}
	}
		//사용자 로그아웃 페이지
		@GetMapping("/user_logout.do")
		public String user_logout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.removeAttribute("user_name");// 원하는 세션 제거
			session.removeAttribute("user_id");// 원하는 세션 제거
	        //session.invalidate();
	        
	        return "redirect:user_login.do";
		}
		
		//사용자 회원가입 폼
		@GetMapping("/signup.do")
		public String user_signup(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.removeAttribute("user_name");// 원하는 세션 제거
	        //session.invalidate();
	        
			return MODULE_NAME + "/signup";
		}
		
		//사용자 회원가입 정보 처리
		@PostMapping("/signup.do")
		public @ResponseBody Object user_signup( UserVO userVO, HttpServletRequest request ) {
			try {	
				HttpSession session = request.getSession();
				String getverify = (String) session.getAttribute("getverify"); //본인 인증여부 확인하는 session값
				if(getverify.equals("1")) {
				//인자 부족할 시
				if((userVO.getUserid().equals(""))||(userVO.getUsername().equals(""))||(userVO.getUserpw().equals(""))||(userVO.getUserpw_check().equals(""))) {
					return 3;
				}
				
				if(!(userVO.getUserpw().equals(userVO.getUserpw_check()))) {
					return 0;
				}
				//아이디 존재할 시
				int result = service.id_check(userVO.getUserid());
				if(result!=0) {
					return 2;
				}
				service.signup(userVO);
      	  		System.out.println("사용자 회원가입 완료 --> getverify 세션 제거");
				session.removeAttribute("getverify");// 원하는 세션 제거
				return 1;
				
				}
				return 3;
			}
			catch(NullPointerException e) {
				return 3;
				
			}
		}
		//사용자 id 중복체크 @RequestBody시 해당 id값 내용을 받음 responsBody  - 리턴값 주기 동기 방식
		@PostMapping("/id_check.do")
		public @ResponseBody Object id_check(@RequestBody String userid, HttpServletRequest request) {
			int result = service.id_check(userid);
			if(result==0) {
				return 0;
			}
			return "1";
		}
		
		@GetMapping("/user_info.do")
		public String user_info(Model model, pageObject pageObject, HttpServletRequest request) {
			HttpSession session = request.getSession();
			String user_name= (String) session.getAttribute("user_name");
			if(user_name==null) {
			return "redirect:user_login.do";
			}
			pageObject.setUserid((String) session.getAttribute("user_id"));
			model.addAttribute("list", service.user_info(pageObject));
			model.addAttribute("pageObject", pageObject);
			model.addAttribute("user_data", service.user_data(pageObject.getUserid()));

			return MODULE_NAME + "/user_info";
		}

		
//=========================================================================================================================== 공지사항
	
			//공지사항 페이지
			@GetMapping("/notice.do")
			public String noticeForm(Model model, pageObject_notice pageObject_notice, HttpServletRequest request) {
				HttpSession session = request.getSession();
				String username= (String) session.getAttribute("user_name");
				if(username==null) {

					return MODULE_NAME + "/user_login";
					
				}
				//rank 데이터 넣기
				if(!(pageObject_notice.getWord()==null)&&(!(pageObject_notice.getWord().equals("")))) {
					service.rank(pageObject_notice.getWord());
				}
				model.addAttribute("hit_rank", service.hit_data());
				model.addAttribute("rank", service.rank_data());
				model.addAttribute("list", service.notice(pageObject_notice));
				model.addAttribute("pageObject", pageObject_notice);
				
				
				
				return MODULE_NAME + "/notice";
			}
		
			//공지사항 세부사항 보여주기
			@GetMapping("/notice_view.do")
			public String notice_view(int no, Model model, int inc/* @RequestParam(defaultValue ="0")int inc */) {
				model.addAttribute("vo", service.notice_view(no, inc)); 
				return MODULE_NAME + "/notice_view";
			}

			
			//공지사항 페이지에서 공지사항 관리 누를 시 세션값 체크하여 로그인 페이지 or 공지사항 관리 페이지로 이동
			@GetMapping("/notice_login.do")
			public String admin_login(HttpServletRequest request) {
				HttpSession session = request.getSession();
				String username= (String) session.getAttribute("admin_name");
				if(username==null) {

					return MODULE_NAME + "/notice_login";
					
				}
				else {

					return "redirect:notice_admin.do";
				}
			}
			
			//관리자 로그인 페이지
			@PostMapping("/notice_login.do")
			public @ResponseBody Object admin_check(AdminVO adminVO , Model model, HttpServletRequest request) {
			try {	
					//DB 통해서 가져온 유저 이름정보 생성
					String admin_name = "";
					admin_name = service.login_check(adminVO).getUsername();
					
					//session 생성
					HttpSession session = request.getSession();
					session.setAttribute("admin_name",admin_name);
					
					//검색해온 사용자 이름이 없을경우
					if(admin_name.equals("")) {
						return 0;
					}
					//로그인 성공 시
					return 1;
			}
				//비밀번호 틀릴경우
			catch(NullPointerException e) {
				return 2;
				
			}
		}
			
			//관리자 공지사항 메인 페이지
			@GetMapping("/notice_admin.do")
			public String notice_admin(Model model, pageObject_notice pageObject_notice, HttpServletRequest request) {
				//세션확인 
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				
				model.addAttribute("list", service.notice(pageObject_notice));
				model.addAttribute("pageObject", pageObject_notice);
				
				return MODULE_NAME + "/notice_admin";
			}
			
			
			//관리자 로그아웃
			@GetMapping("/notice_logout.do")
			public String admin_logout(HttpServletRequest request) {
				HttpSession session = request.getSession();
				session.removeAttribute("admin_name");// 원하는 세션 제거
		        //session.invalidate();
		        
		        return "redirect:notice_login.do";
			}
			
			//관리자 게시판 수정 뷰 
			@GetMapping("/notice_admin_view.do")
			public String notice_admin_view(int no, Model model, int inc,  HttpServletRequest request) {
				
				//세션확인 
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				model.addAttribute("vo", service.notice_view(no, inc)); 
				return MODULE_NAME + "/notice_admin_view";
			}

			
			//관리자 공지사항 쓰기 페이지 이동
			@GetMapping("/notice_write.do")
			public String notice_writeForm( HttpServletRequest request) {
				//세션확인 
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				
				return MODULE_NAME + "/notice_write";
			}

			//관리자 새로운 공지사항 등록	
			@PostMapping("/notice_write.do")
			public String notice_write(NoticeVO vo, HttpServletRequest request) throws Exception {
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}

				// DB사용
				String fileName="";
				MultipartFile uploadFile = vo.getUploadFile();
				if (!uploadFile.isEmpty()) {
					String originalFileName = uploadFile.getOriginalFilename();

					fileName= originalFileName;
					uploadFile.transferTo(new File("C:\\Users\\pinplenet\\Desktop\\공지사항\\" + originalFileName));
				}
				vo.setFile_name(fileName);
				service.notice_write(vo);
				
				return "redirect:notice_admin.do";
			}
			//공지사항 파일다운로드	
			@GetMapping("/FileDownload2.do")
			public void download2(HttpServletRequest request,HttpServletResponse response) throws Exception{
					
				 String filename =request.getParameter("file_name"); //바이너리를 읽기 위한 파일이름
				 String filename1 =""; //다운 시 보여줄 파일 이름
				
			        String realFilename="";
			        try {
			            String browser = request.getHeader("User-Agent"); 
			            //파일 인코딩 
			            if (browser.contains("MSIE") || browser.contains("Trident")
			                    || browser.contains("Chrome")) {
			            	filename1 = new String(filename.getBytes("utf-8"),"ISO-8859-1");
			            	
			            } else {
			            	filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+","%20");
			            
			            }
			        } catch (UnsupportedEncodingException ex) {
			            System.out.println("UnsupportedEncodingException");
			        }
			        realFilename = "C:\\Users\\pinplenet\\Desktop\\공지사항\\" + filename;
			        File file1 = new File(realFilename);
			        if (!file1.exists()) {

			        }
			         
			        // 파일명 지정        
			        response.setContentType("application/octer-stream");
			        response.setHeader("Content-Transfer-Encoding", "binary;");
			        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename1 + "\"");
			        try {
			            OutputStream os = response.getOutputStream();
			            FileInputStream fis = new FileInputStream(realFilename);
			 
			            int ncount = 0;
			            byte[] bytes = new byte[512];
			 
			            while ((ncount = fis.read(bytes)) != -1 ) {
			                os.write(bytes, 0, ncount);
			            }
			            fis.close();
			            os.close();
			            

			        
			        } catch (Exception e) {
			           // System.out.println("FileNotFoundException : " + e);
			
			        }
			    }
			// 공지사항 수정 페이지 
			@GetMapping("notice_update.do")
			public String notice_updateForm(Model model, int no, int inc,  HttpServletRequest request) {
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				// model에 담아서 no, inc값을 넘긴다.
				model.addAttribute("vo", service.notice_view(no, inc));
				System.out.println("update_page_in");

				return MODULE_NAME + "/notice_update";
			}
			
			// 공지사항 글수정 처리
			@PostMapping("/notice_update.do")
			public String notice_update(NoticeVO vo, pageObject pageObject,  HttpServletRequest request) throws UnsupportedEncodingException {
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				System.out.println("update_page_out");
				service.notice_update(vo);

				// 글수정 후 notiec_admin_view 페이지의 검색창에 오류값 처리.
				if (pageObject.getWord() == null)
					pageObject.setWord("");

				return "redirect:notice_admin_view.do?no=" + vo.getNo() + "&inc=0" + "&page=" + pageObject.getPage() + "&perPageNum="
						+ pageObject.getPerPageNum() + "&word="+ URLEncoder.encode(pageObject.getWord(), "utf-8") 
						+ "&start_date=" + pageObject.getStart_date()
						+ "&end_date=" + pageObject.getEnd_date();
			}
			
			//관리자 일괄 삭제
			@PostMapping("/notice_delete_check.do")
			public String notice_delete_check(HttpServletRequest request) {
				String value = request.getParameter("value");
				String[] num = value.split(",");
				for (int i = 0; i < num.length; i++) {
					// DB사용
					service.notice_delete(Integer.parseInt(num[i]));
				}

				return "redirect:notice_admin.do";
			}
			
			//팝업
			@GetMapping("/popup.do")
			public String popup_view(int no, Model model, int inc) {
				model.addAttribute("vo", service.notice_view(no, inc =0)); 
				return MODULE_NAME + "/popup";
			}

			//팝업창 공지사항 가져오기
			@PostMapping("/popup_list.do")
			public @ResponseBody List<String> popup_list(@RequestParam("key") String key) { //json으로 보내준 parm  key값 가져옵니다.
				
				//인증된 경로로 요청된 데이터인지 확인
				if(key.equals("key")) {
					List<String> list= service.popup_list();
				return list;
				
				}
				return null;
			}
			//팝업 공지사항 가져오기
			@GetMapping("/notice_admin_popup")
			public String notice_admin_popup(Model model, pageObject_notice pageObject_notice, HttpServletRequest request) {
				//세션확인 
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}
				
				model.addAttribute("list", service.notice_popup(pageObject_notice));
				model.addAttribute("pageObject", pageObject_notice);
				
				return MODULE_NAME + "/notice_admin_popup";
			}

			// 선택된 항목 팝업에 넣기
			@PostMapping("/popup_push.do")
			public @ResponseBody String popup_push(HttpServletRequest request) {
				String popup_date =request.getParameter("end_date");
				String value = request.getParameter("value");
				String[] num = value.split(",");
				System.out.println("popup_push_success");
				for (int i = 0; i < num.length; i++) {
					// DB사용
					service.popup_push(Integer.parseInt(num[i]),popup_date);
				}

				return "redirect:notice_admin.do";
			}
			
			//팝업 삭제하기
			@PostMapping("/popup_delete.do")
			public String popup_delete(HttpServletRequest request) {
				String value = request.getParameter("value");
				String[] num = value.split(",");
				System.out.println("popup_push_success");
				for (int i = 0; i < num.length; i++) {
					// DB사용
					service.popup_delete(Integer.parseInt(num[i]));
				}

				return "redirect:notice_admin_popup.do";
			}

			@GetMapping("/list_admin.do")
			public String list_admin(Model model, pageObject pageObject, HttpServletRequest request) {
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}

				model.addAttribute("list", service.list(pageObject));
				model.addAttribute("pageObject", pageObject);

				return MODULE_NAME + "/list_admin";
			}
			// 관리자 게시판 글보기
			@GetMapping("/view_admin.do")
			public String admin_view(int no, Model model, int inc, HttpServletRequest request) {

				model.addAttribute("vo", service.view(no, inc));
				return MODULE_NAME + "/view_admin";
			}
			
			// 회원 관리 페이지
			@GetMapping("/user_controller.do")
			public String user_controller(Model model, pageObject pageObject, HttpServletRequest request) {
				HttpSession session = request.getSession();
				String admin_name= (String) session.getAttribute("admin_name");
				if(admin_name==null) {
				return "redirect:notice_login.do";
				}

				model.addAttribute("list", service.user_list(pageObject));
				model.addAttribute("pageObject", pageObject);

				return MODULE_NAME + "/user_controller";
			}
			
			//관리자 일괄 삭제
			@PostMapping("/user_delete.do")
			public String user_delete(HttpServletRequest request) {
				String value = request.getParameter("value");
				String[] id = value.split(",");
				for (int i = 0; i < id.length; i++) {
					// DB사용
					service.user_delete(id[i]);
					service.user_board_delete(id[i]);
				}

				return "redirect:user_controller.do";
			}

			// test
						@GetMapping("/test.do")
						public String test() {
							return MODULE_NAME + "/test";
						}
						
}