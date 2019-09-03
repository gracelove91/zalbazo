package kr.zalbazo.model.content;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Content {

    private Long id;
    private String contentTitle;
    private Long userId;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;

}
