package com.oracle.jmAuto.dto;

import lombok.Data;

@Data
public class Expert_Review {
	
	private long	expert_review_num;		/* 전문가평가번호 */
	private long	sell_num;				/* 매물번호 */
	private String	write_date;				/* 작성일 */
	private int		score;					/* 평가점수 */
	private String	content;				/* 평가내용 */
	private String	user_id;				/* 전문가(아이디) */
	private int		ess_state;				/* 기본상태 */
	private int		ess_mileage;			/* 기본주행거리 */
	private int		ess_regi;				/* 기본등록증 */
	private int		egine_oil;				/* 소모엔진오일 */
	private int		brake_oil;				/* 소모브레이크오일 */
	private int		coolant;				/* 소모냉각수 */
	private int		tire;					/* 소모타이어 */
	private int		brake_pad;				/* 소모브레이크패드 */

}
