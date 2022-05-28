package fr.cesi.goodfood.payload.request;

import fr.cesi.goodfood.entity.Restaurant;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RegisterCustomerRequest {

    private String lastName;
    private String firstName;
    private String email;
    private String password;
    private String phone;
    private String street;
    private String city;
    private String zipCode;
    private String region;
    private String country;

}
