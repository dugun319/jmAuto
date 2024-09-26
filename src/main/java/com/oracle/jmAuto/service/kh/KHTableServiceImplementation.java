package com.oracle.jmAuto.service.kh;

import java.util.ArrayList;
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
	public Car_General_Info getCarBySellId(long sell_num) {
		System.out.println("KHTableServiceImplementation getCarBySellId(long sell_num) is called");
		System.out.println("KHTableServiceImplementation getCarBySellId sell_num -> " + sell_num);
		Car_General_Info carDetail = khTableDao.getCarBySellId(sell_num);

		return carDetail;
	}

	@Override
	public Payment getPaymentBySellId(long sell_num) {
		System.out.println("KHTableServiceImplementation paymentDetailCall() is called");
		System.out.println("KHTableServiceImplementation paymentDetailCall getSell_num -> " + sell_num);
		Payment paymentDetail = khTableDao.getPaymentBySellId(sell_num);
		return paymentDetail;
	}

	@Override
	public List<Payment> getPaymentList(String user_id) {
		System.out.println("KHTableServiceImplementation paymentListCall() is called");
		System.out.println("KHTableServiceImplementation paymentListCall User_id -> " + user_id);
		List<Payment> paymentList = khTableDao.getPaymentList(user_id);
		return paymentList;
	}

	@Override
	public User_Table getUserById(String user_id) {
		System.out.println("KHTableServiceImplementation userDetail() is called");
		System.out.println("KHTableServiceImplementation userDetail User_id -> " + user_id);
		
		User_Table buyer = khTableDao.getUserById(user_id);
		System.out.println("KHTableServiceImplementation userDetail buyer -> " + buyer);		
		
		return buyer;
	}

	@Override
	public Expert_Review getExpertReviewDetail(long expert_review_num) {
		System.out.println("KHTableServiceImplementation expertDetail() is called");
		System.out.println("KHTableServiceImplementation expertDetail expert_review_num -> " + expert_review_num);
		
		Expert_Review expertReviewDetail  = khTableDao.getExpertReviewDetail(expert_review_num);
		
		return expertReviewDetail;
	}

	@Override
	public void insertPayment(Payment payment) {
		System.out.println("KHTableServiceImplementation insertPayment() is called");
		System.out.println("KHTableServiceImplementation insertPayment() payment -> " + payment);
		
		khTableDao.insertPayment(payment);		
	}

	@Override
	public List<Car_General_Info> getCarList() {
		List<Car_General_Info> carList 	= new ArrayList<>();
		carList 						= khTableDao.getCarList(); 		
		return carList;
	}

	@Override
	public List<Expert_Review> getExpertReviewList(long sell_num) {
		List<Expert_Review> expertReviewList 	= new ArrayList<>();
		expertReviewList 						= khTableDao.getExpertReviewList(sell_num); 		
		return expertReviewList;
	}

	@Override
	public int getPurchaseExpert(String user_id, long expert_review_num) {
		
		int result	= khTableDao.getPurchaseExpert(user_id, expert_review_num);
		
		return result;
	}
}
