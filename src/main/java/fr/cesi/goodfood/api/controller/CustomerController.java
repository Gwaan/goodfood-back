package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.dto.CustomerDto;
import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.payload.request.OrderRequest;
import fr.cesi.goodfood.payload.request.SetFavoriteRestaurantRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.service.CustomerService;
import fr.cesi.goodfood.service.OrderService;
import fr.cesi.goodfood.service.RestaurantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/customer")
@PreAuthorize("hasRole('CUSTOMER')")
@RequiredArgsConstructor
@CrossOrigin
@Tag(name = "Client",
     description = "Client controller")
public class CustomerController extends AbstractController {

    private final CustomerService customerService;
    private final RestaurantService restaurantService;
    private final OrderService orderService;

    @Operation(summary = "Mise à jour client",
               tags = "Client",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la mise à jour du client",
                                         content = @Content(mediaType = "application/json",
                                                            schema = @Schema(implementation =
                                                                    CustomerDto.class))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PutMapping()
    public ResponseEntity<CustomerDto> updateCustomer(
            @RequestBody
                    UpdateCustomerRequest updateCustomerRequest) {
        return ResponseEntity.ok(customerService.updateCustomer(updateCustomerRequest, getUsernameFromPrincipal()));
    }

    @Operation(summary = "Mise à jour mot de passe client",
               tags = "Client",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la mise à jour du mot de passe client",
                                         content = @Content),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PutMapping("/password")
    public ResponseEntity<Void> updateCustomerPassword(
            @RequestBody
                    UpdateCustomerPasswordRequest updateCustomerPasswordRequest) {
        customerService.updateCustomerPassword(updateCustomerPasswordRequest, getUsernameFromPrincipal());
        return ResponseEntity.noContent().build();
    }

    @Operation(summary = "Trouver tous les restaurants ayant le même code postal que le client",
               tags = "Client",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de la récupération des codes postaux",
                                         content = {@Content(mediaType = "application/json",
                                                             array =
                                                             @ArraySchema(schema = @Schema(implementation =
                                                                     RestaurantDto.class)))}),
                       @ApiResponse(responseCode = "404",
                                    description = "Si aucun restaurant n'est trouvé en fonction du code postal",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue = "No restaurant found with this zip code"))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @GetMapping("/restaurants")
    public ResponseEntity<List<RestaurantDto>> getRestaurantsByZipCode() {
        return ResponseEntity.ok(restaurantService.findRestaurantsByZipCode(getZipCodeFromPrincipalCustomer()));
    }

    @Operation(summary = "Définir le restaurant favori du client",
               tags = "Client",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la définition du restaurant",
                                         content = @Content),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/restaurants")
    public ResponseEntity<Void> setFavoriteRestaurant(
            @RequestBody
                    SetFavoriteRestaurantRequest setFavoriteRestaurantRequest) {
        customerService.setFavoriteRestaurant(setFavoriteRestaurantRequest, getUsernameFromPrincipal());
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Poster la commande d'un client",
               tags = "Client",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès du post de la commande d'un client",
                                         content = @Content),
                       @ApiResponse(responseCode = "404",
                                    description = "Si le code promo n'est pas trouvé en base de données",
                                    content = @Content(mediaType = "application/json",
                                                       schema =
                                                       @Schema(defaultValue = "Promo code not found"))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/order")
    public ResponseEntity<Void> setOrder(
            @RequestBody
                    OrderRequest orderRequest) {
        orderService.saveOrder(orderRequest, getUsernameFromPrincipal());
        return ResponseEntity.ok().build();
    }

}
