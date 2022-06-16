package fr.cesi.goodfood.service;

import fr.cesi.goodfood.mapper.CustomerMapper;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Order;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;

    public List<RestaurantOrderResponse> getOrderFromRestaurantEmail(String email) {
        List<RestaurantOrderResponse> restaurantOrderResponses = new ArrayList<>();
        List<Order> orders = orderRepository.findByRestaurantEmail(email);
        orders.forEach(order -> {
            RestaurantOrderResponse restaurantOrderResponse = new RestaurantOrderResponse();
            List<ProductRestaurantDto> productRestaurantDtos = new ArrayList<>();
            order.getProducts().forEach(product -> {
                ProductRestaurantDto productRestaurantDto = ProductMapper.INSTANCE.map(product);
                productRestaurantDtos.add(productRestaurantDto);
            });
            restaurantOrderResponse.setTotalTTC(order.getTotalTTC());
            restaurantOrderResponse.setPayed(order.isPayed());
            restaurantOrderResponse.setCreatedAt(order.getCreatedAt());
            restaurantOrderResponse.setCustomerDto(CustomerMapper.INSTANCE.map(order.getCustomer()));
            restaurantOrderResponse.setStatus(order.getStatus());
            restaurantOrderResponse.setProductRestaurantDtos(productRestaurantDtos);
            restaurantOrderResponses.add(restaurantOrderResponse);
        });

        return restaurantOrderResponses;
    }

}
