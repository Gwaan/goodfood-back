package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.RestaurantNotFoundException;
import fr.cesi.goodfood.api.exception.ZipCodeNotFoundException;
import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.entity.Supplier;
import fr.cesi.goodfood.payload.request.RestaurantByZipCodeRequest;
import fr.cesi.goodfood.repository.RestaurantRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class RestaurantServiceTest {

    @Mock
    private RestaurantRepository restaurantRepository;

    private RestaurantService restaurantService;

    private Restaurant restaurant;

    @BeforeEach
    void setUp() {
        restaurantService = new RestaurantService(restaurantRepository);
        restaurant = new Restaurant(null, "test name", "test email", "test password", "test street", "test city",
                                    "test zipcode", "test region", "test country",
                                    List.of(new Product(), new Product()), new Supplier(),
                                    "ROLE_TEST");
    }

    @Test
    void should_Return_Restaurant_By_Id() {
        when(restaurantRepository.findById(anyInt())).thenReturn(Optional.of(restaurant));
        Restaurant restaurantSaved = restaurantService.getRestaurantById(1);
        verify(restaurantRepository, times(1)).findById(anyInt());
        assertEquals(restaurant, restaurantSaved);

    }

    @Test
    void should_Throws_RestaurantNotFoundException_When_Find_By_Id() {
        when(restaurantRepository.findById(anyInt())).thenThrow(RestaurantNotFoundException.class);
        assertThrows(RestaurantNotFoundException.class, () -> restaurantService.getRestaurantById(1));
    }

    @Test
    void should_Return_Restaurant_By_Username() {
        when(restaurantRepository.findRestaurantByEmail(anyString())).thenReturn(Optional.of(restaurant));
        Restaurant restaurantSaved = restaurantService.findRestaurantByUsername("test");
        verify(restaurantRepository, times(1)).findRestaurantByEmail(anyString());
        assertEquals(restaurant, restaurantSaved);
    }

    @Test
    void should_Throws_RestaurantNotFoundException_When_Find_By_Username() {
        when(restaurantRepository.findRestaurantByEmail(anyString())).thenThrow(RestaurantNotFoundException.class);
        assertThrows(RestaurantNotFoundException.class, () -> restaurantService.findRestaurantByUsername("test"));
    }

    @Test
    void should_Return_Restaurant_By_Zip_Code() {
        RestaurantByZipCodeRequest restaurantByZipCodeRequest = new RestaurantByZipCodeRequest("33000");
        when(restaurantRepository.findRestaurantsByZipCode(anyString())).thenReturn(List.of(restaurant));
        List<RestaurantDto> restaurantDtoList = restaurantService.findRestaurantsByZipCode(restaurantByZipCodeRequest);
        assertEquals(1, restaurantDtoList.size());
    }

    @Test
    void should_Throws_ZipCodeNotFoundException_When_Find_Restaurants_By_Zipcode() {
        RestaurantByZipCodeRequest restaurantByZipCodeRequest = new RestaurantByZipCodeRequest("33000");
        when(restaurantRepository.findRestaurantsByZipCode(anyString())).thenReturn(new ArrayList<>());
        assertThrows(ZipCodeNotFoundException.class,
                     () -> restaurantService.findRestaurantsByZipCode(restaurantByZipCodeRequest));
    }

    @Test
    void should_Return_Products_Selled_By_Restaurant() {
        when(restaurantRepository.findProductByRestaurantId(anyInt())).thenReturn(
                List.of(new Product(), new Product()));
        List<Product> productList = restaurantService.findProductsSelledByRestaurant(1);
        verify(restaurantRepository, times(1)).findProductByRestaurantId(anyInt());
        assertEquals(2, productList.size());
    }

}
