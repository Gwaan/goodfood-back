package fr.cesi.goodfood.api.exception;

public class UnauthorizedOperationException extends RuntimeException{

    public UnauthorizedOperationException(String message) {
        super(message);
    }
}
