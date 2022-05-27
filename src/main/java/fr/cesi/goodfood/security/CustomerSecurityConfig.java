package fr.cesi.goodfood.security;

import fr.cesi.goodfood.security.jwt.JwtEntryPoint;
import fr.cesi.goodfood.security.jwt.JwtTokenVerifierFilter;
import fr.cesi.goodfood.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@Order(1)
@RequiredArgsConstructor
public class CustomerSecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomerService customerDetailService;
    private final PasswordEncoder bCryptPasswordEncoder;
    private final JwtEntryPoint jwtEntryPoint;
    private final JwtTokenVerifierFilter jwtTokenVerifierFilter;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customerDetailService).passwordEncoder(bCryptPasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and()
            .csrf().disable()
            .exceptionHandling().authenticationEntryPoint(jwtEntryPoint)
            .and()
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            .and()
            .authorizeRequests()
            .antMatchers("/api/auth/customer/login").permitAll()
            .anyRequest().authenticated();

        http.addFilterBefore(jwtTokenVerifierFilter, UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

}
