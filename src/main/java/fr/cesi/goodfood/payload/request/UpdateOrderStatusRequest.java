package fr.cesi.goodfood.payload.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateOrderStatusRequest {

    private Integer orderId;
    private String newStatus;

}
