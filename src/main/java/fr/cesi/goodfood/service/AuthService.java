package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.UserAlreadyExistingException;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.enums.Roles;
import fr.cesi.goodfood.mapper.CustomerMapper;
import fr.cesi.goodfood.mapper.RestaurantMapper;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.request.RegisterCustomerRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.payload.response.RegisterResponse;
import fr.cesi.goodfood.repository.CustomerRepository;
import fr.cesi.goodfood.security.jwt.JwtUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
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
        if (authentication.getPrincipal() instanceof Customer) {
            return new JwtResponse(token, authentication.getAuthorities().toString(),
                                   CustomerMapper.INSTANCE.map((Customer) authentication.getPrincipal()));
        } else {
            return new JwtResponse(token, authentication.getAuthorities().toString(),
                                   RestaurantMapper.INSTANCE.map((Restaurant) authentication.getPrincipal()));
        }
    }

    public RegisterResponse registerCustomer(RegisterCustomerRequest registerCustomerRequest) {
        if (customerRepository.existsCustomerByEmail(registerCustomerRequest.getEmail())) {
            throw new UserAlreadyExistingException("User already existing in database");
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
