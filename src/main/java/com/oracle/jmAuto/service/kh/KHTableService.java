package com.oracle.jmAuto.service.kh;

import java.util.List;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.ExpertReviewList;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.PayList;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.User_Table;

public interface KHTableService {

	Car_General_Info 		getCarBySellId(long sell_num);
	Payment 				getPaymentBySellId(long sell_num);
	List<Payment> 			getPaymentList(String user_id);
	User_Table 				getUserById(String stringAttributeValue);
	Expert_Review 			getExpertReviewDetail(long expert_review_num);
	void 					insertPayment(Payment payment);
	List<Car_General_Info> 	getCarList();
	List<Expert_Review> 	getExpertReviewList(long sell_num);
	int					 	getPurchaseExpert(String user_id, long expert_review_num);
	void 					updateCarDelState(long sell_num);
	String 					getUserIdByApprovalNum(String approval_num);
	void 					insertExpertReview(Expert_Review expertReview);
	void 					updateExpertReview(Expert_Review expertReview);
	int 					getTotPaymentByUserId(String user_id);
	List<PayList> 			getPayList(PayList payList);
	List<PayList> 			getPayListCon(PayList payList);
	int 					getTotPaymentByCon(PayList payList);
	int 					getTotExpertReview(ExpertReviewList expertReviewList);
	List<ExpertReviewList> 	getReviewListCon(List<ExpertReviewList> expertReviewList);	
	
}
