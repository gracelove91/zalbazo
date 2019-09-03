package kr.zalbazo.model.content;

public enum Category {

    freeBoard(1,"커뮤니티게시판"),
    hospitalQnA( 2,"병원묻고답하기"),
    review( 3,"병원리뷰"),
    jisikDong(4,"지식동");

    private Integer key;
    private String value;

    Category(Integer key, String value) {
        this.key = key;
        this.value = value;
    }

    public Integer getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }
}
