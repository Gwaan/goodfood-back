package fr.cesi.goodfood.api.exception;

public class PromoCodeNotFoundException extends RuntimeException{

    public PromoCodeNotFoundException(String message) {
        super(message);
    }
}
