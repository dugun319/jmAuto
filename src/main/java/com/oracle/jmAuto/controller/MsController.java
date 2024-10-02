package com.oracle.jmAuto.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.jmAuto.dao.ms.MsDaoImpl;
import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Note;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.Review;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.dto.Zzim;
import com.oracle.jmAuto.service.ms.MsService;
import com.oracle.jmAuto.service.ms.MsServiceImpl;

import jakarta.persistence.metamodel.SetAttribute;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
//@RequestMapping("/jmAuto/MS")
@RequiredArgsConstructor
public class MsController {
	private final MsService ms;

	// 마이페이지 -> 사용자 유형별로 이동
	@GetMapping(value = "/view_ms/myPage")
	public String myPage(Model model, HttpSession session) {
		System.out.println("mscontroller myPage start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_type = user_table.getUser_type();
		System.out.println("사용자 유형:" + user_type);

		switch (user_type) {
		case "B":
			return myPage_B(model, session); // 구매자
		case "S":
			return myPage_S(model, session); // 판매자
		case "P":
			return myPage_P(model, session); // 전문가
		}
		return "redirect:/error";
	}

	// 마이페이지 메인 (B) - 구매자
	@GetMapping(value = "/view_ms/myPage_B")
	public String myPage_B(Model model, HttpSession session) {
		System.out.println("mscontroller myPage_B strat...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();

		// 결제 리스트 나오게
		List<Payment> buyList = null;
		buyList = ms.buyList(user_id);
		System.out.println("MsController buyList ->" + buyList);
		model.addAttribute("Payment", buyList);

		// 관심목록 리스트 나오게
		List<Zzim> ZzimList = null;
		ZzimList = ms.findZzim(user_id);
		System.out.println("MsController findZzim ZzimList->" + ZzimList);
		model.addAttribute("Zzim", ZzimList);

		return "view_ms/myPage_B";
	}

	// 마이페이지 메인 (S)- 판매자
	@GetMapping(value = "/view_ms/myPage_S")
	public String myPage_S(Model model, HttpSession session) {
		System.out.println("mscontroller myPage_S strat...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();

		// 나의 판매중인 차량 나오게
		List<Car_General_Info> sellCar = null;
		sellCar = ms.sellCar(user_id);
		System.out.println("mscontroller myPage_S sellCar->" + sellCar);
		model.addAttribute("Car_General_Info", sellCar);

		// 나의 문의내역 나오게
		List<Qna> QnaList = null;
		QnaList = ms.QnaList(user_id);
		System.out.println("mscontroller myPage_P QnaList ->" + QnaList);
		model.addAttribute("Qna", QnaList);

		return "view_ms/myPage_S";
	}

	// 마이페이지 메인 (P) - 전문가
	@GetMapping(value = "/view_ms/myPage_P")
	public String myPage_P(Model model, HttpSession session) {
		System.out.println("mscontroller myPage_P strat...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();

		// 나의 전문가리뷰 나오게
		List<Expert_Review> expert_reviewList = null;
		expert_reviewList = ms.myExpertReview(user_id);
		System.out.println("mscontroller myPage_P expertReviews expert_reviewList->" + expert_reviewList);
		model.addAttribute("Expert_Review", expert_reviewList);

		// 나의 문의내역 나오게
		List<Qna> QnaList = null;
		QnaList = ms.QnaList(user_id);
		System.out.println("mscontroller myPage_P QnaList ->" + QnaList);
		model.addAttribute("Qna", QnaList);

		return "view_ms/myPage_P";
	}

	// 로그아웃 페이지
	@GetMapping(value = "/view_ms/logout")
	public String logout(HttpSession session, Model model) {
		log.info("MainController logout started");
		session.invalidate();
		return "redirect:/";
	}

	// 로그아웃 (세션 해제)
//	@GetMapping(value = "/logout")
//	public String logout(HttpSession session, Model model) {
//		System.out.println("JmController.logout start.....");
//		session.invalidate();
//		return "redirect:/";
//	}

	// 마이페이지(구매자) 1.-> 회원정보수정 누르면 실행되는 체크화면..
	@GetMapping(value = "/view_ms/myPageEditCheck")
	public String checkPassword(User_Table user_table, Model model) {
		System.out.println("msController checkPassword userTable->" + user_table);
		return "view_ms/myPageEditCheck";
	}

	// 마이페이지(전문가) 1.-> 회원정보수정 누르면 실행되는 체크화면..
	@GetMapping(value = "/view_ms/myPageEditCheck_P")
	public String checkPassword_P(User_Table user_table, Model model) {
		System.out.println("msController checkPassword_P userTable->" + user_table);
		return "view_ms/myPageEditCheck_P";
	}

	// 마이페이지(판매자) 1.-> 회원정보수정 누르면 실행되는 체크화면..
	@GetMapping(value = "/view_ms/myPageEditCheck_S")
	public String checkPassword_S(User_Table user_table, Model model) {
		System.out.println("msController checkPassword_S userTable->" + user_table);
		return "view_ms/myPageEditCheck_S";
	}

	// (구매자)비밀번호가 안맞으면 위에 1번으로, 맞게 적으면 해당 로직을 돌려서 2번으로
	@GetMapping("/view_ms/myPageEdit")
	public String pwCheck(Model model, HttpSession session) {
		User_Table user_table = (User_Table) session.getAttribute("user");
		if (user_table != null) { // 사용자 정보를 모델에 추가하여 뷰에서 사용
			model.addAttribute("user", user_table);
			return "view_ms/myPageEdit"; // 회원정보 수정 페이지로 이동
		} else {
			return "redirect:/login"; // 세션에 정보가 없으면 로그인 페이지로 리다이렉트
		}
	}

	// (판매자)비밀번호가 안맞으면 위에 1번으로, 맞게 적으면 해당 로직을 돌려서 2번으로
	@GetMapping("/view_ms/myPageEdit_S")
	public String pwCheck_S(Model model, HttpSession session) {
		User_Table user_table = (User_Table) session.getAttribute("user");
		if (user_table != null) { // 사용자 정보를 모델에 추가하여 뷰에서 사용
			model.addAttribute("user", user_table);
			return "view_ms/myPageEdit_S"; // 회원정보 수정 페이지로 이동
		} else {
			return "redirect:/login"; // 세션에 정보가 없으면 로그인 페이지로 리다이렉트
		}
	}

	// (전문가)비밀번호가 안맞으면 위에 1번으로, 맞게 적으면 해당 로직을 돌려서 2번으로
	@GetMapping("/view_ms/myPageEdit_P")
	public String pwCheck_P(Model model, HttpSession session) {
		User_Table user_table = (User_Table) session.getAttribute("user");
		if (user_table != null) { // 사용자 정보를 모델에 추가하여 뷰에서 사용
			model.addAttribute("user", user_table);
			return "view_ms/myPageEdit_P"; // 회원정보 수정 페이지로 이동
		} else {
			return "redirect:/login"; // 세션에 정보가 없으면 로그인 페이지로 리다이렉트
		}
	}

	// 마이페이지 2.-> 회원정보 수정시 두 비밀번호체크 로직 (ajax로 갔다가 돌아오는 거임)
	@ResponseBody
	@GetMapping(value = "/view_ms/pwChk")
	public int checkPassword(String input_pw, HttpSession session, Model model) {
		System.out.println("mscontroller checkPassword String user_pw start...");
		int result = 0;
		User_Table user_table = (User_Table) session.getAttribute("user"); // 세션의 정보 가져오기

		if (user_table != null) {
			model.addAttribute("user", user_table);
		}
		String myselfid = user_table.getUser_id(); // 위에서 세션의 정보를 가져왔으니 거기서 id 가져오기
		String dbUser_pw = ms.findByPw(myselfid); // db에서 가져온 id에 실제 저장되어 있는 패스워드

		System.out.println("checkPassword user_table. getid->" + user_table.getUser_id());
		System.out.println("checkPassword 옴 input_pw-> " + input_pw); // 내가 입력한 패스워드가 무엇인가
		System.out.println("checkPassword 옴 dbUser_pw->" + dbUser_pw);// 실제 db 패스워드

		if (input_pw.equals(dbUser_pw)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	// 회원정보 수정 로직
	@PostMapping("/myPageEdit")
	public String userUpdate(@RequestParam String user_id, @RequestParam String user_pw1, @RequestParam String user_pw2,
			@RequestParam String user_tel, @RequestParam String user_zipcode, @RequestParam String user_addr1,
			@RequestParam String user_addr2) {
		System.out.println("mscontroller userUpdate start...");
		User_Table user_table = new User_Table();
		user_table.setUser_id(user_id);
		user_table.setUser_pw(user_pw1);
		user_table.setUser_tel(user_tel);
		user_table.setUser_zipcode(user_zipcode);
		user_table.setUser_addr1(user_addr1);
		user_table.setUser_addr2(user_addr2);
//위처럼 담아서 호출하는 게 맞는 것 같은데 안해도 가능하네..?->클래스 필드일음과 파라미터 이름이 일치해서 자동으로 설정된것.(자동데이터바인딩 덕분)
		System.out.println("user_pw1->" + user_pw1);
		System.out.println("user_pw2->" + user_pw2);
		System.out.println("user_table->" + user_table);
		ms.userUpdate(user_table);
		System.out.println("user_table->" + user_table);
		return "view_ms/userUpdate";
	}

	// 구매내역
	@GetMapping(value = "/view_ms/buyList")
	public String buyList(Model model, HttpSession session) {
		System.out.println("mscontroller buyList start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller buyList user_id->" + user_id);

		List<Payment> buyList = null;
		buyList = ms.buyList(user_id);
		System.out.println("MsController buyList ->" + buyList);
		model.addAttribute("Payment", buyList);
		return "view_ms/buyList";
	}

	// 구매내역 -> 상세페이지
	@GetMapping(value = "/view_ms/buyListDetail")
	public String buyListDetail(Model model, HttpSession session, @RequestParam String sell_num) {
		System.out.println("msController buyListDetail start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller buyListDetail user_id->" + user_id);

		Payment sellnum = ms.buyListDetail(sell_num, user_id);
		System.out.println("MsController buyListDetail approvalnum ->" + sellnum);
		model.addAttribute("Payment", sellnum);
		return "view_ms/buyListDetail";
	}

	// 구매상세 -> 후기 작성하는 화면으로 이동
	@GetMapping(value = "/view_ms/hoogi")
	public String hoogi(Model model, Payment payment) {
		System.out.println("msController hoogi payment.getSell_num->" + payment.getSell_num());
		model.addAttribute("sell_num", payment.getSell_num());
		return "view_ms/hoogiWrite";
	}

	// 구매상세 -> 후기 저장하는 로직
	@PostMapping(value = "/hoogiwrite")
	public String hoogiwrite(HttpSession session, Model model, @RequestParam String review_title,
			@RequestParam String review_content, @RequestParam int evaluation, @RequestParam long sell_num) {
		System.out.println("msController hoogiwrite start..");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();

		Map<String, Object> params = new HashMap<>();
		params.put("user_id", user_id);
		params.put("review_title", review_title);
		params.put("review_content", review_content);
		params.put("evaluation", evaluation);
		params.put("sell_num", sell_num);

		int result = ms.hoogiwrite(params);
		if (result > 0) {
			System.out.println("mscontroller hoogiwrite result->" + result);
			return "redirect:/view_ms/hoogiList";
		} else {
			System.out.println("mscontroller hoogiwrite error->");
			return "redirect:/someErrorPage";
		}
	}

	// 구매상세 -> 후기보는 화면으로 이동
	@GetMapping(value = "/view_ms/hoogiList")
	public String hoogiList(HttpSession session, Model model) {
		System.out.println("msController hoogiList start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("msController hoogiList user_id->" + user_id);

		List<Review> reviews = ms.myhoogi(user_id);
		model.addAttribute("reviews", reviews);
		System.out.println("mscontroller hoogiList reviews->" + reviews);
		return "view_ms/hoogiList";
	}

	// 관심목록(판매자)
	@GetMapping(value = "/view_ms/myZzim")
	public String myZzim(Model model, HttpSession session) {
		System.out.println("mscontroller myZzim start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myZzim user_id->" + user_id);

		List<Zzim> ZzimList = null;
		ZzimList = ms.findZzim(user_id);
		System.out.println("MsController myZzim ZzimList->" + ZzimList);
		model.addAttribute("Zzim", ZzimList);
		return "view_ms/myZzim";
	}

	// 관심목록(전문가)
	@GetMapping(value = "/view_ms/myZzim_P")
	public String myZzim_P(Model model, HttpSession session) {
		System.out.println("mscontroller myZzim_P start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myZzim_P user_id->" + user_id);

		List<Zzim> ZzimList = null;
		ZzimList = ms.findZzim(user_id);
		System.out.println("MsController myZzim_P ZzimList->" + ZzimList);
		model.addAttribute("Zzim", ZzimList);
		return "view_ms/myZzim_P";
	}

	// 내가 구매한 리뷰리스트
	@GetMapping(value = "/view_ms/reviewList")
	public String reviewList(Model model, HttpSession session) {
		log.info("MsController reviewList start..");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller reviewList user_id->" + user_id);

		List<Expert_Review> expertReviews = null;
		expertReviews = ms.expertReviews(user_id);
		model.addAttribute("Expert_Review", expertReviews);
		System.out.println("mscontroller reviewList expertreviews->" + expertReviews);
		return "view_ms/reviewList";
	}

	// 전문가리뷰 구매내역 -> 상세페이지
	@GetMapping(value = "/view_ms/reviewListDetail")
	public String reviewDetail(Model model, HttpSession session, @RequestParam String expert_num) {
		System.out.println("msController reviewDetail start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller reviewDetail user_id->" + user_id);

		Expert_Review expertnum = ms.reviewDetail(expert_num, user_id);
		System.out.println("MsController reviewDetail expertnum ->" + expertnum);
		model.addAttribute("Expert_Review", expertnum);
		return "view_ms/reviewListDetail";
	}

	// 문의내역(구매자)
	@GetMapping(value = "/view_ms/myQna")
	public String myQnaList(Model model, HttpSession session) {
		System.out.println("mscontroller myQnaList start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaList user_id->" + user_id);

		List<Qna> QnaList = null;
		QnaList = ms.QnaList(user_id);
		System.out.println("MsController myQnaList QnaList ->" + QnaList);
		model.addAttribute("Qna", QnaList);
		return "view_ms/myQna";
	}

	// 문의내역(전문가)
	@GetMapping(value = "/view_ms/myQna_P")
	public String myQnaList_P(Model model, HttpSession session) {
		System.out.println("mscontroller myQnaList_P start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaList_P user_id->" + user_id);

		List<Qna> QnaList = null;
		QnaList = ms.QnaList(user_id);
		System.out.println("MsController myQnaList_P QnaList ->" + QnaList);
		model.addAttribute("Qna", QnaList);
		return "view_ms/myQna_P";
	}

	// 문의내역(판매자)
	@GetMapping(value = "/view_ms/myQna_S")
	public String myQnaList_S(Model model, HttpSession session) {
		System.out.println("mscontroller myQnaList_S start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaList_S user_id->" + user_id);

		List<Qna> QnaList = null;
		QnaList = ms.QnaList(user_id);
		System.out.println("MsController myQnaList_S QnaList ->" + QnaList);
		model.addAttribute("Qna", QnaList);
		return "view_ms/myQna_S";
	}

	// 문의내역(구매자) -> 상세페이지
	@GetMapping(value = "/view_ms/myQnaDetail")
	public String myQnaDetail(Model model, HttpSession session, @RequestParam long qna_num) {
		System.out.println("msController myQnaDetail start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaDetail user_id->" + user_id);

		Qna qnanum = ms.myQnaDetail(qna_num, session);

		System.out.println("MsController myQnaDetail qnanum ->" + qnanum);
		model.addAttribute("Qna", qnanum);
		return "view_ms/myQnaDetail";
	}

	// 문의내역(전문가) -> 상세페이지
	@GetMapping(value = "/view_ms/myQnaDetail_P")
	public String myQnaDetail_P(Model model, HttpSession session, @RequestParam long qna_num) {
		System.out.println("msController myQnaDetail_P start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaDetail_P user_id->" + user_id);

		Qna qnanum = ms.myQnaDetail(qna_num, session);

		System.out.println("MsController myQnaDetail_P qnanum ->" + qnanum);
		model.addAttribute("Qna", qnanum);
		return "view_ms/myQnaDetail_P";
	}

	// 문의내역(판매자) -> 상세페이지
	@GetMapping(value = "/view_ms/myQnaDetail_S")
	public String myQnaDetail_S(Model model, HttpSession session, @RequestParam long qna_num) {
		System.out.println("msController myQnaDetail_S start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myQnaDetail_S user_id->" + user_id);

		Qna qnanum = ms.myQnaDetail(qna_num, session);

		System.out.println("MsController myQnaDetail_S qnanum ->" + qnanum);
		model.addAttribute("Qna", qnanum);
		return "view_ms/myQnaDetail_S";
	}

	// 문의내역(구매자) -> 선택삭제 (update 변경완)
	@PostMapping("/myQnaDelete")
	public String deleteQna(HttpSession session, @RequestBody List<Long> Qnanum) {
		System.out.println("mscontroller deleteQna start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller deleteQna user_id->" + user_id);
		System.out.println("mscontroller deleteQna Qnanum->" + Qnanum);

		int deleteQna = ms.deleteQna(user_id, Qnanum);
		System.out.println("MsController deleteQna ->" + deleteQna);
		return "redirect:/view_ms/myQna";
	}

	// 문의내역(전문가) -> 선택삭제 (update 변경완)
	@PostMapping("/myQnaDelete_P")
	public String deleteQna_P(HttpSession session, @RequestBody List<Long> Qnanum) {
		System.out.println("mscontroller deleteQna_P start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller deleteQna_P user_id->" + user_id);
		System.out.println("mscontroller deleteQna_P Qnanum->" + Qnanum);

		int deleteQna = ms.deleteQna(user_id, Qnanum);
		System.out.println("MsController deleteQna_P ->" + deleteQna);
		return "redirect:/view_ms/myQna_P";
	}

	// 문의내역(판매자) -> 선택삭제(update 변경완)
	@PostMapping("/myQnaDelete_S")
	public String deleteQna_S(HttpSession session, @RequestBody List<Long> Qnanum) {
		System.out.println("mscontroller deleteQna_S start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller deleteQna_S user_id->" + user_id);
		System.out.println("mscontroller deleteQna_S Qnanum->" + Qnanum);

		int deleteQna = ms.deleteQna(user_id, Qnanum);
		System.out.println("MsController deleteQna_S ->" + deleteQna);
		return "redirect:/view_ms/myQna_S";
	}
	

	//쪽지확인
	@GetMapping("/view_ms/myNote")
	public String myNote(HttpSession session, Model model,Note note){
		System.out.println("mscontroller myNote start....");
		User_Table user_table =(User_Table)session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myNote notesd->"+user_id);
		
		List<Note> myNoteList = null;
		myNoteList =ms.myNote(user_id);
		model.addAttribute("Note",myNoteList);
		System.out.println("mscontroller myNote myNoteList->"+myNoteList);
		return "view_ms/myNote";
		
	}
	
	//쪽지확인 -> 상세확인
	@GetMapping("/view_ms/myNoteDetail")
	public String myNoteDetail(HttpSession session, Model model,
			@RequestParam int note_num){
		System.out.println("mscontroller myNoteDetail start....");
		User_Table user_table =(User_Table)session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myNoteDetail notesd->"+user_id);	
		System.out.println("mscontroller myNoteDetail note_num->"+note_num);
		
		Note noteDetail =ms.myNoteDetail(user_id, note_num);
		model.addAttribute("Note",noteDetail);
		System.out.println("mscontroller myNoteDetail myNoteList->"+noteDetail);
		return "view_ms/myNoteDetail";
		
	}
	

   //쪽지 답장하는 화면으로 넘어가는 로직
	@GetMapping("/view_ms/myNoteDabjangWrite")
	public String myNoteDabjang(HttpSession session,Model model, @RequestParam int note_num, Note note) {
		System.out.println("mscontroller myNoteDabjang start..");
		System.out.println("mscontroller myNoteDabjang note_num->"+note_num);
		model.addAttribute("note_num", note_num);
		
		User_Table user_table =(User_Table)session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myNoteDetail notesd->"+user_id);
		
		Note noteDetail =ms.myNoteDetail(user_id, note_num);
		model.addAttribute("Note",noteDetail);
		
		return "view_ms/myNoteDabjangWrite";
	}
	
	//쪽지 답장 저장하는 로직
	@PostMapping("view_ms/myNoteDabjangWrite")
	public String myNoteDabjang(HttpSession session, 
							    @RequestParam int note_num,
							    @RequestParam String note_rd,
							    @RequestParam String note_title,
							    @RequestParam String note_content) {
		System.out.println("mscontroller myNoteDabjang start...");
		User_Table user_table = (User_Table)session.getAttribute("user");
		String note_sd = user_table.getUser_id();
		System.out.println("mscontroller myNoteDabjang note_sd->"+note_sd);
		System.out.println("mscontroller myNoteDabjang note_rd->"+note_rd);
		System.out.println("mscontroller myNoteDabjang note_num->"+note_num);
		System.out.println("mscontroller myNoteDabjang note_title->"+note_title);	
		System.out.println("mscontroller myNoteDabjang note_content->"+note_content);	
		
		Map<String, Object> params = new HashMap<>();
		params.put("note_sd", note_sd);
		params.put("note_rd", note_rd);
		params.put("note_num", note_num);
		params.put("note_title", note_title);
		params.put("note_content", note_content);
		
		int result = ms.noteDabjang(params);	
		
		if(result>0) {
			System.out.println("mscontroller DabjangWrite params->"+params);
			System.out.println("mscontroller DabjangWrite result->"+result);
			return "direct:/view_ms/myNoteDetail";
		}else {
			System.out.println("mscontroller DabjangWrite error->");
			return "redirect:/someErrorPage";
		}
	}
	
	
	//쪽지 삭제
	@PostMapping("/myNoteDelete")
	public String deleteNote(HttpSession session, @RequestBody int note_num ) {
		System.out.println("mscontroller myNoteDelete start...");
		User_Table user_table = (User_Table)session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontoller NoteDelete user_id->"+user_id);
		System.out.println("mscontoller NoteDelete note_num->"+note_num);
		int deleteNote=ms.deleteNote(note_num);
		return "redierct:/view_ms/myNote";
	}


	

	// 내가 작성한 후기 삭제(update변경완)
	@PostMapping("/myHoogiDelete")
	public String myHoogiDelete(HttpSession session, @RequestBody List<String> approval_num) {
		System.out.println("msController myHoogiDelete start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myHoogiDelete user_id->" + user_id);
		System.out.println("mscontroller myHoogiDelete approval_num->" + approval_num);

		int hoogiDelete = ms.hoogiDelete(user_id, approval_num);
		System.out.println("mscontroller myHoogiDelete hoogiDelete->" + hoogiDelete);
		return "redirect:/view_ms/hoogiList";

	}

	// 나의 관심목록 삭제
	@PostMapping("/myZzimDelete")
	public String myZzimDelete(HttpSession session, @RequestBody List<Long> sell_num) {
		System.out.println("mscontroller myZzimDelete start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myZzimDelete user_id->" + user_id);
		System.out.println("mscontroller myZzimDelete sell_num->" + sell_num);

		int deleteZzim = ms.deleteZzim(user_id, sell_num);
		System.out.println("mscontroller myZzimDelete deleteZzim->" + deleteZzim);
		return "redirect:/view_ms/myZzim";
	}

	// 전문가- 나의 전문가 리뷰 보기
	@GetMapping("/view_ms/myExpertReview")
	public String myExpertReview(HttpSession session, Model model) {
		System.out.println("mscontroller myExpertReview start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myExpertReview user_id->" + user_id);

		List<Expert_Review> expert_review = null;
		expert_review = ms.myExpertReview(user_id);
		model.addAttribute("Expert_Review", expert_review);
		return "view_ms/myExpertReview";
	}

	// 전문가- 나의 전문가 리뷰 상세보기
	@GetMapping("/view_ms/myExpertReviewDetail")
	public String myExpertReviewDetail(HttpSession session, Model model, long expert_review_num) {
		System.out.println("mscontroller myExpertReviewDetail start...");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller myExpertReviewDetail user_id->" + user_id);

		List<Expert_Review> expert_review = null;
		expert_review = ms.myExpertReviewDetail(user_id, expert_review_num);
		model.addAttribute("Expert_Review", expert_review);
		return "view_ms/myExpertReviewDetail";
	}

	// 판매자 - 나의 판매중인 차량 보기
	@GetMapping("/view_ms/sellList")
	public String mySellCar(HttpSession session, Model model) {
		System.out.println("mscontroller mySellCar start..");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller mySellCar user_id->" + user_id);

		List<Car_General_Info> mySellCar = ms.sellCar(user_id);
		model.addAttribute("Car_General_Info", mySellCar);
		System.out.println("mscontroller mySellCar mySellCar->" + mySellCar);
		return "view_ms/sellList";
	}

	// 판매자 - 나의 판매완료 차량보기
	@GetMapping("view_ms/sellWan")
	public String mySellWan(HttpSession session, Model model) {
		System.out.println("mscontroller mySellWan start..");
		User_Table user_table = (User_Table) session.getAttribute("user");
		String user_id = user_table.getUser_id();
		System.out.println("mscontroller mySellWan user_id.." + user_id);

		List<Car_General_Info> sellWan = ms.sellWan(user_id);
		model.addAttribute("Car_General_Info", sellWan);
		System.out.println("mscontroller mySellWan sellWan->" + sellWan);
		return "view_ms/sellWan";
	}

//	//관심목록-> 전문가 리뷰 작성하는 화면으로 이동하기
//	@GetMapping(value = "/view_ms/myZzimReview")
//	public String myZzimReview(Model model, Zzim zzim) {
//		System.out.println("msController hoogi payment.getSell_num->" + zzim.getSell_num());
//		model.addAttribute("sell_num", zzim.getSell_num());
//		return "view_ms/myZzimReviewWrite";
//	}
//	
//	//나의관심목록-> 전문가 리뷰 작성하기
//	@GetMapping("/myZzimReviewWrite")
//	public String myZzimReviewWrite(HttpSession session, Model model,
//									@RequestParam String sell_num,
//									@RequestParam long zzim_num) {
//		System.out.println("mscontroller myZzimReviewWrite start...");
//		User_Table user_table = (User_Table)session.getAttribute("user");
//		String user_id = user_table.getUser_id();
//		System.out.println("mscontroller myZzimReviewWrtie user_id->"+user_id);
//		System.out.println("mscontroller myZzimReviewWrtie sell_num->"+sell_num);
//		System.out.println("mscontroller myZzimReviewWrtie zzim_num->"+zzim_num);
//		
//		Map<String, Object> params = new HashMap<>();
//		params.put("user_id", user_id);
//		params.put("sell_num", sell_num);
//		params.put("zzim_num", zzim_num);
//		
//		int result = ms.ZzimReviewWrite(params);
//		if(result>0){
//			System.out.println("mscontroller ZzimReviewWrite result->"+result);
//			return "redierct:/view_ms/myZzim_P";
//		}else {
//			System.out.println("mscontroller ZzimReviewWrite error->");
//			return "redirect:/someErrorPage";
//		}
//	}

}
