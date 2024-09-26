package com.oracle.jmAuto.dao.kh;

import java.util.ArrayList;
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
	public Car_General_Info getCarBySellId(long sell_num) {

		Car_General_Info carDetail = null;

		System.out.println("KHTableDaoImplementation getCarBySellId(long sell_num) is called");

		try {
			carDetail = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.selectCarBySellId", sell_num);
			String brand = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.getBrand", carDetail.getBrand());
			carDetail.setBrand(brand);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getCarBySellId() e.getMessage() -> " + e.getMessage());
		}

		return carDetail;
	}

	@Override
	public Payment getPaymentBySellId(long sell_num) {
		Payment paymentDetail = null;

		System.out.println("KHTableDaoImplementation getPaymentBySellId() is called");

		try {
			paymentDetail = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.selectPaymentBySellId", sell_num);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getPaymentBySellId() e.getMessage() -> " + e.getMessage());
		}

		return paymentDetail;
	}

	@Override
	public List<Payment> getPaymentList(String user_id) {
		List<Payment> paymetList = null;

		System.out.println("KHTableDaoImplementation getPaymentList() is called");

		try {
			paymetList = session.selectList("com.oracle.jmAuto.dto.kh_TableMapper.selectPaymentByUserId", user_id);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getPaymentList() e.getMessage() -> " + e.getMessage());
		}

		return paymetList;
	}

	@Override
	public Payment getPaymentByTid(String tid) {
		Payment paymentDetail = null;

		System.out.println("KHTableDaoImplementation getPaymentByTid() is called");

		try {
			paymentDetail = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.selectPaymentByTid", tid);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getPaymentByTid() e.getMessage() -> " + e.getMessage());
		}
		
		return paymentDetail;
	}

	@Override
	public User_Table getUserById(String user_id) {
		System.out.println("KHTableDaoImplementation getUserById() is called");
		User_Table buyer = null;

		try {
			buyer = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.selectUserById", user_id);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getUserById() e.getMessage() -> " + e.getMessage());
		}		
		
		return buyer;
	}

	@Override
	public Expert_Review getExpertReviewDetail(long expert_review_num) {
		System.out.println("KHTableDaoImplementation getExpertReviewDetail() is called");
		Expert_Review expertReviewDetail = null;

		try {
			expertReviewDetail = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.expertReviewDetail", expert_review_num);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getExpertReviewDetail() e.getMessage() -> " + e.getMessage());
		}		
		
		return expertReviewDetail;
	}

	@Override
	public void insertPayment(Payment payment) {
		System.out.println("KHTableDaoImplementation insertPayment() is called");
		
		try {
			session.insert("com.oracle.jmAuto.dto.kh_TableMapper.InsertPayment", payment);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation insertPayment() e.getMessage() -> " + e.getMessage());
		}
				
	}

	@Override
	public List<Car_General_Info> getCarList() {
		List<Car_General_Info> carList 	= null;
		
		try {
			carList = session.selectList("com.oracle.jmAuto.dto.kh_TableMapper.getCarList");
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getCarList() e.getMessage() -> " + e.getMessage());
		}
		return carList;
	}

	@Override
	public List<Expert_Review> getExpertReviewList(long sell_num) {
		List<Expert_Review> expertReviewList 	= null;
		
		try {
			expertReviewList = session.selectList("com.oracle.jmAuto.dto.kh_TableMapper.getExpertReviewList", sell_num);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getExpertReviewList() e.getMessage() -> " + e.getMessage());
		}
		return expertReviewList;
	}

	@Override
	public int getPurchaseExpert(String user_id, long expert_review_num) {
		List<Long> userPurchase 	= null;
		int result 					= 0;
		
		try {
			userPurchase = session.selectList("com.oracle.jmAuto.dto.kh_TableMapper.getPurchaseExpertList", user_id);
			if(userPurchase != null) {
				if(userPurchase.contains(expert_review_num)) {
					result = 1;
				}
			}
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getPurchaseExpert() e.getMessage() -> " + e.getMessage());
		}
				
		return result;
	}

	@Override
	public String getRefundPassword(String approval_num) {
		String refundPassword = "";
		
		try {
			refundPassword = session.selectOne("com.oracle.jmAuto.dto.kh_TableMapper.getRefundPassword", approval_num);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation getRefundPassword() e.getMessage() -> " + e.getMessage());
		}		
		
		return refundPassword;
	}

	@Override
	public void updateRefundPayment(String approval_num) {
		
		try {
			session.update("com.oracle.jmAuto.dto.kh_TableMapper.updateRefundPayment", approval_num);
		} catch (Exception e) {
			System.out.println("KHTableDaoImplementation updateRefundPayment() e.getMessage() -> " + e.getMessage());
		}
		
	}

}
