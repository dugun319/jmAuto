package com.oracle.jmAuto.service.ms;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.ms.MsDao;
import com.oracle.jmAuto.dao.ms.MsDaoImpl;
import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Note;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.Review;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.dto.Zzim;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MsServiceImpl implements MsService {
	private final MsDao md;

	//관심목록
	public List<Zzim> findZzim(String user_id) {
		System.out.println("MsServiceImpl findZzim start...");
		List<Zzim> ZzimList = md.findZzim(user_id);
		return ZzimList;
	}
	//구매한 사람 몇명
	public int PaymentUser() {
		System.out.println("MsServiceImpl SelectUser start...");
		int result=0;
		result=md.PaymentUser();
		return result;
	}
	//구매차량목록
	public List<Payment> buyList(String user_id) {
		System.out.println("MsServiceImpl buyList start.. ");
		List<Payment> buyList = md.buyList(user_id);
		return buyList;
	}
	//로그인
	public User_Table login(String user_id, String user_pw) {
		System.out.println("msServiceImpl.login start...");
		User_Table user_table = md.login(user_id, user_pw);
		System.out.println("smServiceImpl.login user_table->"+ user_table);
		return user_table;
	}

	
	//비밀번호 가져오기 로직
	public String findByPw(String myselfid) {
		System.out.println("msService findByPw start...");
		String dbUser_pw = md.findByPw(myselfid);
		return dbUser_pw;
	}
	
	//회원정보 수정 로직
	@Override
	public void userUpdate(User_Table user_table) {
		System.out.println("msService userUpdate start...");
		md.userUpdate(user_table);		
	}
	//내가 구매한 전문가 리뷰
	@Override
	public List<Expert_Review> expertReviews(String user_id) {
		System.out.println("msService expertReview start...");
		return md.expertReviews(user_id);
	}
	
	//나의 문의내역
	@Override
	public List<Qna> QnaList(String user_id) {
		System.out.println("msService QnaList start...");
		return md.QnaList(user_id);
	}
	
	//문의 내역 삭제
	@Override
	public int deleteQna(String user_id,  List<Long> Qnanum) {
		System.out.println("msService deleteQna start...");
		int result =0;
		result= md.deleteQna(user_id, Qnanum);
		System.out.println("msService deleteQna user_id->"+ user_id);
		System.out.println("msService deleteQna Qnanum->"+ Qnanum);
		return result;
	}
	
	//문의내역 상세조회
	@Override
	public Qna myQnaDetail(long qna_num, HttpSession session) {
		System.out.println("msService myQnaDetail start...");
		User_Table user_table = (User_Table)session.getAttribute("user");
		String user_id= user_table.getUser_id();
		System.out.println("msService myQnaDetail user_id->"+ user_id);
		
		Qna qnanum = md.myQnaDetail(qna_num, user_id);
		System.out.println("msService myQnaDetail qnanum->"+ qnanum);
		return qnanum;
	}
	//구매내역 상세조회
	@Override
	public Payment buyListDetail(String sell_num, String user_id) {
		Payment sellnum = md.buyListDetail(sell_num , user_id);
		System.out.println("msService buyListDetail approvalnum->"+ sellnum);		
		return sellnum;
	}
	
	//리뷰상세페이지
	@Override
	public Expert_Review reviewDetail(String expert_num, String user_id) {
		System.out.println("msService reviewDetail start...");
		Expert_Review expertnum = md.reviewDetail(expert_num, user_id);
		System.out.println("msService reviewDetail expertnum->"+expertnum);
		return expertnum;
	}
	
	//나의 관심목록 삭제
	@Override
	public int deleteZzim(String user_id, List<Long> sell_num) {
		System.out.println("msService deleteZzim start...");
		return md.deleteZzim(user_id, sell_num);
	}
	
	//구매후기작성
	@Override
	public int hoogiwrite(Map<String, Object> params) {
		System.out.println("msService hoogiwrite start...");
		return md.hoogiwrite(params);
	}
	
	
	
	//후기 작성폼에서 sell_num값 받아오려는 로직.....
	@Override
	public long paymentselect(String user_id) {
		System.out.println("msService paymentselet start..");
		System.out.println("msService paymentselet user_id->"+ user_id);
		
		long sellnum = md.paymentselect(user_id);
		System.out.println("msService paymentselet sellnum->"+sellnum);
		return sellnum;
	}
	
	
	//후기 리스트에 뿌려줄 나의 후기들
	@Override
	public List<Review> myhoogi(String user_id) {
		System.out.println("msService myhoogi start...");
		List<Review> reviews = md.myhoogi(user_id);
		System.out.println("msService myhoogi reviews->"+ reviews);
		System.out.println("msService myhoogi user_id->"+ user_id);
		return reviews;
	}
	
	//내가 작성한 후기 삭제
	@Override
	public int hoogiDelete(String user_id, List<String> approval_num) {
		System.out.println("msService hoogiDelete start..");
		return md.hoogiDelete(user_id, approval_num);
	}
	
	//내가 작성한 전문가리뷰
	@Override
	public List<Expert_Review> myExpertReview(String user_id) {
		System.out.println("msService myExpertReview start...");
		return md.myExpertReview(user_id);
	}
	
	//내가 작성한 전문가리뷰 상세
	@Override
	public List<Expert_Review> myExpertReviewDetail(String user_id, long expert_review_num) {
		System.out.println("msService myExpertReviewDetail start...");
		return md.myExpertReviewDetail(user_id, expert_review_num);
	}
	
	//내가 판매중인 차량
	@Override
	public List<Car_General_Info> sellCar(String user_id) {
		System.out.println("msService sellCar start...");
		return md.sellCar(user_id);
	}
	//판매완료목록
	@Override
	public List<Car_General_Info> sellWan(String user_id) {
		System.out.println("msService sellWan start..");
		return md.sellWan(user_id);
	}
	//쪽지보관함
	@Override
	public List<Note> myNote(String user_id) {
		System.out.println("msService myNote start..");
		return md.myNote(user_id);
	}
	
	//쪽지 상세보기
	@Override
	public Note myNoteDetail(String user_id, int note_num) {
		System.out.println("msService myNoteDetail start..");
		return md.myNoteDetail(user_id, note_num);
	}
	
	//쪽지 삭제
	@Override
	public int deleteNote(int note_num) {
		System.out.println("msService deleteNote start..");
		return md.deleteNote(note_num);
	}
	
	//쪽지 답장
	@Override
	public int noteDabjang(Map<String, Object> params) {
		System.out.println("msService noteDabjang start...");
		return md.noteDabjang(params);
	}
	


	

	//비밀번호 체크
//	public boolean checkPassword(User_Table user_Id, String checkPassword) {
//		User_Table findUser = md.findById(user_Id.getUser_id());
//		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		if(findUser==null) {
//			throw new IllegalStateException("없는 회원입니다.");
//		}
//		String realPassword = user_Id.getUser_pw();
//		boolean matches = passwordEncoder.matches(checkPassword, realPassword);
//		System.out.println(matches);
//		return matches;
//	}
//	
//	//현재 Id찾기
//	public User_Table findById(String loginId) {
//		System.out.println("msServiceImple findById start...");
//		return md.findById(loginId);
//	}
//	
//	public void userUpdate(HttpSession session, User_Table user) {
//		User_Table currentUser = md.findBySession(session);
//		
//		if(currentUser != null) {
//			currentUser.setUser_id(user.getUser_id());
//			currentUser.setUser_pw(user.getUser_pw());
//			
//			md.userUpdate(session, currentUser);
//			System.out.println("회원정보 수정완료");
//		}else {
//			System.out.println("사용자를 찾을 수 없습니다.");
//		}
//	}



}
