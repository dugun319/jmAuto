package com.oracle.jmAuto.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.jmAuto.dto.Account;
import com.oracle.jmAuto.dto.Business;
import com.oracle.jmAuto.dto.Certified;
import com.oracle.jmAuto.dto.SessionUtils;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.jm.EmailService;
import com.oracle.jmAuto.service.jm.JmService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/view_jm")
public class JmController {

	private final JmService js;
	private final EmailService es;

	// 로그인 화면 출력
	@GetMapping(value = "/login")
	public String loginForm() {
		System.out.println("JmController.loginForm start...");
		return "view_jm/login";
	}

	// 로그인 처리 로직 
	@PostMapping(value = "/login")
	public String login(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, Model model,
			HttpSession session, HttpServletRequest request) {
				System.out.println("JmController.login()" + user_id);
		System.out.println("JmController.login start...");
		User_Table user_table = new User_Table();
		user_table = js.login(user_id, user_pw);
		System.out.println("JmController.login user_table--->" + user_table);

		// 로그인 실패: 비밀번호가 틀리거나 사용자 정보가 없음
		if (user_table == null) {
			model.addAttribute("loginError", "비밀번호 또는 아이디가 틀렸습니다.");
			model.addAttribute("user_id", user_id); // 입력한 아이디를 다시 전달
			return "view_jm/login"; // 로그인 페이지로 리다이렉트
		}
		
		// 탈퇴한 사용자 체크
		if (user_table.getDel_state() == 1) {
			model.addAttribute("loginError", "탈퇴한 회원입니다.");
			return "view_jm/login";
		}
	
		// 승인 요청 중 체크
		if (user_table.getApproval().equals("0")) { // 예시로 승인 요청 중 체크
			model.addAttribute("loginError", "승인 요청 중입니다.");
			return "view_jm/login";
		}
		 // 탈퇴 상태 확인
		 System.out.println("탈퇴 상태: " + user_table.getDel_state());
		String user_id1 = user_table.getUser_id();
		// 로그인 성공시
		System.out.println("JmController.login 성공!!!!!");

		// 기존 세션을 무효화하고 새로운 세션 ID 발급
		session.invalidate(); // 기존 세션을 무효화
		//request.changeSessionId(); // 새로운 세션 ID 발급
		session = request.getSession(true); // 새로운 세션 생성

		// 사용자 정보를 세션에 저장
		session.setAttribute("user", user_table); // 새로운 세션에 사용자 정보 저장
		session.setMaxInactiveInterval(30 * 60); // 30분 동안 활동이 없으면 세션 만료 설정
		System.out.println("JmController.login() session >>>" + session.getAttribute("user"));
		// 사용자 ID저장
		SessionUtils.addAttribute("user_id",  user_id);
		System.out.println("JmController.login 성공!!!!! user_id -> " + SessionUtils.getStringAttributeValue("user_id"));
		return "redirect:/";
	}

	// 로그아웃 (세션 해제)
	@GetMapping(value = "/logout")
	public String logout(HttpSession session, Model model) {
		System.out.println("JmController.logout start.....");
		// 세션 해제 
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 유형 화면 출력
	@GetMapping(value = "/joinType")
	public String joinTypeForm() {
		System.out.println("JmController.joinTypeForm start.....");

		return "view_jm/joinType";
	}

	// --------------------------------Buyer Join--------------------------------------
	// buyer join Agree form
	@GetMapping(value = "/buyerJoinAgree")
	public String buyerJoinAgreeForm() {

		System.out.println("JmController.buyerJoinAgreeForm start...");
		return "view_jm/buyerJoinAgree";
	}

	// buyer join info form
	@GetMapping(value = "/buyerJoinInfo")
	public String buyerJoinInfoForm() {
		System.out.println("Jmcontroller.buyerJoinInfoForm start...");
		return "view_jm/buyerJoinInfo";
	}

	// buyer 회원가입
	@PostMapping(value = "/join")
	public String join(@ModelAttribute User_Table user, Model model) {
		System.out.println("JmController.join start...");
		System.out.println("JmController.join USER-->" + user);
		System.out.println("JmController.join USER-->" + user.getUser_type());

		// 유저 유형 저장
		user.setUser_type("B");
		// 등급 저장
		user.setUser_level("1");
		// 탈퇴 여부 저장
		user.setDel_state(0);
		// 승인 여부 저장
		user.setApproval("1");

		int joinResult = js.join(user);
		System.out.println("JmController.join joinResult--->>" + joinResult);
		if (joinResult > 0) {
			return "view_jm/joinOk";
		} else {
			model.addAttribute("msg", "회원가입에 실패하셨습니다");
			return "main";
		}
	}

	// ---------------------------------------------------------------------------------

	// --------------------------------seller Join--------------------------------------- 
	// seller join Form 화면 출력

	@GetMapping(value = "/sellerJoinAgree")
	public String sellerJoinAgreeForm() {

		System.out.println("JmController.sellerJoinAgreeForm start...");

		return "view_jm/sellerJoinAgree";
	}

	// seller join info form_1 화면 출력
	@GetMapping(value = "/sellerJoinInfo_1")
	public String sellerJoinInfoForm() {

		System.out.println("Jmcontroller.sellerJoinInfoForm start...");

		return "view_jm/sellerJoinInfo_1";
	}

	// seller Join info - business Info_1 세션 저장 로직 구현
	@PostMapping(value = "/sellerJoinInfo_2")
	public String InsertBuz(@ModelAttribute Business business2, @RequestParam("fileUpload") MultipartFile file,
			HttpSession session) {
		System.out.println("JmController.buzInfoInsert start...");
		System.out.println("JmController.InsertBuz business2 -->" + business2);

		Business business = new Business();
		business.setBuz_num(business2.getBuz_num());
		business.setBuz_name(business2.getBuz_name());
		business.setBuz_addr(business2.getBuz_addr());

		// 사업자 번호를 파일 이름으로 사용
		String businessNumber = business2.getBuz_num();

		// 원래 파일의 확장자 추출
		String originalFilename = file.getOriginalFilename();
		String fileExtension = "";

		if (originalFilename != null && originalFilename.contains(".")) {
			fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
		}

		// 사업자 번호와 확장자를 결합하여 새 파일 이름 생성
		String fileName = businessNumber + fileExtension;

		// 파일 저장 경로 설정
		// String uploadDir = "C:/businessImage";
		// File savedFile = new File(uploadDir + File.separator + fileName);

		try {
			// 파일 저장
			// file.transferTo(savedFile);
			// 파일 이름 저장
			// business.setBuz_filename(fileName);

			// 파일 url 생성 (웹에서 접근 가능한 경로로 설정)
			String fileUrl = "/businessImage/" + fileName;
			business.setBuz_url(fileUrl); // business객체에 파일 url 설정

			// 방법 2
			// 파일 데이터를 byte[]로 변환하여 세션에 저장
			byte[] fileData = file.getBytes();
			// 파일 데이터를 세션에 저장
			session.setAttribute("fileData", fileData);
			// 파일 이름 세션에 저장
			session.setAttribute("fileName", fileName);
			// 비즈니스 테이블 정보 세션에 저장
			session.setAttribute("businessInfo", business);
		} catch (Exception e) {
			System.out.println("JmController.InsertBuz e.getMessage" + e.getMessage());
			return "view_jm/sellerJoinInfo_1";
		}

		return "view_jm/sellerJoinInfo_2";
	}

	// 판매자 회원가입
	@PostMapping(value = "/sellerJoinRequest")
	public String sellerJoin(User_Table user_table, HttpSession session, Account account)
			throws FileNotFoundException, IOException {
		System.out.println("JmController.sellerJoin start...");

		// 세션에서 사업자 정보와 파일 데이터를 가져옴
		Business business = (Business) session.getAttribute("businessInfo");
		byte[] fileData = (byte[]) session.getAttribute("fileData");
		String fileName = (String) session.getAttribute("fileName");

		// 판매 회원에 대한 테이블 값 처리
		// 사업자 번호 저장
		user_table.setBuz_num(business.getBuz_num());
		// 유저 유형 저장
		user_table.setUser_type("S");
		// 등급 저장
		user_table.setUser_level("1");
		// 탈퇴 여부 저장
		user_table.setDel_state(0);
		// 승인 여부 저장
		user_table.setApproval("0");
		// 계좌 정보 user_id 저장
		account.setUser_id(user_table.getUser_id());

		// 실제 파일 저장 처리
		if (fileData != null && fileName != null) {
			// 실제 파일 저장 경로
			String filePath = "C:/businessImage";
			// String uniqueFileName = business.getBuz_num() + "_" + fileName; // 고유 파일명 설정
			File dest = new File(filePath + File.separator + fileName);

			try (FileOutputStream fos = new FileOutputStream(dest)) {
				// 파일을 실제로 저장
				fos.write(fileData);
				// 파일 이름 저장
				business.setBuz_filename(fileName);
				// 파일 경로 저장
				// business.setBuz_url(filePath);

				// 세션에서 파일 관련 데이터 삭제
				session.removeAttribute("fileData");
				session.removeAttribute("fileName");
				session.removeAttribute("businessInfo");

				// join 처리 start..
				int sellerJoinResult = js.sellerJoin(business, user_table, account);

				if (sellerJoinResult > 0) {
					System.out.println("Business info saved successfully");
					return "view_jm/sellerJoinRequest";
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "view_jm/sellerJoinInfo_1";
	}

	// ----------------------------------------------------------------------------------

	// -----------------------------------prof join--------------------------------------
	// prof join Form
	@GetMapping(value = "/profJoinAgree")
	public String profJoinAgreeForm() {

		System.out.println("JmController.profJoinAgreeForm start...");
		return "view_jm/profJoinAgree";
	}

	// prof join info form
	@GetMapping(value = "/profJoinInfo_1")
	public String profJoinInfoForm() {

		System.out.println("Jmcontroller.profJoinInfoForm start...");

		return "view_jm/profJoinInfo_1";
	}

	// prof Join info - certified Info_1 세션 저장 로직 구현
	@PostMapping(value = "/profJoinInfo_2")
	public String InsertCert(@ModelAttribute Certified certified5, @RequestParam("fileUpload") MultipartFile file,
			HttpSession session) {
		System.out.println("JmController.buzInfoInsert start...");
		System.out.println("JmController.InsertBuz business2 -->" + certified5);

		Certified cert = new Certified();

		cert.setCert_num(certified5.getCert_num());
		cert.setCert_name(certified5.getCert_name());
		cert.setCert_date(certified5.getCert_date());
		cert.setCert_loc(certified5.getCert_loc());

		// 자격증 번호를 파일 이름으로 사용
		String certNumber = cert.getCert_num();

		// 원래 파일의 확장자 추출
		// 파일 이름이 document.pdf file.getOriginalFilename() --->"document.pdf"
		String originalFilename = file.getOriginalFilename();
		// originalFilename이 "document.pdf"
		// lastIndexOf(".")는 8을 반환합니다 (즉, .의 위치).
		// substring(8)은 ".pdf"를 반환합니다.
		String fileExtension = "";

		if (originalFilename != null && originalFilename.contains(".")) {
			fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
		}

		// 사업자 번호와 확장자를 결합하여 새 파일 이름 생성
		String fileName = certNumber + fileExtension;

		try {

			// 파일 url 생성 (웹에서 접근 가능한 경로로 설정)
			String fileUrl = "/certImage/" + fileName;
			cert.setCert_url(fileUrl); // 자격증 파일 url 설정

			// 방법 2
			// 파일 데이터를 byte[]로 변환하여 세션에 저장
			byte[] fileData = file.getBytes();
			// 파일 데이터를 세션에 저장
			session.setAttribute("fileData", fileData);
			// 파일 이름 세션에 저장
			session.setAttribute("fileName", fileName);
			// 비즈니스 테이블 정보 세션에 저장
			session.setAttribute("certifiedInfo", cert);
			System.out.println("Certified Info in Session: " + session.getAttribute("certifiedInfo"));
		} catch (Exception e) {
			System.out.println("JmController.InsertBuz e.getMessage" + e.getMessage());
			return "view_jm/profJoinInfo_1";
		}

		return "view_jm/profJoinInfo_2";
	}

	// 전문가 회원가입
	@PostMapping(value = "/profJoinRequest")
	public String profJoin(@ModelAttribute User_Table user_table, HttpSession session, Account account)
			throws FileNotFoundException, IOException {
		System.out.println("JmController.profJoin start...");
		System.out.println("Certified Info in Session: " + session.getAttribute("certifiedInfo"));
		// 세션에서 사업자 정보와 파일 데이터를 가져옴
		Certified certified = (Certified) session.getAttribute("certifiedInfo");
		byte[] fileData = (byte[]) session.getAttribute("fileData");
		String fileName = (String) session.getAttribute("fileName");

		// 판매 회원에 대한 테이블 값 처리
		// 자격증 번호 저장
		user_table.setCert_num(certified.getCert_num());
		// 유저 유형 저장
		user_table.setUser_type("P");
		// 등급 저장
		user_table.setUser_level("1");
		// 탈퇴 여부 저장
		user_table.setDel_state(0);
		// 승인 여부 저장
		user_table.setApproval("0");
		// 계좌 정보 user_id 저장
		account.setUser_id(user_table.getUser_id());

		// 실제 파일 저장 처리
		if (fileData != null && fileName != null) {
			// 실제 파일 저장 경로
			String filePath = "C:/certImage";
			// String uniqueFileName = business.getBuz_num() + "_" + fileName; // 고유 파일명 설정
			File dest = new File(filePath + File.separator + fileName);

			try (FileOutputStream fos = new FileOutputStream(dest)) {
				// 파일을 실제로 저장
				fos.write(fileData);
				// 파일 이름 저장
				certified.setCert_filename(fileName);
				// 파일 경로 저장
				// business.setBuz_url(filePath);

				// 세션에서 파일 관련 데이터 삭제
				session.removeAttribute("fileData");
				session.removeAttribute("fileName");
				session.removeAttribute("businessInfo");

				// join 처리 start..
				int profJoinResult = js.profJoin(certified, user_table, account);

				if (profJoinResult > 0) {
					System.out.println("Business info saved successfully");
					return "view_jm/profJoinRequest";
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "view_jm/profJoinInfo_1";
	}

	// ----------------------------------------------------------------------------------
	// 아이디 중복 확인
	@GetMapping(value = "/confirmId")
	@ResponseBody // JSON 응답을 위해 추가
	public int confirmId(@RequestParam("user_id") String user_id) {
		System.out.println("JmController.confirmId start...");
		int result = js.confirmId(user_id);
		return result;
	}

	@PostMapping("/sendAuthCode")
    @ResponseBody
    public Map<String, String> sendAuthCode(HttpServletRequest request, @RequestParam("user_email") String user_email) {
        Map<String, String> response = new HashMap<>();
		System.out.println("JmController.sendAuthCode() start....");
		System.out.println("JmController.sendAuthCode() user_email >>> " + user_email);
		try {
            String authCode = es.sendAuthCode(user_email);
            HttpSession session = request.getSession();
			System.out.println("JmController.sendAuthCode() 트라이 start....");
			session.setAttribute("authCode", authCode);
			session.setMaxInactiveInterval(300);
            response.put("message", "이메일로 인증번호가 전송되었습니다.");

        } catch (Exception e) {
            response.put("message", "이메일 전송에 실패했습니다.");
        }
        return response;
    }

	// 인증번호 확인 로직
	@PostMapping("/verifyAuthCode")
	public ResponseEntity<?> verifyAuthCode(HttpSession session, @RequestParam("auth_code") String inputCode) {
		// 세션에 저장된 인증번호 가져오기
		String sessionAuthCode = (String) session.getAttribute("authCode");

		// 입력한 인증번호와 세션의 인증번호를 비교
		if (sessionAuthCode != null && sessionAuthCode.equals(inputCode)) {
			return ResponseEntity.ok(Map.of("valid", true));
		} else {
			return ResponseEntity.ok(Map.of("valid", false));
		}
	}

	// 아이디 찾기 화면 출력
	@GetMapping(value = "/findId")
	public String findIdForm() {

		System.out.println("JmController.findIdForm  start..");

		return "view_jm/findId";
	}

	// 아이디 찾기
	@PostMapping(value = "/findId")
	public String findId(@RequestParam("user_email") String user_email,@RequestParam("user_name") String user_name, Model model) {
		System.out.println("JmController.findId start....");

		System.out.println("JmController.findId user_email >>>>" + user_email);
		System.out.println("JmController.findId user_name >>>>" + user_name);
		
		User_Table user = new User_Table();

		user.setUser_email(user_email);
		user.setUser_name(user_name);

		String user_id = js.findId(user);

		System.out.println("JmController.findId user_id >>> " + user_id);

		model.addAttribute("user_id", user_id);

		return "view_jm/findIdResult";
	}

	// 비밀번호 찾기 화면 출력
	@GetMapping(value = "/findPw")
	public String findPwForm() {

		System.out.println("JmController.findIdForm  start..");

		return "view_jm/findPw";
	}

	// 비밀번호 찾기 - 회원 확인
	@PostMapping(value = "/findPw")
	public String findPw(@ModelAttribute User_Table user, Model model) {
		System.out.println("JmController.findPw start....");

		// 파라메터가 왔는지 확인
		System.out.println("JmController.findPw user_id >>> " + user.getUser_id());
		System.out.println("JmController.findPw user_email >>> " + user.getUser_email());

		// 사용자 확인 
		User_Table user_table = js.findPw(user);

		if (user_table != null) {
			String user_id = user_table.getUser_id();
			model.addAttribute("user_id", user_id);
			model.addAttribute("userCheckMessage", "회원확인이 완료되셨습니다");
		} else {
			model.addAttribute("userCheckMessage", "아이디와 이메일이 일치하지 않습니다 다시 시도해주세요");
		}

		return "view_jm/findPwResult";

	}

	@PostMapping(value = "/tempPassword")
	public String tempPassword(@RequestParam String user_id, Model model) {
		// 임시 비밀번호 생성 후 업데이트
		String tempPassword = js.createTempPassword(user_id);
		System.out.println("JmController.tempPassword tempPassword : " + tempPassword);

		
		// 이메일로 비밀번호 발송
		int result = es.sendTempPw(user_id, tempPassword);
		System.out.println("JmController.tempPassword result >>> " + result);

		if(result > 0) {
			
			return "view_jm/login";
			
		}else {
			return "view_jm/findPw";
		}
	}
	
}