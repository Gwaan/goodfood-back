package fr.cesi.goodfood.payload.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.userdetails.UserDetails;

@Getter
@Setter
@AllArgsConstructor
public class JwtResponse {

    private String token;

    private String role;

    private Object userData;
}
