package com.oracle.jmAuto.dao.jh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.Car_General_Info;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StatsDaoImpl  implements StatsDao{

	private final SqlSession session;

	@Override
	public Map<String, Object> dao_quarterly_results(int year, String user_id) {
		Map<String, Object> quarterly_results = null;
		try {
			 Map<String, Object> params = new HashMap<>();
		        params.put("year", year);
		        params.put("user_id", user_id);
			
			quarterly_results  = session.selectMap("com.oracle.jmAuto.Stats_Mapper.jh.quarterly_results", params, "QUARTER");
			System.out.println("StatsDaoImpl quarterly_results->"+ quarterly_results);
		} catch (Exception e) {
			System.out.println("StatsDaoImpl quarterly_results Exception->"+e.getMessage());
		  }
		return quarterly_results;
	}

	@Override
	public Map<String, Object> dao_annual_performance(String user_id) {
	    Map<String, Object> annual_performance = null;
	    try {
	        annual_performance = session.selectMap("com.oracle.jmAuto.Stats_Mapper.jh.annual_performance", user_id, "YEAR");
	        Map<String, Object> sortedMap = new TreeMap<>(annual_performance);
	        System.out.println("StatsDaoImpl annual_performance->" + sortedMap);
	        return sortedMap;
	    } catch (Exception e) {
	        System.out.println("StatsDaoImpl annual_performance Exception->" + e.getMessage());
	      }
	    return annual_performance;
	}

	@Override
	public Map<String, Object> dao_car_type_results(int year, String user_id) {
		Map<String, Object> car_type_results = null;
		try {
			 Map<String, Object> params = new HashMap<>();
		        params.put("year", year);
		        params.put("user_id", user_id);
			
			car_type_results  = session.selectMap("com.oracle.jmAuto.Stats_Mapper.jh.car_type_results", params, "CAR_TYPE");
			System.out.println("StatsDaoImpl car_type_results->"+car_type_results);
		} catch (Exception e) {
			System.out.println("StatsDaoImpl brand_type_results Exception->"+e.getMessage());
		  }
		return car_type_results;
	}

	@Override
	public Map<String, Object> dao_brand_type_results(int year, String user_id) {
		Map<String, Object> brand_type_results = null;
		try {
			Map<String, Object> params = new HashMap<>();
		        params.put("year", year);
		        params.put("user_id", user_id);
	        
			brand_type_results  = session.selectMap("com.oracle.jmAuto.Stats_Mapper.jh.brand_type_results", params, "BRAND");
			System.out.println("StatsDaoImpl brand_type_results->"+brand_type_results);
		} catch (Exception e) {
			System.out.println("StatsDaoImpl brand_type_results Exception->"+e.getMessage());
		  }
		return brand_type_results;
	}

	@Override
	public Map<String, Object> dao_jago_list(String user_id) {
		Map<String, Object> jago_list = null;
	    try {
	    	jago_list = session.selectMap("com.oracle.jmAuto.Stats_Mapper.jh.jago_list", user_id, "매물번호");
	        System.out.println("StatsDaoImpl jago_list->" + jago_list);
	    } catch (Exception e) {
	        System.out.println("StatsDaoImpl annual_performance Exception->" + e.getMessage());
	      }
	    return jago_list;
	}

	@Override
	public List<Car_General_Info> dao_receiving_list(String user_id) {
		List<Car_General_Info> receiving_list = null;
		try {
			receiving_list = session.selectList("com.oracle.jmAuto.Stats_Mapper.jh.receiving_list", user_id);
			System.out.println("StatsDaoImpl receiving_list->"+receiving_list.size());
		} catch (Exception e) {
			System.out.println("StatsDaoImpl annual_performance Exception->" + e.getMessage());
		  }
		return receiving_list;
	}

}