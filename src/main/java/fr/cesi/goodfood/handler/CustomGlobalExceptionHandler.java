package fr.cesi.goodfood.handler;

import fr.cesi.goodfood.api.exception.UserAlreadyExistingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class CustomGlobalExceptionHandler extends ResponseEntityExceptionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(CustomGlobalExceptionHandler.class);

    private static final String MESSAGE = "message";

    @ExceptionHandler(UserAlreadyExistingException.class)
    public ResponseEntity<Map<String, Object>> handleException(UserAlreadyExistingException e) {
        LOGGER.error(e.getMessage());
        Map<String, Object> errorReponse = new HashMap<>();
        errorReponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorReponse, HttpStatus.CONFLICT);
    }

}
