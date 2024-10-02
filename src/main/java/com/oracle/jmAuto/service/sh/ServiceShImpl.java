package com.oracle.jmAuto.service.sh;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.sh.DaoSh;
import com.oracle.jmAuto.dao.sh.DaoShImpl;
import com.oracle.jmAuto.dto.Car_General_Info;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ServiceShImpl implements ServiceSh {

	private final DaoSh daoSh;

	@Override
	public List<Car_General_Info> searchList(String keyword, int start, int end) {
		System.out.println("ServiceShImpl searchList start...");
		List<Car_General_Info> valueList = daoSh.searchList(keyword, start, end);
		System.out.println(valueList);
		return valueList;
	}

	@Override
	public List<Car_General_Info> car_type_Car(int start, int end, int car_type) {
		System.out.println("ServiceShImpl kCar start...");
		List<Car_General_Info> valueList = daoSh.car_type_Car(start, end, car_type);
		return valueList;
	}

	@Override
	public List<Car_General_Info> detailSearch(String keyword, String model_name, int min_price, int max_price, int start, int end) {
		System.out.println("ServiceShImpl detailSearch start...");
		System.out.printf("키워드=%s, 모델검색=%s, 최소값=%d, 최대값=%d \n", keyword, model_name, min_price, max_price);
		List<Car_General_Info> valueList = daoSh.detailSearch(keyword, model_name, min_price, max_price, start, end);
		System.out.println(valueList);
		return valueList;
	}
	
	@Override
	public int cartot(int car_type) {
		int total = daoSh.cartot(car_type);
		return total;
	}

	@Override
	public int detailSearchCartot(String keyword, String model_name, int min_price, int max_price) {
		int total = daoSh.detailSearchCartot(keyword,model_name,min_price,max_price);
		return total;
	}

	@Override
	public int searchListTotal(String keyword) {
		int total = daoSh.searchListTotal(keyword);
		return total;
	}

	@Override
	public List<Car_General_Info> chkBrand(int brand, int start, int end) {
		System.out.println("ServiceShImpl chkBrand start...");
		System.out.println("ServiceShImpl chkBrand brand >> "+brand);
		List<Car_General_Info> carList = daoSh.chkBrand(brand, start, end);
		System.out.println("ServiceShImpl chkBrand >> "+carList);
		return carList;
	}

	@Override
	public int brandCarTot(int brand) {
		int total = daoSh.brandCarTot(brand);
		return total;
	}

	@Override
	public int detailBTotal(int brand, String manu_date, String fuel) {
		System.out.println("ServiceShImpl chkBrand start...");
		
		//글자 쪼개서 형변환
		String[] date1 = manu_date.split("~");
		int manu_date1 = Integer.parseInt(date1[0]);
		int manu_date2 = Integer.parseInt(date1[1]);
		
		int total = daoSh.detailBTotal(brand,manu_date1, manu_date2, fuel);
		return total;
	}

	@Override
	public List<Car_General_Info> detailB(int brand, String manu_date, String fuel, int start, int end) {
		System.out.println("ServiceShImpl detailB start...");
		
		//글자 쪼개서 형변환
		String[] date1 = manu_date.split("~");
		int manu_date1 = Integer.parseInt(date1[0]);
		int manu_date2 = Integer.parseInt(date1[1]);
		
		List<Car_General_Info> valueList = daoSh.detailB(brand,manu_date1, manu_date2, fuel, start, end);
		
		return valueList;
	}

	@Override
	public int InputCar(Map<String, Object> infor) {
		System.out.println("ServiceShImpl InputCar start...");
		System.out.println("ServiceShImpl infor >>"+infor);
		
		int result = daoSh.InputCar(infor);
		return result;
	}

	@Override
	public int carNumChk(String car_num) {
		System.out.println("ServiceShImpl InputCar start... >> "+car_num);
		int result = daoSh.carNumChk(car_num);
		
		return result;
	}

	@Override
	public List<Car_General_Info> getCarNum() {
		List<Car_General_Info> carNum = daoSh.getCarNum();
		return carNum;
	}

	@Override
	public int insertImgUrl(Map<String, Object> insertMap) {
		int result = daoSh.insertImgUrl(insertMap);
		return result;
	}


	
}