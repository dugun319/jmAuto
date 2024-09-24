package com.oracle.jmAuto.service.kh;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.kh.KHTableDao;
import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.User_Table;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class KHTableServiceImplementation implements KHTableService {

	private final KHTableDao khTableDao;
	
	@Override
	public Car_General_Info carDetail(long sell_num) {
		System.out.println("KHTableServiceImplementation carDetail(long sell_num) is called");
		System.out.println("KHTableServiceImplementation carDetail sell_num -> " + sell_num);
		Car_General_Info carDetail = khTableDao.carDetail(sell_num);

		return carDetail;
	}

	@Override
	public Payment paymentDetailCall(long sell_num) {
		System.out.println("KHTableServiceImplementation paymentDetailCall() is called");
		System.out.println("KHTableServiceImplementation paymentDetailCall getSell_num -> " + sell_num);
		Payment paymentDetail = khTableDao.paymentDetailCall(sell_num);
		return paymentDetail;
	}

	@Override
	public List<Payment> paymentListCall(String user_id) {
		System.out.println("KHTableServiceImplementation paymentListCall() is called");
		System.out.println("KHTableServiceImplementation paymentListCall User_id -> " + user_id);
		List<Payment> paymentList = khTableDao.paymentListCall(user_id);
		return paymentList;
	}

	@Override
	public User_Table userDetail(String user_id) {
		System.out.println("KHTableServiceImplementation userDetail() is called");
		System.out.println("KHTableServiceImplementation userDetail User_id -> " + user_id);
		
		User_Table buyer = khTableDao.userDetail(user_id);
		System.out.println("KHTableServiceImplementation userDetail buyer -> " + buyer);		
		
		return buyer;
	}

	@Override
	public Expert_Review expertReviewDetail(long expert_review_num) {
		System.out.println("KHTableServiceImplementation expertDetail() is called");
		System.out.println("KHTableServiceImplementation expertDetail expert_review_num -> " + expert_review_num);
		
		Expert_Review expertReviewDetail  = khTableDao.expertReviewDetail(expert_review_num);
		System.out.println("KHTableServiceImplementation expertDetail expertReviewDetail -> " + expertReviewDetail);		
		
		return expertReviewDetail;
	}

	@Override
	public void insertPayment(Payment payment) {
		System.out.println("KHTableServiceImplementation insertPayment() is called");
		System.out.println("KHTableServiceImplementation insertPayment() payment -> " + payment);
		
		khTableDao.insertPayment(payment);		
	}
}
