package kr.zalbazo.exception;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle404(NoHandlerFoundException e){
        log.error(e.getMessage());
        return "exception/custom404";
    }

    @ExceptionHandler(EmailConfirmFirstException.class)
    public String emailConfirmFirst(EmailConfirmFirstException e){
        log.error(e.getMessage());
        return "exception/emailConfirmFirst";
    }
}
