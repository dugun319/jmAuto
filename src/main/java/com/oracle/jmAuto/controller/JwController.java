package com.oracle.jmAuto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JwController {
	@GetMapping(value = "/view_jw/cs")
	public String cs() {
		log.info("MainController main() is started");		
		return "view_jw/cs";
	}

}
