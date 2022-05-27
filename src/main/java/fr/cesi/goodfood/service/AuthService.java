package fr.cesi.goodfood.service;

import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.security.jwt.JwtUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final AuthenticationManager authenticationManager;

    private final JwtUtils jwtUtils;

    public JwtResponse login(LoginRequest loginRequest) {
        Authentication authentication =
                authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername()
                        , loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = jwtUtils.generateToken(authentication);
        return new JwtResponse(token);
    }



}
