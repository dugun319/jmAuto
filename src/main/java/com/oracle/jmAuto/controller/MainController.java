package com.oracle.jmAuto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.jmAuto.service.main.MainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {
	
	private final MainService ms;
	@GetMapping(value = "/")
	public String main() {
		log.info("MainController main() is started");	
		System.out.println("controller 정민 고침");
		System.out.println("controller 지원 고침");
		int result = 0;
		result = ms.SelectUser();
		System.out.println("---->>>>"+result);
		return "main";
	}
	


	
}
