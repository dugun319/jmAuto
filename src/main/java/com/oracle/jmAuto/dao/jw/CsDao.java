package com.oracle.jmAuto.dao.jw;

import java.util.List;
import java.util.Map;

import com.oracle.jmAuto.dto.Faq;
import com.oracle.jmAuto.dto.Notice_Table;
import com.oracle.jmAuto.dto.Qna;

public interface CsDao {
	
	List<Faq> 			listFaq();

	List<Qna> 			popQna();
	
	int 				insertQna(Qna qna);

	List<Notice_Table> 	listNotice();

	Notice_Table 		detailNotice(int notice_num);

}