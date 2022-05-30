package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.payload.request.RegisterCustomerRequest;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<?> loginHandler(@RequestBody LoginRequest loginRequest) {
        return ResponseEntity.ok(authService.login(loginRequest));
    }

    @PostMapping("/register/customer")
    public ResponseEntity<?> registerCustomer(@RequestBody RegisterCustomerRequest registerCustomerRequest) {
        return ResponseEntity.created(ServletUriComponentsBuilder.fromCurrentRequest().buildAndExpand().toUri()).body(authService.registerCustomer(
                registerCustomerRequest));
    }


}
