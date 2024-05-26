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
public class StudyShareVO {
    private int idx;
    private int study_idx;
    private String member_id;
    private String to_id;
    private LocalDateTime reg_date;
}
