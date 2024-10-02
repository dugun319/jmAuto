package com.oracle.jmAuto.service.sh;

import java.util.List;
import java.util.Map;

import com.oracle.jmAuto.dto.Car_General_Info;

public interface ServiceSh {

	List<Car_General_Info> searchList(String keyword, int start, int end);

	List<Car_General_Info> car_type_Car(int start, int end, int car_type);

	List<Car_General_Info> detailSearch(String keyword, String model_name, int min_price, int max_price, int start, int end);

	int detailSearchCartot(String keyword, String model_name, int min_price, int max_price);

	int searchListTotal(String keyword);

	int cartot(int car_type);

	List<Car_General_Info> chkBrand(int brand, int start, int end);

	int brandCarTot(int brand);

	int detailBTotal(int brand, String manu_date, String fuel);

	List<Car_General_Info> detailB(int brand, String manu_date, String fuel, int start, int end);

	int InputCar(Map<String, Object> infor);

	int carNumChk(String car_num);

	List<Car_General_Info> getCarNum();

	int insertImgUrl(Map<String, Object> insertMap);

	


}