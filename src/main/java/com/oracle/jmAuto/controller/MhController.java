package com.oracle.jmAuto.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.jmAuto.dao.mh.Car_General_InfoDao;
import com.oracle.jmAuto.dao.mh.Expert_ReviewDao;
import com.oracle.jmAuto.dao.mh.Notice_TableDao;
import com.oracle.jmAuto.dao.mh.ReviewPaymentCarInfoDao;
import com.oracle.jmAuto.dao.mh.User_TableDao;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.mh.MhService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MhController {
	private final MhService ms;
	
	@GetMapping(value = "/")
	public String listReviewcount(Model model){
		System.out.println("MhController listReviewcount start...");
		
		//전문가 리뷰 갯수
		int expert = ms.ReviewListCount();
		System.out.println("MhController listReview count =>>  " + expert);
		// 전문가 리뷰 리스트
		List<Expert_ReviewDao> exp_list = ms.expList();
		List<Expert_ReviewDao> list_Exp = exp_list.subList(0, Math.min(3, exp_list.size()));
		
		//그냥 리뷰
		List<Expert_ReviewDao> liview = ms.ListReview();
		System.out.println("MhController listReview liview.size() => "+ liview.size());
		
		//차량기본정보
		List<Car_General_InfoDao> carInfo = ms.CarList();
		System.out.println("MhController listReview carInfo.size() => " + carInfo.size());
		
		Collections.shuffle(carInfo);  // 리스트를 무작위로 섞음
	    List<Car_General_InfoDao> randomCarInfo = carInfo.subList(0, Math.min(3, carInfo.size()));
	    List<Car_General_InfoDao> randomCarInfo2 = carInfo.subList(0, Math.min(6, carInfo.size()));
		System.out.println("MhController listReview randomCarInfo.size() => " + randomCarInfo.size());

		// 리뷰 리스트 & 결제정보 & 차량정보
		List<ReviewPaymentCarInfoDao> review = ms.reviewInfoList();
		List<ReviewPaymentCarInfoDao> review3 = review.subList(0, Math.min(3, review.size()));
		System.out.println("MhController listReview review.size() => " + review.size());
		
		// 공지사항 및 약관
		List<Notice_TableDao> notList = ms.noticeList();
		List<Notice_TableDao> listNot = notList.subList(0, Math.min(5, notList.size()));
		
		model.addAttribute("listNot", listNot);
		model.addAttribute("review", review3);
		model.addAttribute("randomCarInfo", randomCarInfo);
		model.addAttribute("randomCarInfo2", randomCarInfo2);
		model.addAttribute("liview", liview);
		model.addAttribute("expert", list_Exp);
		return "main";
	}

	@RequestMapping(value = "/main_search")
	public String carSearch(@RequestParam("keyword") String keyword, @RequestParam("searchType") Integer searchType ,Model model) {
		List<Car_General_InfoDao> searchCarInfo = ms.SearchCarList(keyword, searchType);
		System.out.println("MhController carSearch start...");
		System.out.println("MhController carSearch searchCarInfo => " + searchCarInfo);
		System.out.println("MhController carSearch searchType => " + searchType);
		model.addAttribute("searchCarInfo", searchCarInfo);
		
		return "view_mh/CarSearchList";
		
	}
	
	@GetMapping(value = "/carInfo")
	public String carInfo(@RequestParam("sellNum") String sellNum,@RequestParam("id") String id, Model model, HttpSession session) {
		System.out.println("MhController carInfo start...");
		
		User_Table user = (User_Table)session.getAttribute("user");
		
		System.out.println("user --->>>>>" + user);
		System.out.println("session =>> " + session.getAttribute("user"));

		List<Car_General_InfoDao> carInfoList = ms.CarInfoList(sellNum);
		System.out.println("MhController carInfo  ");
		
		List<User_TableDao> userTableInfo = ms.userInfo(id);
		System.err.println("MhController carInfo userTableInfo => " + userTableInfo);
		
		List<Expert_ReviewDao> exp_list = ms.expList();
		List<Expert_ReviewDao> list_Exp = exp_list.subList(0, Math.min(3, exp_list.size()));
		model.addAttribute("expertReviewList", list_Exp);
		
		
		model.addAttribute("userInfo", userTableInfo);
		model.addAttribute("carInfoList",carInfoList);
		
		return "view_mh/carInfo";
	}

}
