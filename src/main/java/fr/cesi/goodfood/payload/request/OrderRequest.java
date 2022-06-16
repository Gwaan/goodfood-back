package fr.cesi.goodfood.payload.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class OrderRequest {

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String promoCode;

    private List<String> productsOrdered;

}
