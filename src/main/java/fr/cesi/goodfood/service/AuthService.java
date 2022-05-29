package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.enums.Roles;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.request.RegisterCustomerRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.payload.response.RegisterResponse;
import fr.cesi.goodfood.repository.CustomerRepository;
import fr.cesi.goodfood.security.jwt.JwtUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtils jwtUtils;
    private final CustomerRepository customerRepository;

    public JwtResponse login(LoginRequest loginRequest) {
        Authentication authentication =
                authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername()
                        , loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = jwtUtils.generateToken(authentication);
        return new JwtResponse(token, authentication.getAuthorities().toString());
    }

    public RegisterResponse registerCustomer(RegisterCustomerRequest registerCustomerRequest) {
        if (customerRepository.existsCustomerByEmail(registerCustomerRequest.getEmail())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Username already existing"); //TODO: Controller
            // advice
        }
        Customer customer = new Customer();
        customer.setLastName(registerCustomerRequest.getLastName());
        customer.setFirstName(registerCustomerRequest.getFirstName());
        customer.setEmail(registerCustomerRequest.getEmail());
        customer.setPassword(passwordEncoder.encode(registerCustomerRequest.getPassword()));
        customer.setPhone(registerCustomerRequest.getPhone());
        customer.setStreet(registerCustomerRequest.getStreet());
        customer.setCity(registerCustomerRequest.getCity());
        customer.setZipCode(registerCustomerRequest.getZipCode());
        customer.setRegion(registerCustomerRequest.getRegion());
        customer.setCountry(registerCustomerRequest.getCountry());
        customer.setCreatedAt(LocalDateTime.now());
        customer.setRole(Roles.ROLE_CUSTOMER.toString());
        customerRepository.save(customer);
        return new RegisterResponse("SUCCESS");
    }


}
