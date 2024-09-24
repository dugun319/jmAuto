package com.oracle.jmAuto.dto;

import java.util.Date;

import lombok.Data;
@Data
public class Certified { // 전문가
	private String cert_num;
	private String cert_name;
	private String cert_loc;
	private Date cert_date;
	private String cert_filename;
	private String cert_url;
}
