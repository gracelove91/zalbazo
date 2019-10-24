package kr.zalbazo.exception;

import lombok.extern.log4j.Log4j;

@Log4j
public class EmailConfirmFirstException extends RuntimeException {
    private static final String message = "이메일을 먼저 인증해주세요. ";

    public EmailConfirmFirstException(String userEmail) {
        super(message);
        log.error(message + " " + userEmail);
    }
}
