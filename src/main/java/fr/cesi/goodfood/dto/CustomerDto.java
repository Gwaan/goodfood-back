package fr.cesi.goodfood.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerDto {

    private String lastName;
    private String firstName;
    private String email;
    private String phone;
    private String street;
    private String city;
    private String region;
    private String zipCode;
    private String country;

}
