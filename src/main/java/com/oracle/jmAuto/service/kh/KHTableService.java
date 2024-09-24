package com.oracle.jmAuto.service.kh;

import java.util.List;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.User_Table;

public interface KHTableService {

	Car_General_Info 	carDetail(long sell_num);
	Payment 			paymentDetailCall(long sell_num);
	List<Payment> 		paymentListCall(String user_id);
	User_Table 			userDetail(String stringAttributeValue);
	Expert_Review 		expertReviewDetail(long expert_review_num);
	void 				insertPayment(Payment payment);	
}
