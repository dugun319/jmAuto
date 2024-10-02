package com.oracle.jmAuto.service.mh;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dao.mh.Car_General_InfoDao;
import com.oracle.jmAuto.dao.mh.Expert_ReviewDao;
import com.oracle.jmAuto.dao.mh.Notice_TableDao;
import com.oracle.jmAuto.dao.mh.ReviewDao;
import com.oracle.jmAuto.dao.mh.ReviewPaymentCarInfoDao;
import com.oracle.jmAuto.dao.mh.User_TableDao;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MhServiceImpl implements MhService {
	private final Expert_ReviewDao 	   exr;
	private final Car_General_InfoDao 	   cgi;
	private final ReviewDao 			   rv;
	private final ReviewPaymentCarInfoDao rpc;
	private final Notice_TableDao		   nt;
	private final User_TableDao		   ut;
	
	
	@Override
	public int ReviewListCount() {
		System.out.println("MhServiceImpl ReviewListCount start...");
		int expert = exr.listReviewCount();
		return expert;
	}

	@Override
	public List<Expert_ReviewDao> ListReview() {
		System.out.println("MhServiceImpl ListReview start...");
		List<Expert_ReviewDao> revuewList = exr.listReview();
		
		return revuewList;
	}

	@Override
	public List<Car_General_InfoDao> CarList() {
		System.out.println("MhServiceImpl CarList start...");
		List<Car_General_InfoDao> carInfo = cgi.CarList();
		
		return carInfo;
	}

	@Override
	public List<ReviewDao> reviewList() {
		System.out.println("MhServiceImpl reviewList start...");
		List<ReviewDao> review = rv.ReviewList();
		
		return review;
	}

	@Override
	public List<Expert_ReviewDao> expList() {
		System.out.println("MhServiceImpl expList start...");
		List<Expert_ReviewDao> exp_list = exr.expList();
		return exp_list;
	}

	@Override
	public List<ReviewPaymentCarInfoDao> reviewInfoList() {
		System.out.println("MhServiceImpl reviewInfoList start...");
		return rpc.listReviewInfo();
	}

	@Override
	public List<Notice_TableDao> noticeList() {
		System.out.println("MhServiceImpl noticeList start...");
		return nt.listnotice();
	}

	@Override
	public List<Car_General_InfoDao> SearchCarList(String keyword, int searchType) {
		System.out.println("MhServiceImpl SearchCarList start...");
		
		return cgi.carSearchList(keyword, searchType);
	}

	@Override
	public List<Car_General_InfoDao> CarInfoList(String sellNum) {
		System.out.println("MhServiceImpl CarInfoList start...");
		
		return cgi.carInfoList(sellNum);
	}

	@Override
	public List<User_TableDao> userInfo(String id) {
		System.out.println("MhServiceImpl userInfo start...");
		return ut.tableUser(id);
	}

	
	
}
