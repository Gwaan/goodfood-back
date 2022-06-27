package fr.cesi.goodfood.payload.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestaurantByZipCodeRequest {

    private String zipCode;

}
