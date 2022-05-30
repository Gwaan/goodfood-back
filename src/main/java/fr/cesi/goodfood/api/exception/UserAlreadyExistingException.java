package fr.cesi.goodfood.api.exception;

public class UserAlreadyExistingException extends RuntimeException {

    public UserAlreadyExistingException(String message) {
        super(message);
    }
}
