package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.CustomerNotFoundException;
import fr.cesi.goodfood.dto.CustomerDto;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.mapper.CustomerMapper;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.payload.request.SetFavoriteRestaurantRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final RestaurantService restaurantService;
    private final PasswordEncoder passwordEncoder;

    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer getCustomerByEmail(String email) {
        return customerRepository.findCustomerByEmail(email)
                                 .orElseThrow(() -> new CustomerNotFoundException("Customer not found"));
    }

    public CustomerDto updateCustomer(UpdateCustomerRequest updateCustomerRequest, String username) {
        Customer customerToUpdate =
                customerRepository.findCustomerByEmail(username).orElseThrow(() -> new CustomerNotFoundException(
                        "Customer not found"));
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
        return CustomerMapper.INSTANCE.map(customerUpdated);
    }

    public void updateCustomerPassword(UpdateCustomerPasswordRequest updateCustomerPasswordRequest, String username) {
        Customer customer = getCustomerByEmail(username);
        customer.setPassword(passwordEncoder.encode(updateCustomerPasswordRequest.getPassword()));
        saveCustomer(customer);
    }

    public void setFavoriteRestaurant(SetFavoriteRestaurantRequest setFavoriteRestaurantRequest,
            String customerUsername) {
        Restaurant restaurant = restaurantService.getRestaurantById(
                setFavoriteRestaurantRequest.getFavoriteRestaurantId());
        Customer customer = getCustomerByEmail(customerUsername);
        customer.setFavoriteRestaurant(restaurant);
        customerRepository.save(customer);
    }

    public List<ProductRestaurantDto> findProductsSelledByRestaurant(String customerUsername) {
        Customer customer = getCustomerByEmail(customerUsername);
        List<Product> products = restaurantService.findProductsSelledByRestaurant(customer.getFavoriteRestaurant().getId());
        List<ProductRestaurantDto> productRestaurantDtos = products.stream()
                                                                   .map(p -> ProductMapper.INSTANCE.map(p))
                                                                   .collect(Collectors.toList());
        return productRestaurantDtos;
    }

}

