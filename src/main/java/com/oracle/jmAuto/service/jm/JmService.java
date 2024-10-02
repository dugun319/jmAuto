package com.oracle.jmAuto.service.jm;

import com.oracle.jmAuto.dto.Account;
import com.oracle.jmAuto.dto.Business;
import com.oracle.jmAuto.dto.Certified;
import com.oracle.jmAuto.dto.User_Table;

public interface JmService {

	User_Table login(String user_id, String user_pw);

	int join(User_Table user);

	int confirmId(String user_id);

	int insertBuz(Business business);

	int accountInsert(Account account);

	int sellerJoin(Business business, User_Table user_table, Account account);

	int profJoin(Certified certified, User_Table user_table, Account account);

	String findId(User_Table user);

	User_Table findPw(User_Table user);

    String createTempPassword(String user_id);

	

}
