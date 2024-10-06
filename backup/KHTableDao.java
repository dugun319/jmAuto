package com.oracle.jmAuto.dao.kh;

import java.util.List;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.User_Table;

public interface KHTableDao {

	Car_General_Info 		getCarBySellId(long sell_num);
	Payment 				getPaymentBySellId(long sell_num);
	List<Payment> 			getPaymentList(String user_id);
	Payment 				getPaymentByTid(String tid);
	User_Table 				getUserById(String user_id);
	Expert_Review 			getExpertReviewDetail(long expert_review_num);
	void 					insertPayment(Payment payment);
	List<Car_General_Info> 	getCarList();
	List<Expert_Review> 	getExpertReviewList(long sell_num);
	int 					getPurchaseExpert(String user_id, long expert_review_num);
	String 					getRefundPassword(String tid);
	void 					updateRefundPayment(String tid);
	void 					updateCarDelState(Long sell_num);
	String 					getUserIdByApprovalNum(String approval_num);		
}
