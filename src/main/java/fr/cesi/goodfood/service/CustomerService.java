package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Collection;

@Service
@RequiredArgsConstructor
@Slf4j
public class CustomerService implements UserDetailsService {

    private final CustomerRepository customerRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        log.info("Searching for username: {}", email);
        Customer customer = customerRepository.findCustomerByEmail(email);
        if (customer == null) {
            throw new UsernameNotFoundException("Customer not found in the database");
        }
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(customer.getRole()));
        return new org.springframework.security.core.userdetails.User(customer.getEmail(), customer.getPassword(),
                                                                      authorities);
    }

    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }


}

