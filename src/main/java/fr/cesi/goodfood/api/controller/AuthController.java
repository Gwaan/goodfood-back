package fr.cesi.goodfood.api.controller;

import fr.cesi.goodfood.payload.request.RegisterCustomerRequest;
import fr.cesi.goodfood.payload.request.LoginRequest;
import fr.cesi.goodfood.payload.response.JwtResponse;
import fr.cesi.goodfood.payload.response.RegisterResponse;
import fr.cesi.goodfood.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

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
                                    description = "Si les identifiants sont invalides",
                                    content = @Content(mediaType = "application/json",
                                                       schema = @Schema(defaultValue
                                                               = "Unauthorized")))})
    @PostMapping("/login")
    public ResponseEntity<JwtResponse> loginHandler(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Nom d'utilisateur et mot de passe",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = LoginRequest.class)))
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
                                                       @Schema(defaultValue = "User already existing in database")))})
    @PostMapping("/register/customer")
    public ResponseEntity<RegisterResponse> registerCustomer(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "Informations du client à enregistrer",
                                                                  content = @Content(schema = @Schema(implementation
                                                                          = RegisterCustomerRequest.class)))
            @RequestBody
                    RegisterCustomerRequest registerCustomerRequest) {
        return ResponseEntity.created(ServletUriComponentsBuilder.fromCurrentRequest().buildAndExpand().toUri())
                             .body(authService.registerCustomer(
                                     registerCustomerRequest));
    }

}
