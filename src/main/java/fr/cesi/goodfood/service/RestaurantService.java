package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.repository.RestaurantRepository;
import org.springframework.stereotype.Service;

@Service
public class RestaurantService {

    private RestaurantRepository restaurantRepository;

    public RestaurantService(RestaurantRepository restaurantRepository) {
        this.restaurantRepository = restaurantRepository;
    }

    public Restaurant saveRestaurant(Restaurant restaurant) {
        return restaurantRepository.save(restaurant);
    }

}
