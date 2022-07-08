package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.CustomerNotFoundException;
import fr.cesi.goodfood.dto.CustomerDto;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.payload.request.SetFavoriteRestaurantRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.repository.CustomerRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class CustomerServiceTest {

    @Mock
    private CustomerRepository customerRepository;

    @Mock
    private RestaurantService restaurantService;

    @Mock
    private PasswordEncoder passwordEncoder;

    private CustomerService customerService;

    private UpdateCustomerRequest updateCustomerRequest;

    private Customer customer;

    @BeforeEach
    void setUp() {
        customerService = new CustomerService(customerRepository, restaurantService, passwordEncoder);
        customer = new Customer(1, "last name test", "first name test", "email test", "password test",
                                "phone " + "test", "street test", "city test", "zipcode test", "region test",
                                "country test", new Restaurant(), LocalDateTime.now(), LocalDateTime.now(), "ROLE_TEST");
        customer.getFavoriteRestaurant().setId(1);
        updateCustomerRequest = new UpdateCustomerRequest("test", "test", "testphone", "test street", "test city",
                                                          "test zipcode", "test region", "test country");

    }

    @Test
    void should_Save_Customer() {
        when(customerRepository.save(any(Customer.class))).thenReturn(customer);
        Customer customerSaved = customerService.saveCustomer(customer);
        verify(customerRepository, times(1)).save(any(Customer.class));
        assertEquals(customer, customerSaved);
    }

    @Test
    void should_Get_Customer_By_Email() {
        when(customerRepository.findCustomerByEmail(anyString())).thenReturn(Optional.of(customer));
        Customer customerRetrieved = customerService.getCustomerByEmail("test");
        verify(customerRepository, times(1)).findCustomerByEmail(anyString());
        assertEquals(customer, customerRetrieved);
    }

    @Test
    void should_Update_Customer() {
        when(customerRepository.findCustomerByEmail(anyString())).thenReturn(Optional.of(new Customer()));
        when(customerRepository.save(any(Customer.class))).thenReturn(customer);
        CustomerDto customerDto = customerService.updateCustomer(updateCustomerRequest, "test");
        assertEquals("last name test", customerDto.getLastName());
    }

    @Test
    void should_Throws_CustomerNotFoundException() {
        when(customerRepository.findCustomerByEmail(anyString())).thenThrow(CustomerNotFoundException.class);
        assertThrows(CustomerNotFoundException.class,
                     () -> customerService.updateCustomer(updateCustomerRequest, "test"));
    }

    @Test
    void should_Update_Customer_Password() {
        when(passwordEncoder.encode(any(CharSequence.class))).thenReturn("test password");
        when(customerRepository.findCustomerByEmail(anyString())).thenReturn(Optional.of(customer));
        customerService.updateCustomerPassword(new UpdateCustomerPasswordRequest("test"), "test");
        verify(passwordEncoder, times(1)).encode(anyString());
        verify(customerRepository, times(1)).findCustomerByEmail(anyString());
    }

    @Test
    void should_Set_Favorite_Restaurant() {
        Restaurant restaurant = new Restaurant();
        SetFavoriteRestaurantRequest setFavoriteRestaurantRequest = new SetFavoriteRestaurantRequest(1);
        when(restaurantService.getRestaurantById(anyInt())).thenReturn(restaurant);
        when(customerRepository.findCustomerByEmail(anyString())).thenReturn(Optional.of(customer));
        when(customerRepository.save(any(Customer.class))).thenReturn(customer);
        customerService.setFavoriteRestaurant(setFavoriteRestaurantRequest, "test");
        verify(restaurantService, times(1)).getRestaurantById(anyInt());
    }

    @Test
    void should_Return_Products_Selled_By_Restaurant() {
        List<Product> products = Arrays.asList(new Product(), new Product(), new Product());
        when(customerRepository.findCustomerByEmail(anyString())).thenReturn(Optional.of(customer));
        when(restaurantService.findProductsSelledByRestaurant(anyInt())).thenReturn(products);
        List<ProductRestaurantDto> productRestaurantDtos = customerService.findProductsSelledByRestaurant("test");
        assertEquals(3, productRestaurantDtos.size());
    }

}
