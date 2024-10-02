package com.oracle.jmAuto.service.jh;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jh.StatsDao;
import com.oracle.jmAuto.dto.Car_General_Info;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StatsServiceImpl implements StatsService{

	private final StatsDao sd;

	@Override
	public Map<String, Object> service_quarterly_results(int year, String user_id) {
		Map<String, Object> quarterly_results = null;
		quarterly_results = sd.dao_quarterly_results(year, user_id);
		return quarterly_results;
	}

	@Override
	public Map<String, Object> service_annual_performance(String user_id) {
		Map<String, Object> annual_performance = null;
		annual_performance = sd.dao_annual_performance(user_id);
		return annual_performance;
	}

	@Override
	public Map<String, Object> service_car_type_results(int year, String user_id) {
		Map<String, Object> car_type_results = null;
		car_type_results = sd.dao_car_type_results(year, user_id);
		return car_type_results;
	}

	@Override
	public Map<String, Object> service_brand_type_results(int year, String user_id) {
		Map<String, Object> brand_type_results = null;
		brand_type_results = sd.dao_brand_type_results(year, user_id);
		return brand_type_results;
	}

	@Override
	public Map<String, Object> service_jago_list(String user_id) {
		Map<String, Object> jago_list = null;
		jago_list = sd.dao_jago_list(user_id);
		return jago_list;
	}

	@Override
	public List<Car_General_Info> service_receiving_list(String user_id) {
		List<Car_General_Info> receiving_list = null;
		receiving_list = sd.dao_receiving_list(user_id);
		return receiving_list;
	}
}
