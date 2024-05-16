package org.fullstack4.fenny.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.Arrays;
import java.util.List;

@Log4j2
@Data
public class PageResponseDTO<E> {
    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;

    private boolean prev_page_flag;
    private boolean next_page_flag;

    List<E> dtoList;

    private String[] search_type;
    private String search_word;
    private String search_date1="";
    private String search_date2="";
    private String search_type_string;

    private String linkParams;

    private String member_id;
    private String sortField;
    private String sortDir;


    PageResponseDTO() {} //빈으로 등록되기 위해 기본생성자 필요

    @Builder(builderMethodName = "withAll") //생성자로 들어오는 항목이 몇개가 되건 다 말아서 줘. 모든 생성자를 빌드 해 주셈
    public PageResponseDTO(PageRequestDTO requestDTO, List<E> dtoList, int total_count) {
        log.info("===============================================");
        log.info("ResponseDTO START");

        this.total_count = total_count;
        this.page = requestDTO.getPage();
        this.page_size = requestDTO.getPage_size();
        this.page_skip_count = (this.page-1)*this.page_size;
        this.total_page = (this.total_count > 0 ? (int)(Math.ceil(this.total_count/(double)this.page_size)) : 1);
        this.page_block_size = requestDTO.getPage_block_size();
        this.setPage_block_start();
        this.setPage_block_end();
        this.prev_page_flag = (this.page_block_start > 1); //이전 페이지가 존재하니?
        this.next_page_flag = (this.total_page > this.page_block_end); //다음 페이지가 존재하니?
        this.dtoList = dtoList;
        this.search_type = requestDTO.getSearch_type();
        this.search_word = requestDTO.getSearch_word();
        this.search_date1 = requestDTO.getSearch_date1();
        this.search_date2 = requestDTO.getSearch_date2();


        this.member_id = requestDTO.getMember_id();
        this.sortField = requestDTO.getSortField();
        this.sortDir = requestDTO.getSortDir();

        this.search_type_string = search_type !=null ? Arrays.toString(search_type).replace("[", "").replace("]", "") : "";

        StringBuilder sb = new StringBuilder("?page_size=" + this.page_size);
        if (search_type != null) {
            sb.append("&search_type=" + search_type_string );
        }
        if (search_word != null) {
            sb.append("&search_word=" + search_word);
        }
        if (search_date1 != null) {
            sb.append("&search_date1=" + search_date1);
        }
        if (search_date2 != null) {
            sb.append("&search_date2=" + search_date2);
        }
        if(sortField != null) {
            sb.append( "&sortField=" + sortField );
        }
        if (sortDir != null) {
            sb.append( "&sortDir=" + sortDir );
        }

        this.linkParams = sb.toString(); //쿼리스트링
        log.info("ResponseDTO END");
        log.info("===============================================");
    }

    public int getTotal_page() {
        return (this.total_count > 0 ? (int)Math.ceil(this.total_count / (double)this.page_size) : 1);
    }

    public int getPage_skip_count() {
        return (this.page-1) * this.page_size;
    }

    public void setPage_block_start() {
        this.page_block_start = (int)(Math.ceil(page / (double)page_block_size) -1 ) * page_block_size + 1;
    }

    public void setPage_block_end() {
        this.page_block_end = (int)Math.ceil(page / (double)page_block_size) * page_block_size;
        this.page_block_end = page_block_end > total_page ? total_page : page_block_end;
    }
}