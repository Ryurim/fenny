package org.fullstack4.fenny.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StudyDetailVO {
    private int idx;
    private int study_idx;
    private String receive_id;
}
