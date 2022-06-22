package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.service.OrderService;
import fr.cesi.goodfood.service.RestaurantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
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
@Tag(name = "Restaurant",
     description = "Restaurant controller")
public class RestaurantController extends AbstractController {

    private final OrderService orderService;

    @Operation(summary = "Récupérer toutes les commandes d'un restaurant",
               tags = "Restaurant",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la récupération des commandes",
                                         content = @Content),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @GetMapping("/orders")
    public ResponseEntity<List<RestaurantOrderResponse>> getOrders() {
        return ResponseEntity.ok(orderService.getOrderFromRestaurantEmail(getUsernameFromPrincipal()));
    }

}
