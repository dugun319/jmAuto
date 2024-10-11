package com.oracle.jmAuto.service.jw;

import java.util.List;


import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jw.CsDao;

import com.oracle.jmAuto.dto.Faq;
import com.oracle.jmAuto.dto.Notice_Table;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.ReviewListInfo;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CsServiceImpl implements CsService {
	private final CsDao cd;

	// 2. 자주묻는질문: 카테고리별 내용 가져오기
	@Override
	public List<Faq> listFaq() {
		List<Faq> faqList = null;
		System.out.println("CsServiceImpl listFaq Start...");
		
		faqList = cd.listFaq();
		System.out.println("CsServiceImpl listFaq faqList.size()->"+faqList.size());

		return faqList;
	}

	// 3-2. 로그인 한 회원에게 팝업창 뜸
	@Override
	public List<Qna> popOpen() {
		List<Qna> OpenPop = null;
		System.out.println("CsServiceImpl popOpen start...");
		
		OpenPop = cd.popQna();
		System.out.println("CsServiceImpl popOpen OpenPop.size()->"+OpenPop.size());	
		
		return OpenPop;
	}

	// 3-3. QnA 팝업창 내용작성
	@Override
	public int insertQna(Qna qna) {
		int resultQna = 0;
		System.out.println("CsServiceImpl insertQna Start...");

		resultQna = cd.insertQna(qna);
		System.out.println("CsServiceImpl insertQna resultQna->"+resultQna);
		
		return resultQna;
	}
	
	// 3-4. QnA 파일명, url
	@Override
	public int updateFile(Qna qna2) {
		System.out.println("CsServiceImpl updateFile Start...");
		System.out.println("CsServiceImpl updateFile qna2->"+qna2);
		
		int fileUpdate = cd.fileUpdate(qna2);
		return fileUpdate;
	}
	

	// 4-1. 공지사항 및 약관: 카테고리별 내용 가져오기
	@Override
	public List<Notice_Table> listNotice() {
		List<Notice_Table> noticeList = null;
		System.out.println("CsServiceImpl listNotice Start...");
		
		noticeList = cd.listNotice();
		System.out.println("CsServiceImpl listNotice noticeList.size->"+noticeList.size());
		
		return noticeList;
	}

	// 4-2. 공지사항 및 약관: 제목 누르면 나오는 상세페이지
	@Override
	public Notice_Table detailNotice(int notice_num) {
		System.out.println("CsServiceImpl detailNotice Start...");

		Notice_Table notice_table = null;
		notice_table = cd.detailNotice(notice_num);
		System.out.println("CsServiceImpl detailNotice notice_table->"+notice_table);
		
		return notice_table;
	}

	// 5-1. 고객후기: 페이지 작업 1
	@Override
	public int totalReviewPage() {
		System.out.println("CsServiceImpl totalReviewPage Start...");
		
		int totReviewCnt = cd.totalReview();
		System.out.println("CsServiceImpl totalReview totReviewCnt->"+totReviewCnt);
		
		return totReviewCnt;
	}

	// 5-2. 고객후기: 차량 정보, 리뷰, 결제정보 뽑아오기
	@Override
	public List<ReviewListInfo> listReview(ReviewListInfo ri) {
		List<ReviewListInfo> reviewList = null;
		System.out.println("CsServiceImpl listReview Start...");
		
		reviewList = cd.listReview(ri);
		System.out.println("CsServiceImpl listReview reviewList.size()->"+reviewList.size());
		
		return reviewList;
	}

	// 5-3. 고객후기: 해당 리뷰에 대한 모든 이미지 가져오기
	@Override
	public ReviewListInfo reviewImages(String approval_num) {
		ReviewListInfo reviewimg = null;
		System.out.println("CsServiceImpl reviewImages Start...");

		reviewimg = cd.reviewImages(approval_num);
		System.out.println("CsServiceImpl reviewImages reviewim->"+reviewimg);
		
		return reviewimg;
	}
	
}
