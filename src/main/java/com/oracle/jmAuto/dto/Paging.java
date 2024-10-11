package com.oracle.jmAuto.dto;

import lombok.Data;

// NOTE : 페이징을 위한 DTO
@Data
public class Paging {
    private int currentPage;    // 현재 페이지
    private int rowPage;        // 한 페이지에 보여줄 데이터 수
    private int pageBlock;      // 한 번에 보여줄 페이지 블록 수
    private int start;          // 데이터 시작 번호
    private int end;            // 데이터 끝 번호
    private int startPage;      // 페이지 블록의 시작 페이지
    private int endPage;        // 페이지 블록의 끝 페이지
    private int total;          // 전체 데이터 개수
    private int totalPage;      // 전체 페이지 수
    private boolean prev;       // 이전 페이지 블록 존재 여부
    private boolean next;       // 다음 페이지 블록 존재 여부

    // 기본 생성자
    public Paging() {
        this.rowPage = 10;   // 기본값 설정 (페이지당 데이터 수)
        this.pageBlock = 10; // 기본값 설정 (한 번에 보여줄 페이지 수)
        this.currentPage = 1; // 기본값 설정 (첫 페이지)
    }

    // 전체 데이터 개수, 현재 페이지, 페이지당 데이터 수, 페이지 블록 크기를 받아 처리하는 생성자
    public Paging(int total, String currentPage1, int rowPage, int pageBlock) {
        this.total = total;
        this.rowPage = rowPage;
        this.pageBlock = pageBlock;
        this.currentPage = currentPage1 != null ? Integer.parseInt(currentPage1) : 1;

        // 페이징 계산 로직
        // 데이터의 시작과 끝 번호 계산
        this.start = (currentPage - 1) * rowPage + 1;
        this.end = start + rowPage - 1;

        // 전체 페이지 수 계산
        this.totalPage = (int) Math.ceil((double) total / rowPage);

        // 페이지 블록의 시작과 끝 페이지 계산
        this.startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        this.endPage = startPage + pageBlock - 1;

        // 마지막 페이지 블록이 총 페이지 수보다 크면 조정
        if (endPage > totalPage) {
            endPage = totalPage;
        }

        // 이전 페이지 블록이 있는지 여부
        this.prev = startPage > 1;
        
        // 다음 페이지 블록이 있는지 여부
        this.next = endPage < totalPage;
    }

    // 데이터베이스에서 데이터를 조회할 때 사용할 시작 인덱스 (0-based index)
    public int getStartIndex() {
        return (currentPage - 1) * rowPage;
    }
}