package com.oracle.jmAuto.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.oracle.jmAuto.dto.KaKaoPayCancelResponse;
import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.KakaoPayApproveResponse;
import com.oracle.jmAuto.dto.KakaoPayReadyResponse;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.SessionUtils;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.kh.KHPayService;
import com.oracle.jmAuto.service.kh.KHTableService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/KH/pay")
public class KhController {

	private final KHPayService 		payService;
	private final KHTableService 	khTableService;
	
	@Value("${spring.file.upload.path}")
	private String uploadPath;

	@GetMapping(value = "/kCar")
	public String kCarDetail(Car_General_Info car, Model model) {
		// 매물번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		// 매물번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		// 매물번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		
		log.info("KhController kCarDetail is called");
		
		SessionUtils.addAttribute("buyer_id", car.getUser_id());
		// 구매자 아이디 받아옴
		
		Car_General_Info carDetail	= khTableService.carDetail(car.getSell_num());		// get mothd로 받아온 sell_num
		User_Table buyer 			= khTableService.userDetail(car.getUser_id());		// get mothd로 받아온 user_num (buyer)
		User_Table seller 			= khTableService.userDetail(carDetail.getUser_id());
		long rawPrice 				= carDetail.getPrice() * 10000;

		System.out.println("KhController kCarDetail carDetail -> " + carDetail);

		SessionUtils.addAttribute("rawPrice", rawPrice);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("buyer", buyer);
		model.addAttribute("seller", seller);

		return "view_kh/carPayment";
	}
	
	
	@PostMapping(value = "/readyCar")
	public @ResponseBody RedirectView kakaoPayReadyCar(@RequestParam("insureFile") MultipartFile multipartFile, Payment payment) {
		log.info("sell_num: " + payment.getSell_num());
		
		String uuid 			= UUID.randomUUID().toString();
		String originalFileName = multipartFile.getOriginalFilename();
		String extension		= originalFileName.substring(originalFileName.lastIndexOf("."));
		String savePath 		= uploadPath + uuid + extension; 
		
		if(!multipartFile.isEmpty()) {			
			try {
				multipartFile.transferTo(new File(savePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		payment.setInsure_img_name(uuid+extension);
		payment.setInsure_img_url(savePath);

		KakaoPayReadyResponse readyResponse = payService.kakaoPayReadyCar(payment.getSell_num());
		// kakaoPay 요청양식에 따라 요청객체 만들어 보내는 메서드(service)

		log.info(readyResponse.toString());

		// kakaoPay가 준비요청 후 보내준 정보 확인

		SessionUtils.addAttribute("tid", readyResponse.getTid());
		SessionUtils.addAttribute("readyPayment", payment);
		System.out.println("KhController RedirectView kakaoPayReadyCar payment -> " + payment);
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(readyResponse.getNext_redirect_pc_url());

		return redirectView;

	}
	
	
	@GetMapping(value = "/kExpert")
	public String expertDetail(Expert_Review expertReview, Model model) {
		// 전문가리뷰번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		// 전문가리뷰번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		// 전문가리뷰번호와 구매자 아이디는 반드시 받아와야 함!!! Get Method
		
		log.info("KhController expertDetail is called");	
		
		SessionUtils.addAttribute("buyer_id", expertReview.getUser_id());
		// 구매자 아이디 받아옴

		System.out.println("KhController expertDetail expertReview.expertReview.getExpert_review_num() -> " + expertReview.getExpert_review_num());
		Expert_Review expertReviewDetail 	= khTableService.expertReviewDetail(expertReview.getExpert_review_num());
		Car_General_Info carDetail 			= khTableService.carDetail(expertReviewDetail.getSell_num());
		User_Table buyer 					= khTableService.userDetail(expertReview.getUser_id());
		User_Table seller 					= khTableService.userDetail(expertReviewDetail.getUser_id());

		model.addAttribute("expertReviewDetail", expertReviewDetail);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("buyer", buyer);
		model.addAttribute("seller", seller);

		return "view_kh/expertPayment";
	}
		

	@PostMapping(value = "/readyExpert")
	public @ResponseBody RedirectView kakaoPayReadyExpert(Payment payment) {
		log.info("expert_review_num: " + payment.getExpert_review_num());

		KakaoPayReadyResponse readyResponse = payService.kakaoPayReadyExpert(payment.getExpert_review_num());
		// kakaoPay 요청양식에 따라 요청객체 만들어 보내는 메서드(service)

		log.info(readyResponse.toString());
		// kakaoPay가 준비요청 후 보내준 정보 확인

		SessionUtils.addAttribute("tid", readyResponse.getTid());
		SessionUtils.addAttribute("readyPayment", payment);

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(readyResponse.getNext_redirect_pc_url());

		return redirectView;
	}

	@GetMapping("/completed")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken, Model model) {
		// pgToken : 결제 요청을 하기위한 인증 토큰이며, 결제인증 API 호출 시에 넣어줘야 하는 값
		// 자동으로 생성되어 전달받음

		String tid 								= SessionUtils.getStringAttributeValue("tid");
		String partner_order_id 				= SessionUtils.getStringAttributeValue("partner_order_id");
		String partner_user_id 					= SessionUtils.getStringAttributeValue("partner_user_id");
		Payment readyPayment					= (Payment) SessionUtils.getAttribute("readyPayment");
		KakaoPayApproveResponse approveResponse = payService.kakaoPayApprove(tid, pgToken, partner_order_id, partner_user_id);
		// kakaoPay 요청양식에 따라 요청객체 만들어 보내는 메서드(service)

		System.out.println("KhController kakaoPayApprove approveResponse -> " + approveResponse);

		long price;	
		long tax;	
		long fee;	
		long total_price;
		long buz_fee; 	
		long buz_money;
		
		User_Table buyer 	= khTableService.userDetail(SessionUtils.getStringAttributeValue("buyer_id"));
		Payment payment 	= new Payment();
		
		if(readyPayment.getBuy_type() == 2) {
			price 		= 5000;
			tax 		= 500;
			fee			= 0;
			total_price = price + tax;
			buz_fee		= 500;
			buz_money	= price - buz_fee;
			payment.setExpert_review_num(readyPayment.getExpert_review_num());
			
		} else {
			price 		= Long.parseLong(SessionUtils.getStringAttributeValue("rawPrice"));
			tax 		= (long) (price * 0.17);
			fee			= 50000;
			total_price = price + tax;
			buz_fee		= (long) (price * 0.3);
			buz_money	= price - buz_fee;
			payment.setSell_num(readyPayment.getSell_num());
		}

		payment.setUser_id(buyer.getUser_id());
		payment.setApproval_num(approveResponse.getTid());
		payment.setApproval_date(approveResponse.getApproved_at());
		payment.setPrice(price);
		payment.setTax(tax);
		payment.setFee(fee);
		payment.setTotal_price(total_price);
		payment.setBuz_fee(buz_fee);
		payment.setBuz_money(buz_money);
		payment.setReceiver_name(buyer.getUser_name());
		payment.setReceiver_tel(buyer.getUser_tel());
		payment.setReceiver_zipcode(buyer.getUser_zipcode());
		payment.setReceiver_addr1(buyer.getUser_addr1());
		payment.setReceiver_addr2(buyer.getUser_addr2());
		payment.setInsure_img_name(readyPayment.getInsure_img_name());
		payment.setInsure_img_url(readyPayment.getInsure_img_url());
		payment.setDelivery_date(readyPayment.getDelivery_date());
		payment.setBuy_type(readyPayment.getBuy_type());
		
		khTableService.insertPayment(payment);

		model.addAttribute("approveResponse", approveResponse);
		model.addAttribute("buyer", buyer);
		model.addAttribute("payment", payment);

		return "view_kh/complete"; // 결제 승인 후 redirect 페이지
	}

	@GetMapping(value = "/paymentDetail")
	public String paymentlDetailCall(Payment payment, Model model) {
		log.info("KhController paymentlListCall is called");

		System.out.println("KhController paymentlListCall payment.getSell_num() -> " + payment.getSell_num());
		Payment paymentDetail = khTableService.paymentDetailCall(payment.getSell_num());

		model.addAttribute("paymentDetail", paymentDetail);
		System.out.println("KhController paymentDetailCall paymentDetail -> " + paymentDetail);

		return "view_kh/refund";
	}

	@GetMapping(value = "/cancel")
	public String cancel() {
		log.info("KhController refundPayment is called");

		return "cancel";
	}

	@GetMapping(value = "/refundPayment")
	public String refundPayment(Payment payment, Model model) {
		log.info("KhController refundPayment is called");

		String tid = 							payment.getApproval_num();
		KaKaoPayCancelResponse refundDetail = 	payService.refundPayment(tid);
		
		System.out.println("KhController refundPayment tid -> " + tid);
		

		model.addAttribute("refundDetail", refundDetail);
		System.out.println("KhController refundPayment refundDetail -> " + refundDetail);

		return "view_kh/refundPayment";
	}

}
