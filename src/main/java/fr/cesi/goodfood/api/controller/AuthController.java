package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.payload.request.RegisterCustomerRequest;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.payload.response.RegisterResponse;
import fr.cesi.goodfood.service.AuthService;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import java.util.HashMap;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@CrossOrigin
@Tag(name = "Authentification",
     description = "Authentication controller")
public class AuthController {

    private final AuthService authService;

    @Operation(summary = "Login handler",
               tags = "Authentification",
               responses = {@ApiResponse(responseCode = "200",
                                         description = "Réponse en cas de succès de l'authentification",
                                         content = @Content(mediaType = "application/json",
                                                            schema = @Schema(implementation =
                                                                    JwtResponse.class))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/login")
    public ResponseEntity<JwtResponse> loginHandler(
            @RequestBody
                    LoginRequest loginRequest) {
        return ResponseEntity.ok(authService.login(loginRequest));
    }

    @Operation(summary = "Enregistrement d'un client",
               tags = "Authentification",
               responses = {@ApiResponse(responseCode = "201",
                                         description = "Réponse en cas de succès de l'enregistrement",
                                         content = @Content
                                                 (mediaType = "application/json",
                                                  schema = @Schema(implementation = RegisterResponse.class))),
                       @ApiResponse(responseCode = "409",
                                    description = "Si le code promo n'est pas trouvé",
                                    content = @Content(mediaType = "application/json",
                                                       schema =
                                                       @Schema(defaultValue = "User already existing in database"))),
                       @ApiResponse(responseCode = "401",
                                    description = "Si le token fourni est invalide",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/register/customer")
    public ResponseEntity<?> registerCustomer(
            @RequestBody
                    RegisterCustomerRequest registerCustomerRequest) {
        return ResponseEntity.created(ServletUriComponentsBuilder.fromCurrentRequest().buildAndExpand().toUri())
                             .body(authService.registerCustomer(
                                     registerCustomerRequest));
    }

}
