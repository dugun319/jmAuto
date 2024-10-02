package com.oracle.jmAuto.dao.mh;

import java.util.List;

public interface Car_General_InfoDao {

	List<Car_General_InfoDao> CarList();

	List<Car_General_InfoDao> carSearchList(String keyword, int searchType);

	List<Car_General_InfoDao> carInfoList(String sellNum);
	
}
