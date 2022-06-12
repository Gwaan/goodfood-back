package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.service.CustomerService;
import fr.cesi.goodfood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/api/customer")
@PreAuthorize("hasRole('CUSTOMER')")
@RequiredArgsConstructor
@CrossOrigin
public class CustomerController extends AbstractController {

    private final CustomerService customerService;
    private final RestaurantService restaurantService;

    @PutMapping()
    public ResponseEntity<Customer> updateCustomer(@RequestBody UpdateCustomerRequest updateCustomerRequest) {
        return ResponseEntity.ok(customerService.updateCustomer(updateCustomerRequest, getUsernameFromPrincipal()));
    }

    @PutMapping("/password")
    public ResponseEntity<Void> updateCustomerPassword(
            @RequestBody UpdateCustomerPasswordRequest updateCustomerPasswordRequest) {
        customerService.updateCustomerPassword(updateCustomerPasswordRequest, getUsernameFromPrincipal());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/restaurants")
    public ResponseEntity<List<RestaurantDto>> getRestaurantsByZipCode(){
        return ResponseEntity.ok(restaurantService.findRestaurantsByZipCode(getZipCodeFromPrincipalCustomer()));
    }
}
