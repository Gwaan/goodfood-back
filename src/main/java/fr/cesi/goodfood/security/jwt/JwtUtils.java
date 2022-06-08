package fr.cesi.goodfood.security.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.security.core.userdetails.User;
import java.util.Date;
import java.util.stream.Collectors;

@Component
public class JwtUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(JwtUtils.class);

    @Value("${goodfood.app.jwtSecret}")
    private String jwtSecret;

    @Value("${goodfood.app.jwtExpirationMs}")
    private int jwtExpirationMs;

    public String generateToken(Authentication authentication) {
        UserDetails user = (UserDetails) authentication.getPrincipal();
        String token = JWT.create()
                          .withSubject(user.getUsername())
                          .withExpiresAt(new Date(System.currentTimeMillis() + jwtExpirationMs))
                          .withIssuedAt(new Date())
                          .withClaim("roles",
                                     user.getAuthorities().stream().map(
                                                 GrantedAuthority::getAuthority)
                                         .collect(
                                                 Collectors.toList()))
                          .sign(getJwtAlgorithm());
        return token;
    }

    public String getUsernameFromJwtToken(String token) {
        JWTVerifier verifier = JWT.require(getJwtAlgorithm()).build();
        DecodedJWT decodedJWT = verifier.verify(token);
        return decodedJWT.getSubject();
    }

    private Algorithm getJwtAlgorithm() {
        return Algorithm.HMAC256(jwtSecret.getBytes());
    }

    public boolean validateJwtToken(String authToken) {
        try {
            JWTVerifier verifier = JWT.require(getJwtAlgorithm()).build();
            DecodedJWT decodedJWT = verifier.verify(authToken);
            return true;
        } catch (JWTVerificationException e) {
            LOGGER.error("Failed to verify JWT Token", e.getMessage());
        }
        return false;
    }
}
