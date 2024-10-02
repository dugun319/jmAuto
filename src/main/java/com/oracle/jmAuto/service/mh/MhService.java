package com.oracle.jmAuto.service.mh;

import java.util.List;

import com.oracle.jmAuto.dao.mh.Car_General_InfoDao;
import com.oracle.jmAuto.dao.mh.Expert_ReviewDao;
import com.oracle.jmAuto.dao.mh.Notice_TableDao;
import com.oracle.jmAuto.dao.mh.ReviewDao;
import com.oracle.jmAuto.dao.mh.ReviewPaymentCarInfoDao;
import com.oracle.jmAuto.dao.mh.User_TableDao;


public interface MhService {

	int ReviewListCount();

	List<Expert_ReviewDao> ListReview();

	List<Car_General_InfoDao> CarList();

	List<ReviewDao> reviewList();

	List<Expert_ReviewDao> expList();

	List<ReviewPaymentCarInfoDao> reviewInfoList();

	List<Notice_TableDao> noticeList();

	List<Car_General_InfoDao> SearchCarList(String keyword, int searchType);

	List<Car_General_InfoDao> CarInfoList(String sellNum);

	List<User_TableDao> userInfo(String id);

	
}
