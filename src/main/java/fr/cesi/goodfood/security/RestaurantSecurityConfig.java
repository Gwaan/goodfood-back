package fr.cesi.goodfood.security;

import fr.cesi.goodfood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@Order(1)
@RequiredArgsConstructor
public class RestaurantSecurityConfig extends WebSecurityConfigurerAdapter {

    private final RestaurantService restaurantDetailService;
    private final PasswordEncoder bCryptPasswordEncoder;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(restaurantDetailService).passwordEncoder(bCryptPasswordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.antMatcher("/api/restaurant/**")
            .authorizeRequests()
            .anyRequest()
            .hasAuthority("ROLE_RESTAURANT")
            .and()
            .formLogin()
            .loginPage("/api/restaurant/login")
            .defaultSuccessUrl("/api/restaurant/dashboard", true)
            .failureUrl("/api/restaurant/accessdenied")
            .permitAll()
            .and()
            .logout()
            .logoutUrl("/api/restaurant/logout")
            .logoutSuccessUrl("/api/restaurant/login")
            .and()
            .exceptionHandling()
            .accessDeniedPage("/api/restaurant/accessdenied");
        http.csrf().disable();
    }
}
