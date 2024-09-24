package com.oracle.jmAuto.dto;

import java.sql.Date;

import jakarta.persistence.Entity;
import lombok.Data;

@Data
public class Review {

	private String 	user_id;         //구매자(아이디)
	private String 	approval_num;    //승인번호
	private String  review_title;    //후기제목
	private String  review_content;  //후기내용
	private Date 	review_date;     //후기날짜
	private int     evaluation;      //구매평점
	private String  file_name;       //후기파일이름
	private String  file_url;        //후기파일경로
	private int     del_state;       //삭제여부
}
