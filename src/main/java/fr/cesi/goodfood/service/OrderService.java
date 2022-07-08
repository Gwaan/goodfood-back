package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.OrderNotFoundException;
import fr.cesi.goodfood.api.exception.UnauthorizedOperationException;
import fr.cesi.goodfood.dto.ProductQuantityDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.PromoCode;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.enums.OrderStatus;
import fr.cesi.goodfood.mapper.CustomerMapper;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Order;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.payload.request.OrderRequest;
import fr.cesi.goodfood.payload.request.UpdateOrderStatusRequest;
import fr.cesi.goodfood.payload.response.PreOrderResponse;
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
    private final RestaurantService restaurantService;

    public Order getOrderById(Integer orderId) {
        return orderRepository.findById(orderId).orElseThrow(() -> new OrderNotFoundException("Order not found"));
    }

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
            restaurantOrderResponse.setOrderId(order.getId());
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
                            .map(ProductQuantityDto::getProductId)
                            .map(productService::getProductById)
                            .collect(Collectors.toList());

        Order order = new Order();
        BigDecimal totalTTC = getTotalTTC(orderRequest.getProductsOrdered());
        if (orderRequest.getPromoCode() != null) {
            PromoCode promoCode = promoCodeService.getPromoCodeByCodekey(orderRequest.getPromoCode());
            if (promoCode != null) {
                order.setTotalTTC(applyDiscount(promoCode.getPercentage(), totalTTC));
                order.setPromoCode(promoCode);
            } else {
                order.setTotalTTC(totalTTC);
                order.setPromoCode(null);
            }
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

    public PreOrderResponse getPreOrder(OrderRequest orderRequest) {
        PreOrderResponse preOrderResponse = new PreOrderResponse();
        BigDecimal totalTTC = getTotalTTC(orderRequest.getProductsOrdered());
        preOrderResponse.setTotalTTC(totalTTC);
        PromoCode promoCode = promoCodeService.getPromoCodeByCodekey(orderRequest.getPromoCode());
        if (promoCode == null) {
            preOrderResponse.setTotalWithDiscount(totalTTC);
        } else {
            preOrderResponse.setPercentageDiscount(promoCode.getPercentage());
            preOrderResponse.setTotalWithDiscount(applyDiscount(promoCode.getPercentage(), totalTTC));
        }

        return preOrderResponse;

    }

    public void updateOrderStatus(UpdateOrderStatusRequest updateOrderStatusRequest, String restaurantUsername) {
        Restaurant restaurant = restaurantService.findRestaurantByUsername(restaurantUsername);
        Order order = getOrderById(updateOrderStatusRequest.getOrderId());
        if (order.getRestaurant().getId() != restaurant.getId()) {
            throw new UnauthorizedOperationException("Unauthorized operation");
        }
        order.setStatus(updateOrderStatusRequest.getNewStatus());
        orderRepository.save(order);
    }

    private BigDecimal getTotalTTC(List<ProductQuantityDto> productsOrdered) {
        return productsOrdered.stream()
                              .map(productQuantityDto -> multiplyPriceByQuantity(productQuantityDto.getQuantity(),
                                                                                 productService.getProductById(
                                                                                                       productQuantityDto.getProductId())
                                                                                               .getPrice())
                                  ).reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal applyDiscount(double discountPercentage, BigDecimal totalTTC) {
        return totalTTC.subtract(
                totalTTC.multiply(BigDecimal.valueOf(discountPercentage)).divide(BigDecimal.valueOf(100)).setScale(2,
                                                                                                                   RoundingMode.HALF_UP));
    }

    private BigDecimal multiplyPriceByQuantity(Integer quantity, BigDecimal price) {
        return BigDecimal.valueOf(quantity).multiply(price);
    }


}
