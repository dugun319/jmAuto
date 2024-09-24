package com.oracle.jmAuto.dao.kh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.User_Table;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class KHTableDaoImplementation implements KHTableDao {
	private final SqlSession session;

	@Override
	public Car_General_Info carDetail(long sell_num) {

		Car_General_Info carDetail = null;

		System.out.println("KHTableDaoImplementation carDetail(long sell_num) is called");

		try {
			carDetail = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.selectCarBySellId", sell_num);
			String brand = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.getBrand", carDetail.getBrand());
			carDetail.setBrand(brand);
			System.out.println("KHTableDaoImplementation carDetail() carDetail -> " + carDetail);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation carDetail() e.getMessage() -> " + e.getMessage());
		}

		return carDetail;
	}

	@Override
	public Payment paymentDetailCall(long sell_num) {
		Payment paymentDetail = null;

		System.out.println("KHTableDaoImplementation paymentDetailCall() is called");

		try {
			paymentDetail = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.selectPaymentBySellId", sell_num);
			System.out.println("KHTableDaoImplementation paymentDetailCall() paymentDetail -> " + paymentDetail);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation paymentDetailCall() e.getMessage() -> " + e.getMessage());
		}

		return paymentDetail;
	}

	@Override
	public List<Payment> paymentListCall(String user_id) {
		List<Payment> paymetList = null;

		System.out.println("KHTableDaoImplementation paymentListCall() is called");

		try {
			paymetList = session.selectList("com.oracle.jmAuto.dto.KHTableMapper.selectPaymentByUserId", user_id);
			System.out.println("KHTableDaoImplementation paymentListCall() paymentDetail -> " + paymetList);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation paymentListCall() e.getMessage() -> " + e.getMessage());
		}

		return paymetList;
	}

	@Override
	public Payment targetPaymentByTid(String tid) {
		Payment paymentDetail = null;

		System.out.println("KHTableDaoImplementation targetPaymentByTid() is called");

		try {
			paymentDetail = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.targetPaymentByTid", tid);
			System.out.println("KHTableDaoImplementation targetPaymentByTid() paymentDetail -> " + paymentDetail);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation targetPaymentByTid() e.getMessage() -> " + e.getMessage());
		}
		
		return paymentDetail;
	}

	@Override
	public User_Table userDetail(String user_id) {
		System.out.println("KHTableDaoImplementation userDetail() is called");
		User_Table buyer = null;

		try {
			buyer = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.userDetail", user_id);
			System.out.println("KHTableDaoImplementation userDetail() buyer -> " + buyer);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation userDetail() e.getMessage() -> " + e.getMessage());
		}		
		
		return buyer;
	}

	@Override
	public Expert_Review expertReviewDetail(long expert_review_num) {
		System.out.println("KHTableDaoImplementation expertReviewDetail() is called");
		Expert_Review expertReviewDetail = null;

		try {
			expertReviewDetail = session.selectOne("com.oracle.jmAuto.dto.KHTableMapper.expertReviewDetail", expert_review_num);
			System.out.println("KHTableDaoImplementation expertReviewDetail() buyer -> " + expertReviewDetail);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation expertReviewDetail() e.getMessage() -> " + e.getMessage());
		}		
		
		return expertReviewDetail;
	}

	@Override
	public void insertPayment(Payment payment) {
		System.out.println("KHTableDaoImplementation insertPayment() is called");		
		
		try {
			session.insert("com.oracle.jmAuto.dto.KHTableMapper.InsertPayment", payment);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation insertPayment() e.getMessage() -> " + e.getMessage());
		}
				
	}

}
