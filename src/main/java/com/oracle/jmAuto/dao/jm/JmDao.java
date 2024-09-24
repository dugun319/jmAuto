package com.oracle.jmAuto.dao.jm;

import com.oracle.jmAuto.dto.Account;
import com.oracle.jmAuto.dto.Business;
import com.oracle.jmAuto.dto.Certified;
import com.oracle.jmAuto.dto.User_Table;

public interface JmDao {

	User_Table login(String user_id, String user_pw);

	int join(User_Table user);

	int confirmId(String user_id);

	int insertBuz(Business business);

	int insertAccount(Account account);

	int sellerJoin(Business business, User_Table user_table, Account account);

	int profJoin(Certified certified, User_Table user_table, Account account);

	String findId(String user_email);

	User_Table findPw(User_Table user);

    void updateTempPw(String user_id, String tempPassword);

	String getUserEmail(String user_id);

}
