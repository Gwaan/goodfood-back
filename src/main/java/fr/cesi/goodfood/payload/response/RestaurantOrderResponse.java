package fr.cesi.goodfood.payload.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import fr.cesi.goodfood.dto.CustomerDto;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class RestaurantOrderResponse {

    private BigDecimal totalTTC;
    private boolean isPayed;
    private LocalDateTime createdAt;
    @JsonProperty("customer")
    private CustomerDto customerDto;
    private String status;
    @JsonProperty("productsSelled")
    List<ProductRestaurantDto> productRestaurantDtos;

}
