package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.RestaurantNotFoundException;
import fr.cesi.goodfood.api.exception.ZipCodeNotFoundException;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.mapper.RestaurantMapper;
import fr.cesi.goodfood.payload.request.RestaurantByZipCodeRequest;
import fr.cesi.goodfood.repository.ProductRepository;
import fr.cesi.goodfood.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RestaurantService {

    private final RestaurantRepository restaurantRepository;

    public Restaurant getRestaurantById(Integer id) {
        return restaurantRepository.findById(id)
                                   .orElseThrow(() -> new RestaurantNotFoundException("Restaurant not found"));
    }

    public Restaurant findRestaurantByUsername(String username){
        return restaurantRepository.findRestaurantByEmail(username).orElseThrow(()-> new RestaurantNotFoundException(
                "Restaurant not found"));
    }

    public List<RestaurantDto> findRestaurantsByZipCode(RestaurantByZipCodeRequest restaurantByZipCodeRequest) {
        List<Restaurant> restaurants = restaurantRepository.findRestaurantsByZipCode(
                restaurantByZipCodeRequest.getZipCode());
        if (restaurants.isEmpty()) {
            throw new ZipCodeNotFoundException("No restaurant found with this zip code");
        }
        List<RestaurantDto> restaurantDtos = new ArrayList<>();
        restaurants.forEach(restaurant -> {
            RestaurantDto restaurantDto = RestaurantMapper.INSTANCE.map(restaurant);
            restaurantDtos.add(restaurantDto);
        });
        return restaurantDtos;
    }

    public List<Product> findProductsSelledByRestaurant(Integer restaurantId) {
        return restaurantRepository.findProductByRestaurantId(restaurantId);
    }

}
