package fr.cesi.goodfood.repository;

import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface RestaurantRepository extends JpaRepository<Restaurant, Integer> {

    Optional<Restaurant> findRestaurantByEmail(String email);

    List<Restaurant> findRestaurantsByZipCode(String zipCode);

    @Query("select r.productsSelled from Restaurant r where r.id = :restaurantId")
    List<Product> findProductByRestaurantId(Integer restaurantId);

}
