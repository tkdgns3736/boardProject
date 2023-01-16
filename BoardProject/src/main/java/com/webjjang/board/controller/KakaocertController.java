package com.webjjang.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kakaocert.api.KakaocertException;
import com.kakaocert.api.KakaocertService;
import com.kakaocert.api.verifyauth.RequestVerifyAuth;
import com.kakaocert.api.verifyauth.ResultVerifyAuth;

@Controller
@RequestMapping("/board")
public class KakaocertController {
	
  @Autowired
  private KakaocertService kakaocertService;
  
  // 이용기관코드
  // 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  @Value("#{EXAMPLE_CONFIG.ClientCode}")
  private String ClientCode;
  
  @RequestMapping(value = "/kakao.do", method = RequestMethod.POST)
  public @ResponseBody HashMap <String, String> RequestVerifyAuth(Model m, HttpServletRequest request_value) {
   
	  HashMap<String, String> result = new HashMap <String,String>();
	  try {
   
      // 본인인증 요청 정보 Object
      RequestVerifyAuth request = new RequestVerifyAuth();
      
      // 고객센터 전화번호  , 카카오톡 인증메시지 중 "고객센터" 항목에 표시
      request.setCallCenterNum("1600-9999");
      
      // 인증요청 만료시간(초), 최대값 : 1000  인증요청 만료시간(초) 내에 미인증시, 만료 상태로 처리됨 (권장 : 300)
      request.setExpires_in(300);
      
      // 수신자 생년월일, 형식 : YYYYMMDD
      request.setReceiverBirthDay(request_value.getParameter("birth"));
      
      // 수신자 휴대폰번호  
      request.setReceiverHP(request_value.getParameter("phone"));
      
      // 수신자 성명 
      request.setReceiverName(request_value.getParameter("username"));
      
      // 인증요청 메시지 부가내용, 카카오톡 인증메시지 중 상단에 표시
      request.setTMSMessage("부가메시지 내용");
      
      // 별칭코드, 이용기관이 생성한 별칭코드 (파트너 사이트에서 확인가능)
      // 카카오톡 인증메시지 중 "요청기관" 항목에 표시
      // 별칭코드 미 기재시 이용기관의 이용기관명이 "요청기관" 항목에 표시
      request.setSubClientID("");
      
      // 인증요청 메시지 제목, 카카오톡 인증메시지 중 "요청구분" 항목에 표시
      request.setTMSTitle("TMS Title");
      
      // 원문, 보안을 위해 1회용으로 생성
      // 인증완료시, getVerifyAuthResult API의 returnToken 항목값으로 반환
      request.setToken("20200504-01");
    
      /*
      * 인증서 발급유형 선택
      *   true : 휴대폰 본인인증만을 이용해 인증서 발급
      *   false : 본인계좌 점유 인증을 이용해 인증서 발급
      * 
      * - 인증메시지를 수신한 사용자가 카카오인증 비회원일 경우,
      *   카카오인증 회원등록 절차를 거쳐 은행계좌 실명확인 절차이후 전자서명 가능
      */
      request.setAllowSimpleRegistYN(false);
    
      /*
      * 수신자 실명확인 여부  
      * true : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 ReceiverName 값을 비교
      * false : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 RecevierName 값을 비교하지 않음. 
      */
      request.setVerifyNameYN(true);
    
      // PayLoad, 이용기관이 API 요청마다 생성한 payload(메모) 값
      request.setPayLoad("memo Info");
      
      String receiptID = kakaocertService.requestVerifyAuth(ClientCode, request);
      HttpSession session = request_value.getSession();
      session.setAttribute("receiptID",receiptID);
      System.out.println("인증요청 id"+receiptID);
     
    } catch(KakaocertException ke) {
    	result.put("Msg", "0");
    	System.out.println(ke.getCode());
    	return result;
   
    }
	  	System.out.println("카카오 인증 요청");
		result.put("Msg", "1");
		

    return result;
  }
  
  // 카카오인증 팝업 로드
  @RequestMapping(value = "/kakao.do", method = RequestMethod.GET)
  public String kakao_page(Model m) {
	
	  
	  
	return "board/kakao";
  }
  
  // 카카오톡 인증 verify값 가져오기.
  @RequestMapping(value = "kakao_getVerify.do", method = RequestMethod.POST)
  public @ResponseBody Object getVerifyAuthState(Model m, HttpServletRequest request) {
      
		// 본인인증 요청시 반환된 접수아이디 
	  	HttpSession session = request.getSession();
		String receiptID = (String) session.getAttribute("receiptID");
      try {
          ResultVerifyAuth result = kakaocertService.getVerifyAuthState(ClientCode, receiptID);
          
          
          
          if(result.getState()==0){ //인증 실패(전)
    	  		System.out.println("카카오 인증 값 확인 실패 --> 인증 실패 세션 생성" + result.getState());
        	  session.setAttribute("getverify", "0");
        	  return 0;
          }
          if(result.getState()==1){ //인증 안료
      	  		System.out.println("카카오 인증 값 확인 완료 --> 인증 성공 세션 생성"+ result.getState());
        	  session.removeAttribute("receiptID");// 사용한 receiptID 제거
        	  session.setAttribute("getverify", "1"); //회원가입을 위한 상태 세션 추가
        	  return 1;
          }
      } catch(KakaocertException ke) {
			m.addAttribute("Exception", ke);
			return 0;
      }
     
     
      return 0;
  }
  

  
}