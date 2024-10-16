package com.oracle.jmAuto.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TransferList {
	
	private String 	approval_num;		//승인번호
	private Date	approval_date;		/* 승인일자 */	
	private long	sell_num;			/* 매물번호 */
	private long 	expert_review_num; 	/* 전문가평가번호 */
	private long	price;				/* 가격 */
	private long	tax;				/* 세금 */
	private long	fee;				/* 대행수수료 */
	private long	total_price;		/* 결제금액 */
	private long 	buz_fee; 		 	/* 판매수수료 */
	private long	buz_money; 			/* 판매자입금액 */
	
	private String	user_id;
	
	private String 	account_num;
	private String 	account_name;
	private String 	account_bank;
	
	
	private String	admin_id;
	private String	search;
	private String	keyword;
	private String	pageNum;
	private int		start;
	private int		end;
	
	private String	currentPage;
	
}
