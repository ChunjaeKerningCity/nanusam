package net.fullstack7.nanusam.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
@Data
public class PageResponseDTO<E> {
    private int total_count;
    private int page_no;
    private int page_size;
    private int total_page;
    private int page_skip_count;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;
    private int first_page;
    private int last_page;
    private boolean prev_page_flag;
    private boolean next_page_flag;

    private List<E> dtoList;

    private String searchKeyword;
    private String searchCategory;
    private String orderBy;
    private String orderDir;
    private String memberId;
    private String reservationId;

    public PageResponseDTO() {}

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO reqDTO, int total_count, List<E> dtoList) {
        this.total_count = total_count;
        this.page_no = reqDTO.getPage_no();
        this.page_size = reqDTO.getPage_size();
        this.page_skip_count = reqDTO.getPage_skip_count();
        this.total_page = (this.total_count > 0 ? (int)Math.ceil((this.total_count/(double)this.page_size)) : 1);
        this.page_block_size = reqDTO.getPage_block_size();

        this.setPage_block_start();
        this.setPage_block_end();
        this.prev_page_flag = (this.page_block_start > 1);
        this.next_page_flag = (this.total_page > this.page_block_end);
        this.total_count = total_count;
        this.dtoList = dtoList;

        this.searchCategory = reqDTO.getSearchCategory();
        this.searchKeyword = reqDTO.getSearchKeyword();
        this.orderBy = reqDTO.getOrderBy();
        this.orderDir = reqDTO.getOrderDir();
        this.memberId = reqDTO.getMemberId();
        this.reservationId = reqDTO.getReservationId();
    }

    public int getTotal_page() {
        return (this.total_count > 0 ? (int)Math.ceil((this.total_count/(double)this.page_size)) : 1);
    }

    public int getPage_skip_count() {
        return (this.page_no-1)*this.page_size;
    }

    public void setPage_block_start() {
        if ( this.page_no % this.page_block_size == 0) {
            this.page_block_start = this.page_no - (this.page_block_size -1);
        } else {
            this.page_block_start =  ((int)Math.floor(this.page_no/(double)this.page_block_size)*this.page_block_size) + 1;
        }
    }

    public void setPage_block_end() {
        this.page_block_end = (int)Math.ceil(this.page_no/(double)this.page_block_size)*this.page_block_size;
        this.page_block_end = (this.page_block_end > this.total_page ? this.total_page : this.page_block_end);
    }
}
