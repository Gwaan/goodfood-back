package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.payload.request.UpdateOrderStatusRequest;
import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la récupération des commandes",
                                         content = @Content(mediaType = "application/json",
                                                            array =
                                                            @ArraySchema(schema = @Schema(implementation =
                                                                    RestaurantOrderResponse.class)))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @GetMapping("/orders")
    public ResponseEntity<List<RestaurantOrderResponse>> getOrders() {
        return ResponseEntity.ok(orderService.getOrderFromRestaurantEmail(getUsernameFromPrincipal()));
    }

    @Operation(summary = "Modifier le statut d'une commande",
               tags = "Restaurant",
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la modification du status",
                                         content = @Content),
                       @ApiResponse(responseCode = "401",
                                    description = "Si un restaurant tente de modifier une commande ne lui appartenant pas ou si le token est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/updateOrderStatus")
    public ResponseEntity<Void> updateOrderStatus(
            @RequestBody
                    UpdateOrderStatusRequest updateOrderStatusRequest) {
        orderService.updateOrderStatus(updateOrderStatusRequest, getUsernameFromPrincipal());
        return ResponseEntity.ok().build();
    }

}
