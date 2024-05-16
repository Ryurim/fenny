package org.fullstack4.fenny.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StudyDetailDTO {
    private int idx;
    private int study_idx;
    private String receive_id;
}
