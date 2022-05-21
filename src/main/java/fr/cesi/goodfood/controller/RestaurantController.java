package fr.cesi.goodfood.controller;

import fr.cesi.goodfood.entity.Allergen;
import fr.cesi.goodfood.entity.Ingredient;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.entity.Vat;
import fr.cesi.goodfood.entity.enums.Category;
import fr.cesi.goodfood.entity.enums.Country;
import fr.cesi.goodfood.service.RestaurantService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/api")
public class RestaurantController {

    private RestaurantService restaurantService;


    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @GetMapping("/saveRestaurant")
    public void saveRestaurant() {
        List<Allergen> allergens = new ArrayList<>();
        allergens.add(new Allergen(null, "name"));
        List<Ingredient> ingredients = new ArrayList<>();
        ingredients.add(new Ingredient(null, "name", true, true, true, "description", new BigDecimal(100), 10,
                                       "picture", new Vat(null, 10), allergens));
        List<Product> products = new ArrayList<>();
        products.add(new Product(null, "name", new BigDecimal(0.01), "picture", "description", Category.DESSERT.toString(),
                                 new Vat(null, 10.00),
                                 true, ingredients));


        Restaurant restaurant = new Restaurant(null, "name", "email@email.com", "password", "street", "city", "33000",
                                               "region", Country.FRANCE.toString(), products);
        restaurantService.saveRestaurant(restaurant);

    }
}
