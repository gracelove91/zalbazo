package kr.zalbazo.model.content;

import lombok.*;

import java.time.LocalDateTime;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class Content {

    private Long id;
    private String title;
    private String body;
    private String userEmail;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    private Long categoryId;

    @Builder
    public Content(Long id, String title, String body, String userEmail, LocalDateTime createdDate, LocalDateTime updatedDate, Long categoryId) {
        this.id = id;
        this.title = title;
        this.body = body;
        this.userEmail = userEmail;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.categoryId = categoryId;
    }
}
