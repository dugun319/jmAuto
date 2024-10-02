package com.oracle.jmAuto.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.jmAuto.dto.Faq;
import com.oracle.jmAuto.dto.Notice_Table;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.jw.CsService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@Slf4j
public class JwController {
	private final CsService cs;
	
	// 1. 메인페이지에서 CS 메인으로 이동되었을때
	@GetMapping(value = "/view_jw/csMain")
	public String csMain() {
		System.out.println("JwController csMain Start...");
		
		return "view_jw/csMain";
	}
	
	// 2. 자주묻는질문: 카테고리별 내용 가져오기
	@GetMapping(value = "/view_jw/csFaq")
	public String listFaqCategory(@RequestParam(value = "faqCls", required = false) 
									String faqCls, Model model) {
		System.out.println("JwController listFaqCategory Start...");
		System.out.println("JwController listFaqCategory faqCls->"+faqCls);
		
		List<Faq> listFaq = cs.listFaq();
		System.out.println("JwController listFaqCategory listFaq.size->"+listFaq.size());
		
		model.addAttribute("listFaq", listFaq);
		model.addAttribute("selectCls", faqCls);	//선택된 카테고리 값
		
		return "view_jw/csFaq";
	}		
	
	// 3. 신고·문의·민원
	
	// 3-1. 로그인 안한 비회원을 로그인하는 새 창으로 유도
	@RequestMapping(value = "/view_jw/csNotLogin")
	public String notLogin() {
		System.out.println("JwController notLogin Start...");
		
		return "view_jw/csNotLogin";
	}
	
	
	// 3-2. 로그인 한 회원에게 팝업창 뜸
	@RequestMapping(value = "/view_jw/csQna")
	public String qnaPop(HttpSession session, Model model) {
		System.out.println("JwController qnaPop Start...");
		
		// 유저 정보 가져오기
		User_Table user = (User_Table) session.getAttribute("user");
		String user_id = user.getUser_id();
		System.out.println("JwController writeQna user_id->"+user_id);
		
		// 팝업창 띄우기
		List<Qna> qnaCls = cs.listQna();
		System.out.println("JwController qnaPop qnaCls.size()->"+qnaCls.size());
		
		model.addAttribute("qnaClsList", qnaCls);		
		
		return "view_jw/csQna";
	}
	
	// 3-3. QnA 팝업창 내용작성
	@PostMapping(value = "/writeQna")
	public String writeQna(HttpSession session, Model model,
							@RequestParam ("qna_cls")		String qna_cls,
							@RequestParam ("qna_title")		String qna_title,
							@RequestParam ("qna_content")	String qna_content,
							@RequestParam (value = "file_name", required = false) String file_name,
							@RequestParam (value = "file_url", required = false) String file_url) {
		System.out.println("JwController writeQna Start...");
		
		// 유저 정보 가져오기
		User_Table user = (User_Table) session.getAttribute("user");
		String user_id = user.getUser_id();
		System.out.println("JwController writeQna user_id->"+user_id);
		
		// QnA 객체 생성
		Qna qna = new Qna(); 
	   
	    qna.setQna_cls(qna_cls);
	    qna.setQna_title(qna_title);
	    qna.setQna_content(qna_content);
	    qna.setFile_name(file_name);  // 파일 이름 설정 
	    qna.setFile_url(file_url);    // 파일 경로 설정
	    qna.setUser_id(user_id);	// 유저 아이디 가져오기

		System.out.println("JwController writeQna qna->"+qna);

        // QnA 데이터 저장
		int insertResult = cs.insertQna(qna);
		System.out.println("JwController writeQna insertResult->"+insertResult);
		
		// 성공시 팝업을 닫고, 다른 새 창으로 이동
		if (insertResult > 0) {
	//		model.addAttribute("script", "window.opener.location.href='/view_jw/csQnaSuccess'; window.close();");
			model.addAttribute("successYN", "1");
			return "view_jw/csSuccess";
		
		// 실패시
		} else {
			model.addAttribute("msg", "작성 실패. 내용을 확인해주세요.");
			
			return "forward:view_jw/csQna";
		}
        
	}
	// 3-4. 확인버튼 눌렀을 때 이동되는 창
	@GetMapping(value = "/view_jw/csQnaSuccess")
	public String confirmQna() {
		System.out.println("JwController confirmQna Start...");
	
		return "view_jw/csQnaSuccess";
	}
	
	// 4-1. 공지사항 및 약관: 카테고리별 내용 가져오기
	@GetMapping(value = "/view_jw/csNotice")
	public String listNoticeQna(@RequestParam(value = "noticeCls", required = false)
								String noticeCls, Model model) {
		System.out.println("JwController listNoticeQna Start...");
		System.out.println("JwController listNoticeQna noticeCls->"+noticeCls);
		
		List<Notice_Table> listNotice = cs.listNotice();
		System.out.println("JwController listNoticeQna listNoticeQna.size->"+listNotice.size());
		System.out.println("JwController listNoticeQna listNotice->"+listNotice);
		
		model.addAttribute("listNotice", listNotice);
		model.addAttribute("selNoticeCls", noticeCls);
		
		return "view_jw/csNotice";
	}
	
	// 4-2. 공지사항 및 약관: 제목 누르면 나오는 상세페이지
	@RequestMapping(value = "/view_jw/csNoticeSelect") 
	public String detailNotice(Notice_Table notice_table1, Model model) {
		System.out.println("JwController confirmNotice Start...");
		System.out.println("JwController confirmNotice notice_table1->"+notice_table1);
		
		Notice_Table notice_table = cs.detailNotice(notice_table1.getNotice_num());
		System.out.println("JwController confirmNotice notice_table->"+notice_table);
		
		model.addAttribute("notice_table", notice_table);
	
		return "view_jw/csNoticeSelect";
	}
}
