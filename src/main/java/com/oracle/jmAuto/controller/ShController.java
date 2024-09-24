package com.oracle.jmAuto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ShController {
	@GetMapping(value = "/view_sh/kCar")
	public String kCar() {
		log.info("MainController main() is started");		
		return "view_sh/kCar";
	}
	@GetMapping(value = "/view_sh/fCar")
	public String fCar() {
		log.info("MainController main() is started");		
		return "view_sh/fCar";
	}
	@GetMapping(value = "/view_sh/ecoCar")
	public String ecoCar() {
		log.info("MainController main() is started");		
		return "view_sh/ecoCar";
	}
	@GetMapping(value = "/view_sh/sellMyCar")
	public String sellMyCar() {
		log.info("MainController main() is started");		
		return "view_sh/sellMyCar";
	}

}
