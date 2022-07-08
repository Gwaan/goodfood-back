package fr.cesi.goodfood.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateCustomerRequest {

    private String lastName;
    private String firstName;
    private String phone;
    private String street;
    private String city;
    private String zipCode;
    private String region;
    private String country;

}
