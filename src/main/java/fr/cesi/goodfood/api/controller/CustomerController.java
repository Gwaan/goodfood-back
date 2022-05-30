package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/customer")
@PreAuthorize("hasRole('CUSTOMER')")
@RequiredArgsConstructor
public class CustomerController extends AbstractController {

    private final CustomerService customerService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard customer";
    }

    @PutMapping()
    public ResponseEntity<?> updateCustomer(@RequestBody UpdateCustomerRequest updateCustomerRequest) {
        return ResponseEntity.ok(customerService.updateCustomer(updateCustomerRequest, getUsernameFromPrincipal()));
    }

    @PutMapping("/password")
    public ResponseEntity<?> updateCustomerPassword(
            @RequestBody UpdateCustomerPasswordRequest updateCustomerPasswordRequest) {
        customerService.updateCustomerPassword(updateCustomerPasswordRequest, getUsernameFromPrincipal());
        return ResponseEntity.noContent().build();
    }
}
