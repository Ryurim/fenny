package org.fullstack4.fenny.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StudyDTO {
    private int study_idx;
    private String member_id;
    private String study_title;
    private String study_content;
    private String study_image;
    private String study_reveal;
    private LocalDate study_display_date_start;
    private LocalDate study_display_date_end;
    private LocalDateTime study_reg_date;
    private int study_like_count;
    private String study_share;
    private String study_hashtag;
    private String study_category;
    private String share_id1;
    private String share_id2;
    private String share_id3;
    private String share_id4;
    private String share_id5;
}
