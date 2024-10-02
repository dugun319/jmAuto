package com.oracle.jmAuto.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.jh.StatsService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class JhController {

	private final StatsService ss;
	
	//로그인 화면
	@GetMapping(value = "/view_jh/home")
	public String main() {
		System.out.println("로그인 화면 열림");		
		return "view_jh/home";
	}	
	//통계 팝업으로 열기
	@GetMapping(value = "/view_jh/statsMainForm")
	public String statsMainForm() {
		System.out.println("통계 팝업페이지 열림");
		return "view_jh/statsMainForm"; 
	}	
	
	//분기별 실적 조회
	@PostMapping(value = "/view_jh/quarterly_results")
	public String quarterly_results(HttpSession session, @RequestParam("year") int year, Model model) {
		System.out.println("분기별 실적 조회");
		
		// 유저 ID 가져오기
		String user_id = (String) session.getAttribute("user_id");
        System.out.println("session에서 가져온 user_id: " + user_id);
		
		Map<String, Object> quarterly_results = ss.service_quarterly_results(year, user_id);
		System.out.println("JhController quarterly_results->" + quarterly_results);
		System.out.println("JhController year->" + year);
		
		boolean dataFetched = true; // 데이터가 있다면 fetch
		model.addAttribute("quarterlyDataFetched", dataFetched);
		model.addAttribute("quarterly_results", quarterly_results);
		model.addAttribute("year" , year);
		
		return "view_jh/statsMainForm";
	}
		
	//연도별 실적 조회
	@GetMapping(value = "/view_jh/annual_performance")
	public String annual_performance(HttpSession session, Model model) {
		System.out.println("연도별 실적 조회");
		
		// 유저 ID 가져오기
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("session에서 가져온 user_id: " + user_id);
		        
		Map<String, Object> annual_performance = ss.service_annual_performance(user_id);
		System.out.println("JhController annual_performance->"+annual_performance);
		
		boolean dataFetched = true; // 데이터가 있다면 fetch
		model.addAttribute("annualDataFetched", dataFetched);
		model.addAttribute("annual_performance", annual_performance);
		
		return "view_jh/statsMainForm";
	}
	
	//브랜드별, 차량종류별 실적 조회
	@PostMapping(value = "/view_jh/brand_type_results")
	public String brand_type_results(HttpSession session, @RequestParam("year") int year, Model model) {
		System.out.println("브랜드별, 차량종류별 실적 조회");
		
		// 유저 ID 가져오기
		
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("session에서 가져온 user_id: " + user_id);
		        
		        
		//차량종류별 실적 조회
		Map<String, Object> car_type_results = ss.service_car_type_results(year, user_id);
		System.out.println("JhController car_type_results->" + car_type_results);
		
		//브랜드별 실적 조회
		Map<String, Object> brand_type_results = ss.service_brand_type_results(year, user_id);
		System.out.println("JhController brand_type_results->" + brand_type_results);
		
		System.out.println("JhController year->" + year);
		System.out.println("JhController user_id->" + user_id);
		
		boolean dataFetched = true; // 데이터가 있다면 fetch
		model.addAttribute("brand_typeDataFetched", dataFetched);
		model.addAttribute("car_type_results", car_type_results);
		model.addAttribute("brand_type_results", brand_type_results);
		model.addAttribute("year" , year);
		
		return "view_jh/statsMainForm";
	}
	
	//재고내역 조회
	@GetMapping(value = "/view_jh/jago_list")
	public String jago_list(HttpSession session, Model model) {
		System.out.println("재고내역 조회");
		
		// 유저 ID 가져오기
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("session에서 가져온 user_id: " + user_id);
		        
		Map<String, Object> jago_list = ss.service_jago_list(user_id);
		System.out.println("JhController jago_list->"+jago_list);
		
		boolean dataFetched = true; // 데이터가 있다면 fetch
		model.addAttribute("jagoListDataFetched", dataFetched);
		model.addAttribute("jago_list", jago_list);
		
		return "view_jh/statsMainForm";
	}
	
	//입고내역 조회
	@GetMapping(value = "/view_jh/receiving_list")
	public String receiving_list(HttpSession session, Model model) {
		System.out.println("입고내역 조회");
		
		// 유저 ID 가져오기
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("session에서 가져온 user_id: " + user_id);
		        
		List<Car_General_Info> receiving_list = ss.service_receiving_list(user_id);
		System.out.println("JhController receiving_list->" + receiving_list);
		
		boolean dataFetched = true; // 데이터가 있다면 fetch
		model.addAttribute("receivingListDataFetched", dataFetched);
		model.addAttribute("receiving_list", receiving_list);
		
		return "view_jh/statsMainForm";
	}
	
	
	
}

