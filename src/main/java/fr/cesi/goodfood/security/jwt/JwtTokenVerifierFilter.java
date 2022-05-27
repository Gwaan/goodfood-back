package fr.cesi.goodfood.security.jwt;

import com.google.common.base.Strings;
import fr.cesi.goodfood.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class JwtTokenVerifierFilter extends OncePerRequestFilter {

    private final JwtUtils jwtUtils;
    private final CustomerService customerService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);

        if (Strings.isNullOrEmpty(authorizationHeader) || !authorizationHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        String token = authorizationHeader.replace("Bearer ", "");

        try {
            if (jwtUtils.validateJwtToken(token)) {
                String username = jwtUtils.getUsernameFromJwtToken(token);
                UserDetails userDetails = customerService.loadUserByUsername(username);
                UsernamePasswordAuthenticationToken authenticationToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            }
        } catch (Exception e) {
            throw new IllegalStateException(String.format("Token %s cannot be trusted", token));
        }

        filterChain.doFilter(request, response);

    }
}
