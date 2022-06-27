package fr.cesi.goodfood.payload.request;

import fr.cesi.goodfood.dto.ProductQuantityDto;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class OrderRequest {

    private List<ProductQuantityDto> productsOrdered;
    private String promoCode;


}
