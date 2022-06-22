package fr.cesi.goodfood.handler;

import fr.cesi.goodfood.api.exception.CustomerNotFoundException;
import fr.cesi.goodfood.api.exception.ProductNotFoundException;
import fr.cesi.goodfood.api.exception.PromoCodeNotFoundException;
import fr.cesi.goodfood.api.exception.RestaurantNotFoundException;
import fr.cesi.goodfood.api.exception.UserAlreadyExistingException;
import fr.cesi.goodfood.api.exception.ZipCodeNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.CONFLICT);
    }

    @ExceptionHandler(ZipCodeNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleException(ZipCodeNotFoundException e) {
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(CustomerNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleException(CustomerNotFoundException e) {
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(RestaurantNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleException(RestaurantNotFoundException e) {
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(PromoCodeNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleException(PromoCodeNotFoundException e) {
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(ProductNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleException(ProductNotFoundException e) {
        LOGGER.debug(e.getMessage());
        Map<String, Object> errorResponse = new HashMap<>();
        errorResponse.put(MESSAGE, e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

}
