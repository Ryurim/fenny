package org.fullstack4.fenny.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StudyImageVO {
    private int img_idx;
    private int study_idx;
    private String orgFile;
    private String saveFile;
    private LocalDateTime reg_date;
}
