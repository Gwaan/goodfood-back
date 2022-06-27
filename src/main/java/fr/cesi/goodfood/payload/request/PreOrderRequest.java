package fr.cesi.goodfood.payload.request;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class PreOrderRequest {

    private List<String> productsOrdered;
    private String promoCode;

}
