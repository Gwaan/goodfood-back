package fr.cesi.goodfood.api.exception;

public class ZipCodeNotFoundException extends RuntimeException {

    public ZipCodeNotFoundException(String message) {
        super(message);
    }
}
