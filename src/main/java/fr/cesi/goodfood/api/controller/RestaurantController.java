package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/restaurant")
@RequiredArgsConstructor
public class RestaurantController {

    private final RestaurantService restaurantService;

    @PostMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/accessdenied")
    public String accessDenied() {
        return "access denied restaurant";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard restaurant";
    }

}
