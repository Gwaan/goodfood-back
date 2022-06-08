package fr.cesi.goodfood.dto;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Getter
@Setter
public class ProductRestaurantDto {

    private String name;
    private BigDecimal price;
    private String description;
    private String category;
    private double vat;

}
