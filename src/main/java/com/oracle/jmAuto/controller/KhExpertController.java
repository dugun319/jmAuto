package com.oracle.jmAuto.controller;

//import java.io.ByteArrayInputStream;
//import org.apache.commons.io.IOUtils;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.SessionUtils;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.kh.KHTableService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/KH/expert")
public class KhExpertController {

	private final KHTableService khTableService;
	// private final BCryptPasswordEncoder passwordEncoder; 


	// 전문가리뷰페이지 호출
	// 구매여부를 판단하여 구매했으면 페이지를 노출
	// 비구매 시, 전문가리뷰 결제버튼 노출
	@GetMapping(value = "/expertReviewPage")
	public String goExpertReviewPage(long expert_review_num, Model model) {
		log.info("KhController goExpertReviewPage is called");

		String user_id 					 = SessionUtils.getStringAttributeValue("user_id");
		
		if(user_id.length() < 5) {
			model.addAttribute("loginError", "먼저 로그인 해주세요");
			System.out.println("KhController goCarPay user_id -> " + SessionUtils.getStringAttributeValue("user_id").isEmpty());
			return "view_kh/loginClose";			// 로그인 페이지로 리다이렉트
		}
		
		int result 						 = khTableService.getPurchaseExpert(user_id, expert_review_num);
		Expert_Review expertReviewDetail = khTableService.getExpertReviewDetail(expert_review_num);
		Car_General_Info carDetail		 = khTableService.getCarBySellId(expertReviewDetail.getSell_num());
		User_Table expert 				 = khTableService.getUserById(expertReviewDetail.getUser_id());
		
		model.addAttribute("result", result);
		model.addAttribute("experReviewDetail", expertReviewDetail);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("expert", expert);
		
		System.out.println("KhController goExpertReviewPage result -> " + result);

		return "view_kh/expertReview";
	}
	
	
	//전문가 리뷰 작성 및 수정
	@GetMapping(value = "/createExpertReview")
	public String createExpertReview(@RequestParam("sell_num")long sell_num, Model model) {
		log.info("KhController createExpertReview is called");

		String user_id 					 = SessionUtils.getStringAttributeValue("user_id");
		Car_General_Info carDetail		 = khTableService.getCarBySellId(sell_num);
		User_Table expert 				 = khTableService.getUserById(user_id);
		
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("expert", expert);
		
		return "view_kh/createExpertReview";
	}
	
	
	//전문가리뷰 입력
	@PostMapping(value = "/insertExpertReview")
	public String insertExpertReview(Expert_Review expertReview) {
		log.info("KhController insertExpertReview is called");
		System.out.println("KhController insertExpertReview expertReview -> " + expertReview);
		
		khTableService.insertExpertReview(expertReview);
		
		return "redirect:/view_ms/myPage_P";
	}
	
	@PostMapping(value = "/previewExpertReview")
	public String previewExpertReview(Expert_Review expertReview, Model model) {
		
		Car_General_Info carDetail		= khTableService.getCarBySellId(expertReview.getSell_num());
		User_Table expert 				= khTableService.getUserById(expertReview.getUser_id());
		
		model.addAttribute("experReviewDetail", expertReview);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("expert", expert);
		
		return "view_kh/previewExpertReview";
	}
	
	
	//전문가리뷰 수정
	@GetMapping(value = "/modifyExpertReview")
	public String modifyExpertReview(Expert_Review expertReview, Model model) {
		log.info("KhController modifyExpertReview is called");
		Expert_Review newExpertReview	= khTableService.getExpertReviewDetail(expertReview.getExpert_review_num());
		
		

		Car_General_Info carDetail		= khTableService.getCarBySellId(newExpertReview.getSell_num());
		User_Table expert 				= khTableService.getUserById(newExpertReview.getUser_id());
		
		model.addAttribute("experReviewDetail", newExpertReview);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("expert", expert);
		
		return "view_kh/modifyExpertReview";
	}

		
	//전문가리뷰 수정입력
	@PostMapping(value = "/updateExpertReview")
	public String updateExpertReview(Expert_Review expertReview) {
		log.info("KhController insertExpertReview is called");
		System.out.println("KhController insertExpertReview expertReview -> " + expertReview);
		
		khTableService.updateExpertReview(expertReview);
		
		return "redirect:/view_ms/myExpertReview";	
	}	
	
	
	@GetMapping(value = "/updateReviewDelState")
	public String updateReviewDelState(Expert_Review expertReview) {
		
		System.out.println("KhController updateReviewDelState del_state -> " + expertReview.getDel_state());
		System.out.println("KhController updateReviewDelState expert_review_num -> " + expertReview.getExpert_review_num());
		
		if(expertReview.getDel_state() == 0) {
			expertReview.setDel_state(1);
		}else {
			expertReview.setDel_state(0);
		}
		
		khTableService.updateReviewDelState(expertReview);
		
		return "redirect:/KH/pay/changeReviewDelState";
	}
	
	
	@GetMapping(value = "/reviewList") 
	public String reviewList(Model model) {
		String user_id 			= "buyer" + Math.round(((Math.random() * 18)) + 1);
		long expert_review_num	= 50000000000L + (long)(Math.random() * 10 + 1);	

		Expert_Review expertReviewDetail = khTableService.getExpertReviewDetail(expert_review_num);
		Car_General_Info carDetail = khTableService.getCarBySellId(expertReviewDetail.getSell_num());
		User_Table buyer = khTableService.getUserById(user_id);
		User_Table seller = khTableService.getUserById(expertReviewDetail.getUser_id());
		
		SessionUtils.addAttribute("buyer", buyer);
		SessionUtils.addAttribute("buyer_id", user_id);

		model.addAttribute("expertReviewDetail", expertReviewDetail);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("buyer", buyer);
		model.addAttribute("seller", seller);
		
		return "view_kh/expertPayment";
	}
	
	
}
