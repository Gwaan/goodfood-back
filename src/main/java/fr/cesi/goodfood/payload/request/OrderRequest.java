package fr.cesi.goodfood.payload.request;

import fr.cesi.goodfood.dto.ProductQuantityDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderRequest {

    private List<ProductQuantityDto> productsOrdered;
    private String promoCode;


}
