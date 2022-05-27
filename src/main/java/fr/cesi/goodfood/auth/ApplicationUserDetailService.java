package fr.cesi.goodfood.auth;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.repository.CustomerRepository;
import fr.cesi.goodfood.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.checkerframework.checker.nullness.Opt;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ApplicationUserDetailService implements UserDetailsService {

    private final CustomerRepository customerRepository;
    private final RestaurantRepository restaurantRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        Optional<Customer> customer = customerRepository.findCustomerByEmail(username);
        if (customer.isPresent()) {
            authorities.add(new SimpleGrantedAuthority(customer.get().getRole()));
            return new org.springframework.security.core.userdetails.User(customer.get().getEmail(),
                                                                          customer.get().getPassword(),
                                                                          authorities);
        } else {
            Optional<Restaurant> restaurant = restaurantRepository.findRestaurantByEmail(username);
            if (restaurant.isPresent()) {
                authorities.add(new SimpleGrantedAuthority(restaurant.get().getRole()));
                return new org.springframework.security.core.userdetails.User(restaurant.get().getEmail(),
                                                                              restaurant.get().getPassword(),
                                                                              authorities);
            }
        }
        throw new UsernameNotFoundException("User not found");
    }
}
