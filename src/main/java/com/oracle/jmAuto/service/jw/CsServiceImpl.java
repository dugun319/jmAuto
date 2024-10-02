package com.oracle.jmAuto.service.jw;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jw.CsDao;
import com.oracle.jmAuto.dto.Faq;
import com.oracle.jmAuto.dto.Notice_Table;
import com.oracle.jmAuto.dto.Qna;

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
	public List<Qna> listQna() {
		List<Qna> QnaList = null;
		System.out.println("CsServiceImpl listQna start...");
		
		QnaList = cd.popQna();
		System.out.println("CsServiceImpl listQna QnaList.size()->"+QnaList.size());	
		
		return QnaList;
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

}
