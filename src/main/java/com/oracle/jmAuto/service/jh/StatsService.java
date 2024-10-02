package com.oracle.jmAuto.service.jh;

import java.util.List;
import java.util.Map;

import com.oracle.jmAuto.dto.Car_General_Info;


public interface StatsService {

	Map<String, Object> service_quarterly_results(int year, String user_id);

	Map<String, Object> service_annual_performance(String user_id);

	Map<String, Object> service_car_type_results(int year, String user_id);

	Map<String, Object> service_brand_type_results(int year, String user_id);

	Map<String, Object> service_jago_list(String user_id);

	List<Car_General_Info> service_receiving_list(String user_id);



	
}
