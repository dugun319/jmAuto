package com.oracle.jmAuto.dao.ms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Note;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.Review;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.dto.Zzim;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MsDaoImpl implements MsDao {
	private final SqlSession session;

	//구매한 사람 몇명
	@Override
	public int PaymentUser() {
		System.out.println("MsDaoImpl totalUser start...");
		int totUserCount = 0;
		try {
			totUserCount = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.PaymentUser");
			System.out.println("MsDaoImpl totalUser totUserCount->" + totUserCount);
		} catch (Exception e) {
			System.out.println("MsDaoImpl totalUser totUserCount error->" + e.getMessage());
		}
		return totUserCount;
	}

	//관심목록
	@Override
	public List<Zzim> findZzim(String user_id) {
		System.out.println("MsDaoImpl findZzim start...");
		List<Zzim> ZzimList = null;
		try {
			ZzimList = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.findZzim", user_id);
		} catch (Exception e) {
			System.out.println("MsDaoImpl findZzim error->" + e.getMessage());
		}
		return ZzimList;
	}



	//로그인
	public User_Table login(String user_id, String user_pw) {
		System.out.println("msDaoImpl login start...");
		User_Table user_table = new User_Table();
		try {
			user_table.setUser_id(user_id);
			user_table.setUser_pw(user_pw);
			user_table = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.loginUser", user_table);
		} catch (Exception e) {
			System.out.println("msDaoImpl login error->" + e.getMessage());
		}
		return user_table;
	}


	// 회원정보 수정 전 체크할 때, 비밀번호 가져오기.
	public String findByPw(String myselfid) {
		System.out.println("msDaoImpl findByPw strat...");
		String dbUser_pw = null;

		try {
			dbUser_pw = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.findByPw", myselfid);
			System.out.println("msDaoImpl findByPw myselfid-> " + myselfid);
		} catch (Exception e) {
			System.out.println("msDaoImpl findByPw error->" + e.getMessage());
		}
		return dbUser_pw;
	}

	// 회원정보 수정 로직
	@Override
	public void userUpdate(User_Table user_table) {
		System.out.println("msDao userUpdate start...");
		int result = 0;
		try {
			result = session.update("com.oracle.jmAuto.dto.Mapper.ms.userUpdate", user_table);
			System.out.println("msDao userUpdate result->" + result);

		} catch (Exception e) {
			System.out.println("msDao userUpdate error->" + e.getMessage());
		}
	}

	//내가 구매한 전문가리뷰리스트
	@Override
	public List<Expert_Review> expertReviews(String user_id) {
		System.out.println("msDao expertReview start...");
		List<Expert_Review> expertReview = null;
		try {
			expertReview = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.expertReview", user_id);
		} catch (Exception e) {
			System.out.println("msDao expertReviews error->"+e.getMessage());
		}
		return expertReview;
	}

	//내 문의내역 리스트
	@Override
	public List<Qna> QnaList(String user_id) {
		System.out.println("msDao QnaList start...");
		List<Qna> QnaList = null;
		try {
			QnaList = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.QnaList",user_id);
		} catch (Exception e) {
			System.out.println("msDao QnaList error->"+ e.getMessage());
		}
		return QnaList;
	}

	
	//내 문의 내역 상세조회
	@Override
	public Qna myQnaDetail(long qna_num, String user_id) {
		System.out.println("msDao myQnaDetail start...");
		Qna qnanum = null;
		try {
			qnanum = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.Qna_Num", new HashMap<String, Object>(){
				{
					put("qna_num",qna_num);
					put("user_id",user_id);
				}});
		} catch (Exception e) {
			System.out.println("msDao myQnaDetail error-> " + e.getMessage());
		}
		return qnanum;
	}
	
	
	//내 문의 내역 삭제
		@Override
		public int deleteQna(String user_id, List<Long> qna_nums) {
			System.out.println("msDao deleteQna start...");
		    int resultTot = 0;
		    try {
		        for (Long qna_num : qna_nums) {//qna_nums리스트에 포함된 각각의 qna_num을 삭제하기 위해 for사용
		            int result = session.update("com.oracle.jmAuto.dto.Mapper.ms.deleteQna", Map.of("user_id", user_id, "qna_num", qna_num));
		            resultTot += result;
		        }
		        System.out.println("총 삭제된 게시물 수: " + resultTot);
		    } catch (Exception e) {
		        System.out.println("msDao deleteQna error -> " + e.getMessage());
		    }
		    return resultTot;
		}
		
		
		//구매리스트
		public List<Payment> buyList(String user_id) {
			System.out.println("MsDaoImpl buyList start... ");
			System.out.println("MsDaoImpl buyList user_id->" +user_id);
			List<Payment> buyList = null;
			try {
				buyList = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.buyList",user_id);
			} catch (Exception e) {
				System.out.println("MsDaoImpl buyList error->" + e.getMessage());
			}
			return buyList;
		}
		

	//나의 구매목록 상세조회
	@Override
	public Payment buyListDetail(String sell_num, String user_id) {
		System.out.println("msDao buyListDetail start...");
		System.out.println("msDao buyListDetail user_id->"+ user_id);
		System.out.println("msDao buyListDetail sell_num->"+ sell_num);
		Payment sellnum = null;
		try {
			sellnum = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.buyListDetail", new HashMap<String, Object>(){{
					put("sell_num", sell_num);
					put("user_id",user_id);
				}});
			if(sellnum==null) {
				System.out.println("No payment found for sell_num:"+ sell_num+", user_id="+user_id);
			}
		} catch (Exception e) {
			System.out.println("msDao buyListDetail error-> " + e.getMessage());
		}
		return sellnum;
	}

	//전문가 리뷰 상세조회
	@Override
	public Expert_Review reviewDetail(String expert_review_num, String user_id) {
		System.out.println("msDao reviewDetail start..");
		System.out.println("msDao reviewDetail user_id->"+ user_id);
		System.out.println("msDao reviewDetail expert_review_num->"+ expert_review_num);
		Expert_Review expertnum = null;
		try {
			expertnum = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.reviewDetail", new HashMap<String, Object>(){
				{
					put("expert_review_num", expert_review_num);
					put("user_id",user_id);
				}});
		} catch (Exception e) {
			System.out.println("msDao reviewDetail error ->"+ e.getMessage());
		}
		return expertnum;
	}

	//나의 관심목록 삭제
	@Override
	public int deleteZzim(String user_id, List<Long> sell_num) {
		System.out.println("msDao deleteZzim start..");
		System.out.println("msDao deleteZzim user_id->"+ user_id);
		System.out.println("msDao deleteZzim sell_num->"+ sell_num);
		int resultTot = 0;
		try {
			for(Long sell_nums : sell_num) {
				int result = session.delete("com.oracle.jmAuto.dto.Mapper.ms.deleteZzim", Map.of("user_id", user_id, "sell_nums",sell_nums));
				resultTot += result;
			}		
		} catch (Exception e) {
			System.out.println("msDao deleteZzim error->"+ e.getMessage());
		}
		return resultTot;
	}
	
	//구매 후기 작성
	@Override
	public int hoogiwrite(Map<String, Object> params) {
		System.out.println("msDao hoogiwrite start..");
		System.out.println("maDao hoogiwrite params->"+ params);
		return session.insert("com.oracle.jmAuto.dto.Mapper.ms.hoogiwrite", params);
	}

	//sell_num가져오려는 로직
	@Override
	public long paymentselect(String user_id) {
		System.out.println("msDao paymentselect start..");
		System.out.println("msDao paymentselect user_id->"+user_id);
		long payment = 0;
		try {
			payment= session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.paymentselect", user_id);
		} catch (Exception e) {
			System.out.println("msDao paymentselect error->"+e.getMessage());
			
		}
		return payment;
	}

	//구매후기작성한 목록 노출하려고 값 가지러 간다~~
	@Override
	public List<Review> myhoogi(String user_id) {
		System.out.println("msDao myhoogi start...");
		List<Review> reviews = null;
		try {
			reviews = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.myhoogi",user_id);
		} catch (Exception e) {
			System.out.println("msDao myhoogi error->"+e.getMessage());
		}
		System.out.println("msDao myhoogi reviews->"+reviews);
		return reviews;
	}

	//내가 작성한 후기 삭제
	@Override
	public int hoogiDelete(String user_id, List<String> approval_num) {
		System.out.println("msDao hoogiDelete start..");
		System.out.println("msDao hoogiDelete approval_num->"+approval_num);
		System.out.println("msDao hoogiDelete user_id->"+user_id);
		int resultTot=0;
		try {
			for(String approval_nums : approval_num) {
				int result = session.update("com.oracle.jmAuto.dto.Mapper.ms.hoogiDelete", Map.of("user_id", user_id, "approval_nums", approval_nums));
				resultTot += result;
				System.out.println("msDao hoogiDelete resultTot->"+resultTot);
			}
		} catch (Exception e) {
			System.out.println("msDao hoogiDelete error->"+e.getMessage());
			e.printStackTrace();
		}
		return resultTot;
	}

	//내가 작성한 전문가 리뷰 보기
	@Override
	public List<Expert_Review> myExpertReview(String user_id) {
		System.out.println("msDao myExpertReview start..");
		List<Expert_Review> expert_review = null;
		try {
			expert_review = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.myExpertReview", user_id);
			System.out.println("msDao myExpertReview expert_review->"+ expert_review);
		} catch (Exception e) {
			System.out.println("msDao myExpertReview error->"+ e.getMessage());
			e.getStackTrace();
		}
		return expert_review;
	}

	//내가 작성한 전문가 리뷰 상세보기
	@Override
	public List<Expert_Review> myExpertReviewDetail(String user_id, long expert_review_num ) {
		System.out.println("msDao myExpertReviewDetail start..");
		System.out.println("msDao myExpertReviewDetail user_id->"+user_id);
		System.out.println("msDao myExpertReviewDetail expert_review_num->"+expert_review_num);
		
		List<Expert_Review> expert_review = null;
		try {
			expert_review = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.myExpertReviewDetail",  new HashMap<String, Object>(){
				{
					put("expert_review_num",expert_review_num);
					put("user_id",user_id);
				}});
			System.out.println("msDao myExpertReviewDetail expert_review->"+ expert_review);
		} catch (Exception e) {
			System.out.println("msDao myExpertReviewDetail error->"+ e.getMessage());
			e.getStackTrace();
		}
		return expert_review;
	}

	//내가 판매중인 차량
	@Override
	public List<Car_General_Info> sellCar(String user_id) {
		System.out.println("msDao cellCar start...");
		System.out.println("msDao cellCar user_id->"+user_id);
		List<Car_General_Info> sellCar = null;
		try {
			sellCar = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.sellCar",user_id);
		} catch (Exception e) {
			System.out.println("msDao cellCar error->"+e.getMessage());
			e.getStackTrace();
		}
		return sellCar;
	}

	//판매완료된 차량
	@Override
	public List<Car_General_Info> sellWan(String user_id) {
		System.out.println("msDao sellWan start..");
		List<Car_General_Info> sellWan = null;
		try {
			sellWan = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.mySellWan", user_id);
		} catch (Exception e) {
			System.out.println("msDao sellWan error->"+e.getMessage());
		}
		return sellWan;
	}


	//쪽지
	@Override
	public List<Note> myNote(String user_id) {
		System.out.println("msDao myNote start..");
		List<Note> myNoteList = null;
		try {
			myNoteList = session.selectList("com.oracle.jmAuto.dto.Mapper.ms.zzokzi",user_id);
			System.out.println("msDao myNoteList user_id->"+ user_id);
		} catch (Exception e) {
			System.out.println("msDao myNoteList error->"+e.getMessage());
		}
		return myNoteList;
	}

	//쪽지 상세조회
	@Override
	public Note myNoteDetail(String user_id, int note_num) {
		System.out.println("msDao myNoteDetail start..");
		Note noteDetail=null;
		try {
			noteDetail = session.selectOne("com.oracle.jmAuto.dto.Mapper.ms.zzokziList", Map.of("user_id",user_id, "note_num", note_num));
			System.out.println("msDao myNoteDetail user_id->"+user_id);
			System.out.println("msDao myNoteDetail note_num->"+note_num);
		} catch (Exception e) {
			System.out.println("msDao myNoteDetail error->"+ e.getMessage());
		}
		return noteDetail;
	}

	//쪽지 삭제
	@Override
	public int deleteNote(int note_num) {
		System.out.println("msDao deleteNote start..");
		int result =0;
		try {
			int deleteNote = session.update("com.oracle.jmAuto.dto.Mapper.ms.deleteNote");
			result += deleteNote;
		} catch (Exception e) {
			System.out.println("msDao deleteNote error.."+e.getMessage());
		}
		return result;
	}

	//쪽지 답장
	@Override
	public int noteDabjang(Map<String, Object> params) {
		System.out.println("msDao noteDabjang start..");
		System.out.println("msDao noteDabjang params->"+params);
		return session.insert("com.oracle.jmAuto.dto.Mapper.ms.noteDabjang", params);	
	}




}

