package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.repository.CustomerRepository;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    private CustomerRepository customerRepository;

    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

}
