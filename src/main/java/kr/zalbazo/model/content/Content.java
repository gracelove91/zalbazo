package kr.zalbazo.model.content;

import lombok.*;

import java.time.LocalDateTime;


@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class Content {

    private Long id;
    private String title;
    private String body;
    private String userEmail;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    private Long categoryId;

}
