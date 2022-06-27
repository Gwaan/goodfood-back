package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.dto.CustomerDto;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Order;
import fr.cesi.goodfood.payload.request.OrderRequest;
import fr.cesi.goodfood.payload.request.RestaurantByZipCodeRequest;
import fr.cesi.goodfood.payload.request.SetFavoriteRestaurantRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerPasswordRequest;
import fr.cesi.goodfood.payload.request.UpdateCustomerRequest;
import fr.cesi.goodfood.payload.response.PreOrderResponse;
import fr.cesi.goodfood.service.CustomerService;
import fr.cesi.goodfood.service.OrderService;
import fr.cesi.goodfood.service.ProductService;
import fr.cesi.goodfood.service.RestaurantService;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
    private final ProductService productService;

    @Operation(summary = "Mise à jour client",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
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
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Informations du client à mettre à jour",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = UpdateCustomerRequest.class)))
            @RequestBody
                    UpdateCustomerRequest updateCustomerRequest) {
        return ResponseEntity.ok(customerService.updateCustomer(updateCustomerRequest, getUsernameFromPrincipal()));
    }

    @Operation(summary = "Mise à jour mot de passe client",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "204",
                                         description = "Réponse en cas de succès de la mise à jour du mot de passe client",
                                         content = @Content),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PutMapping("/password")
    public ResponseEntity<Void> updateCustomerPassword(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Mot de passe du client à mettre à jour",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = UpdateCustomerPasswordRequest.class)))
            @RequestBody
                    UpdateCustomerPasswordRequest updateCustomerPasswordRequest) {
        customerService.updateCustomerPassword(updateCustomerPasswordRequest, getUsernameFromPrincipal());
        return ResponseEntity.noContent().build();
    }

    @Operation(summary = "Trouver tous les restaurants en fonction d'un code postal",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de la récupération des codes postaux",
                                         content = @Content(mediaType = "application/json",
                                                            array =
                                                            @ArraySchema(schema = @Schema(implementation =
                                                                    RestaurantDto.class)))),
                       @ApiResponse(responseCode = "404",
                                    description = "Si aucun restaurant n'est trouvé en fonction du code postal",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue = "No restaurant found with this zip code"))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/restaurantsList")
    public ResponseEntity<List<RestaurantDto>> getRestaurantsByZipCode(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Code postal des restaurants à récupérer",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = RestaurantByZipCodeRequest.class)))
            @RequestBody
                    RestaurantByZipCodeRequest restaurantByZipCodeRequest) {
        return ResponseEntity.ok(restaurantService.findRestaurantsByZipCode(restaurantByZipCodeRequest));
    }

    @Operation(summary = "Définir le restaurant favori du client",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
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
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Id du nouveau restaurant favori",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = SetFavoriteRestaurantRequest.class)))
            @RequestBody
                    SetFavoriteRestaurantRequest setFavoriteRestaurantRequest) {
        customerService.setFavoriteRestaurant(setFavoriteRestaurantRequest, getUsernameFromPrincipal());
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Poster la commande d'un client",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
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
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Commande à poster",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = OrderRequest.class)))
            @RequestBody
                    OrderRequest orderRequest) {
        orderService.saveOrder(orderRequest, getUsernameFromPrincipal());
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Avoir le prix remisé si un coupon de remise est appliqué, si non, renvoi le prix sans remise",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de récupération du code promo ",
                                         content = @Content(schema = @Schema(implementation
                                                 = PreOrderResponse.class))),
                       @ApiResponse(responseCode = "404",
                                    description = "Si un des produits n'est pas trouvé",
                                    content = @Content(mediaType = "application/json",
                                                       schema =
                                                       @Schema(defaultValue = "One product is not found"))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/preorder")
    public ResponseEntity<PreOrderResponse> getPreOrder(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Produits dans le panier du client ainsi que le code promo",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = OrderRequest.class)))
            @RequestBody
                    OrderRequest orderRequest) {
        return ResponseEntity.ok(orderService.getPreOrder(orderRequest));
    }

    @Operation(summary = "Retourne la liste des produits vendus par le restaurant favori du client",
               tags = "Client",
               security = @SecurityRequirement(name = "bearerAuth"),
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de la récupération des produits",
                                         content = @Content(mediaType = "application/json",
                                                            array =
                                                            @ArraySchema(schema = @Schema(implementation =
                                                                    ProductRestaurantDto.class)))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @GetMapping("/restaurantProducts")
    public ResponseEntity<List<ProductRestaurantDto>> getProductsSelledByRestaurant() {
        return ResponseEntity.ok(customerService.findProductsSelledByRestaurant(getUsernameFromPrincipal()));
    }

}
