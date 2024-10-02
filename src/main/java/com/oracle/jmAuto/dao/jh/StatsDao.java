package com.oracle.jmAuto.dao.jh;

import java.util.List;
import java.util.Map;

import com.oracle.jmAuto.dto.Car_General_Info;


public interface StatsDao {

	Map<String, Object> dao_quarterly_results(int year, String user_id);

	Map<String, Object> dao_annual_performance(String user_id);

	Map<String, Object> dao_car_type_results(int year, String user_id);

	Map<String, Object> dao_brand_type_results(int year, String user_id);

	Map<String, Object> dao_jago_list(String user_id);

	List<Car_General_Info> dao_receiving_list(String user_id);

}
