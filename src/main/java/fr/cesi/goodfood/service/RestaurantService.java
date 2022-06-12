package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.ZipCodeNotFoundException;
import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.mapper.RestaurantMapper;
import fr.cesi.goodfood.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RestaurantService {

    private final RestaurantRepository restaurantRepository;

    public Restaurant saveRestaurant(Restaurant restaurant) {
        return restaurantRepository.save(restaurant);
    }

    public List<RestaurantDto> findRestaurantsByZipCode(String zipCode) {
        List<Restaurant> restaurants = restaurantRepository.findRestaurantsByZipCode(zipCode);
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
}
