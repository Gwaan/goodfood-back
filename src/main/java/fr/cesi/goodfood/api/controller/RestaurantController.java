package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.service.OrderService;
import fr.cesi.goodfood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/api/restaurant")
@PreAuthorize("hasRole('RESTAURANT')")
@RequiredArgsConstructor
@CrossOrigin
public class RestaurantController extends AbstractController {

    private final OrderService orderService;

    @GetMapping("/orders")
    public ResponseEntity<List<RestaurantOrderResponse>> getOrders() {
        return ResponseEntity.ok(orderService.getOrderFromRestaurantEmail(getUsernameFromPrincipal()));
    }

}
