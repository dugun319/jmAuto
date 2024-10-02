package com.oracle.jmAuto.dao.jw;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.Faq;
import com.oracle.jmAuto.dto.Notice_Table;
import com.oracle.jmAuto.dto.Qna;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CsDaoImpl implements CsDao {
	private final SqlSession session;

	// 2. 자주묻는질문: 카테고리별 내용 가져오기
	@Override
	public List<Faq> listFaq() {
		List<Faq> faqList = null;
		System.out.println("CsDaoImpl listFaq Start...");

		try {			
			faqList = session.selectList("FaqListCls");
			System.out.println("CsDaoImpl listFaq faqList.size()->"+faqList.size());
			
		} catch (Exception e) {
			System.out.println("CsDaoImpl Exception e.getmessage()->"+e.getMessage());
		}
		
		return faqList;
	}

	// 3-2. 로그인 한 회원에게 팝업창 뜸
	@Override
	public List<Qna> popQna() {
		List<Qna> qnaList = null;
		System.out.println("CsDaoImpl popQna Start...");

		try {
			qnaList = session.selectList("qnaPop");
			System.out.println("CsDaoImpl popQna qnaList.size()->"+qnaList.size());
			
		} catch (Exception e) {
			System.out.println("CsDaoImpl popQna Exception->"+e.getMessage());
		}
		
		return qnaList;
	}

	// 3-3. QnA 팝업창 내용작성
	@Override
	public int insertQna(Qna qna) {
		int result = 0;
		System.out.println("CsDaoImpl insertQna Start...");
		
		try {
			result = session.insert("insertQna", qna);
			System.out.println("CsDaoImpl insertQna result->"+result);
			
		} catch (Exception e) {
			System.out.println("CsDaoImpl insertQna Exception->"+e.getMessage());
		}
		
		return result;
	}

	// 4-1. 공지사항 및 약관: 카테고리별 내용 가져오기
	@Override
	public List<Notice_Table> listNotice() {
		List<Notice_Table> noticeList = null;
		System.out.println("CsDaoImpl listNotice Start...");
		
		try {
			noticeList = session.selectList("NoticeListCls");
			System.out.println("CsDaoImpl listNotice noticeList.size()->"+noticeList.size());
			
		} catch (Exception e) {
			System.out.println("CsDaoImpl listNotice Exception->"+e.getMessage());
		}
		
		return noticeList;
	}

	// 4-2. 공지사항 및 약관: 제목 누르면 나오는 상세페이지
	@Override
	public Notice_Table detailNotice(int notice_num) {
		System.out.println("CsDaoImpl detailNotice start...");
		
		Notice_Table notice_table = new Notice_Table();
		
		try {
			notice_table = session.selectOne("NoticeSelOne", notice_num);
			System.out.println("CsDaoImpl detailNotice get->"+notice_table.getNotice_title());
			
		} catch (Exception e) {
			System.out.println("CsDaoImpl detailNotice Exception->"+e.getMessage());
		}

		return notice_table;
	}

}
