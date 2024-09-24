package com.oracle.jmAuto.service.jm;

import java.util.Random;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jm.JmDao;
import com.oracle.jmAuto.dto.Account;
import com.oracle.jmAuto.dto.Business;
import com.oracle.jmAuto.dto.Certified;
import com.oracle.jmAuto.dto.User_Table;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class JmServiceImpl implements JmService {
	private final JmDao jd;

	// 로그인
	@Override
	public User_Table login(String user_id, String user_pw) {
		System.out.println("JmServiceImpl.login start....");
		User_Table user_table = jd.login(user_id, user_pw);
		System.out.println("JmServiceImpl.login user_Table--->" + user_table);
		return user_table;
	}

	// 회원가입
	@Override
	public int join(User_Table user) {
		int joinResult = jd.join(user);
		System.out.println("JmServiceImpl.join joinResult--->" + joinResult);

		return joinResult;
	}

	// 아이디 중복 체크
	@Override
	public int confirmId(String user_id) {
		System.out.println("JmServiceImpl.confirmId start...");
		int result = jd.confirmId(user_id);
		System.out.println("JmServiceImpl.confirmId result--->" + result);

		return result;
	}

	@Override
	public int insertBuz(Business business) {
		System.out.println("JmServiceImpl.insertBuz start....");

		int result = 0;
		result = jd.insertBuz(business);

		System.out.println("JmServiceImpl.insertBuz result -->" + result);

		return result;
	}

	// 계좌 정보 입력
	@Override
	public int accountInsert(Account account) {
		System.out.println("JmServiceImpl.accountInsert start...");

		int accoutResult = jd.insertAccount(account);

		System.out.println("JmServiceImpl.accountInsert accountResult -->" + accoutResult);

		return accoutResult;
	}

	@Override
	public int sellerJoin(Business business, User_Table user_table, Account account) {

		int sellerJoinResult = jd.sellerJoin(business, user_table, account);

		return sellerJoinResult;
	}

	@Override
	public int profJoin(Certified certified, User_Table user_table, Account account) {
		int profJoinResult = jd.profJoin(certified, user_table, account);

		return profJoinResult;
	}

	// 아이디 찾기
	@Override
	public String findId(String user_email) {
		System.out.println("JmServiceImpl.findId start...");
		System.out.println("JmServiceImpl.findId user_email >>>>" + user_email);

		String user_id = jd.findId(user_email);

		System.out.println("JmServiceImpl.findId user_id >>> " + user_id);

		return user_id;
	}

	@Override
	public User_Table findPw(User_Table user) {
		System.out.println("JmServiceImpl.findPw() start... ");
		User_Table user_table = jd.findPw(user);
		System.out.println("JmServiceImpl.findPw() user_id &&& user_email" + user_table);

		return user_table;
	}
	
	
	// 임시비밀번호 데이터 베이스 UPDATE
	@Override
	public String createTempPassword(String user_id) {
		// 랜덤 패스워드 생성 후 저장
		String tempPassword = createRandomPw();
		// 비밀번호 DB 업데이트
		jd.updateTempPw(user_id, tempPassword);

	return tempPassword;
	}
	
	
	// 랜덤 비밀번호 생성 
	 private String createRandomPw() {
        // 랜덤 비밀번호 생성 로직

		// 비밀번호 길이 : 6
        int length = 6; 
		// 사용할 문자 : 대문자, 소문자, 숫자를 포함
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		// 랜덤 객체 생성(비밀번호 생성을 위한 난수 생성)
        Random random = new Random();
		// 비밀번호를 저장할 StringBuilder  초기화
        StringBuilder password = new StringBuilder(length);

		// length 만큼 반복하여 비밀번호 생성
        for (int i = 0; i < length; i++) {
			// chars에서 랜덤으로 하나의 문자를 선택하여 passWord에 추가
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        // 생성된 비밀번호를 문자열로 반환
        return password.toString();
    }




}