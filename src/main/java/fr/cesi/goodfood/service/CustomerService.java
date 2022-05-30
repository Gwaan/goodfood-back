package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.controller.AbstractController;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final PasswordEncoder passwordEncoder;

    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer updateCustomer(UpdateCustomerRequest updateCustomerRequest, String username) {
        Customer customerToUpdate = customerRepository.findCustomerByEmail(username).get();
        customerToUpdate.setLastName(updateCustomerRequest.getLastName());
        customerToUpdate.setFirstName(updateCustomerRequest.getFirstName());
        customerToUpdate.setPhone(updateCustomerRequest.getPhone());
        customerToUpdate.setStreet(updateCustomerRequest.getStreet());
        customerToUpdate.setCity(updateCustomerRequest.getCity());
        customerToUpdate.setZipCode(updateCustomerRequest.getZipCode());
        customerToUpdate.setRegion(updateCustomerRequest.getRegion());
        customerToUpdate.setCountry(updateCustomerRequest.getCountry());
        customerToUpdate.setUpdatedAt(LocalDateTime.now());
        Customer customerUpdated = saveCustomer(customerToUpdate);
        return customerUpdated;
    }

    public void updateCustomerPassword(UpdateCustomerPasswordRequest updateCustomerPasswordRequest, String username) {
        Customer customer = customerRepository.findCustomerByEmail(username).get();
        customer.setPassword(passwordEncoder.encode(updateCustomerPasswordRequest.getPassword()));
        saveCustomer(customer);
    }
}

