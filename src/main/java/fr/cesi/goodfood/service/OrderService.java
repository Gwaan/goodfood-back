package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.PromoCode;
import fr.cesi.goodfood.enums.OrderStatus;
import fr.cesi.goodfood.mapper.CustomerMapper;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Order;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.payload.request.OrderRequest;
import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final PromoCodeService promoCodeService;
    private final CustomerService customerService;
    private final ProductService productService;

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

    public void saveOrder(OrderRequest orderRequest, String username) {
        Customer customer = customerService.getCustomerByEmail(username);
        List<Product> products =
                orderRequest.getProductsOrdered()
                            .stream()
                            .map(productService::getProductByName)
                            .collect(Collectors.toList());

        Order order = new Order();
        BigDecimal totalTTC = products.stream()
                                      .map(Product::getPrice)
                                      .reduce(BigDecimal.ZERO,
                                              BigDecimal::add);
        if (orderRequest.getPromoCode() != null) {
            PromoCode promoCode = promoCodeService.getPromoCodeByCodekey(orderRequest.getPromoCode());
            order.setTotalTTC(applyDiscount(promoCode.getPercentage(), totalTTC));
            order.setPromoCode(promoCode);
        } else {
            order.setTotalTTC(totalTTC);
        }
        order.setPayed(true);
        order.setCreatedAt(LocalDateTime.now());
        order.setPayedAt(LocalDateTime.now());
        order.setCustomer(customer);
        order.setRestaurant(customer.getFavoriteRestaurant());
        order.setProducts(products);
        order.setStatus(OrderStatus.FINISHED.toString());
        orderRepository.save(order);

    }

    private BigDecimal applyDiscount(double discountPercentage, BigDecimal totalTTC) {
        return totalTTC.subtract(
                totalTTC.multiply(BigDecimal.valueOf(discountPercentage)).divide(BigDecimal.valueOf(100)).setScale(2,
                                                                                                                   RoundingMode.HALF_UP));
    }

}
