package com.oracle.jmAuto.dao.mh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class Notice_TableDaoImpl implements Notice_TableDao {
	private final SqlSession session;

	@Override
	public List<Notice_TableDao> listnotice() {
		System.out.println("Notice_TableImpl listnotice start...");
		List<Notice_TableDao> notList = null;
		
		try {
			notList = session.selectList("com.oracle.jmAuto.dto.Mapper.mh.notList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return notList;
	}
	
	
}
