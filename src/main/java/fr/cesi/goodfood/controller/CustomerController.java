package fr.cesi.goodfood.controller;

import fr.cesi.goodfood.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/customer")
@PreAuthorize("hasRole('CUSTOMER')")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService customerService;

    @GetMapping("/accessdenied")
    public String accessDenied() {
        return "access denied customer";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard customer";
    }
}
