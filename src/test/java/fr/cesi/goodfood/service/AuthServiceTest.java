package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.repository.CustomerRepository;
import fr.cesi.goodfood.security.jwt.JwtUtils;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithAnonymousUser;
import java.time.LocalDateTime;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AuthServiceTest {

    @Mock
    private AuthenticationManager authenticationManager;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtUtils jwtUtils;

    @Mock
    private CustomerRepository customerRepository;

    @Mock
    private Authentication authentication;

    private AuthService authService;

    private static Customer customer;


    @BeforeEach
    void setUp() {
        authService = new AuthService(authenticationManager, passwordEncoder, jwtUtils, customerRepository);
        customer = new Customer(null, "test", "test", "test@test.fr", "test", "0102030405", "test street", "test city",
                                "test zipcode", "test region", "test country", null, LocalDateTime.now(),
                                LocalDateTime.now(), "ROLE_CUSTOMER");
        authentication.setAuthenticated(true);
    }

    @Test
    @WithAnonymousUser
    void should_Return_Jwt_Token() {
        LoginRequest loginRequest = new LoginRequest("test", "test");
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class))).thenReturn(
                authentication);
        when(jwtUtils.generateToken(any(Authentication.class))).thenReturn("test token");
        JwtResponse jwtResponse = authService.login(loginRequest);
        assertEquals(jwtResponse.getToken(), "test token");
    }

}
