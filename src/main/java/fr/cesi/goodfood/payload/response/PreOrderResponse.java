package fr.cesi.goodfood.payload.response;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Getter
@Setter
public class PreOrderResponse {

    private BigDecimal totalTTC;
    private BigDecimal totalWithDiscount;
    private double percentageDiscount;

}
