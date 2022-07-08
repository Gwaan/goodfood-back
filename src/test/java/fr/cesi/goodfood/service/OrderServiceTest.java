package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.OrderNotFoundException;
import fr.cesi.goodfood.api.exception.UnauthorizedOperationException;
import fr.cesi.goodfood.dto.ProductQuantityDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Order;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.entity.PromoCode;
import fr.cesi.goodfood.entity.Restaurant;
import fr.cesi.goodfood.payload.request.OrderRequest;
import fr.cesi.goodfood.payload.request.UpdateOrderStatusRequest;
import fr.cesi.goodfood.payload.response.PreOrderResponse;
import fr.cesi.goodfood.payload.response.RestaurantOrderResponse;
import fr.cesi.goodfood.repository.OrderRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class OrderServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private PromoCodeService promoCodeService;

    @Mock
    private CustomerService customerService;

    @Mock
    private ProductService productService;

    @Mock
    private RestaurantService restaurantService;

    private OrderService orderService;

    private Order order;

    private OrderRequest orderRequest;

    @BeforeEach
    void setUp() {
        orderService = new OrderService(orderRepository, promoCodeService, customerService, productService,
                                        restaurantService);
        order = new Order(null, new BigDecimal(20.00), true, LocalDateTime.now(), LocalDateTime.now(),
                          LocalDateTime.now(), new Customer(), new Restaurant(), new PromoCode(),
                          Arrays.asList(new Product(), new Product()), "FINISHED");
    }

    @Test
    void should_Return_Order_By_Id() {
        when(orderRepository.findById(anyInt())).thenReturn(Optional.of(order));
        Order orderRetrieved = orderService.getOrderById(1);
        verify(orderRepository, times(1)).findById(anyInt());
        assertEquals(order, orderRetrieved);
    }

    @Test
    void should_Throws_OrderNotFoundException() {
        when(orderRepository.findById(anyInt())).thenThrow(OrderNotFoundException.class);
        assertThrows(OrderNotFoundException.class, () -> orderService.getOrderById(1));
    }

    @Test
    void should_Return_Restaurant_Order() {
        List<Order> orders = Arrays.asList(order);
        when(orderRepository.findByRestaurantEmail(anyString())).thenReturn(orders);
        List<RestaurantOrderResponse> restaurantOrderResponses = orderService.getOrderFromRestaurantEmail("test");
        assertNotNull(restaurantOrderResponses);
        assertEquals(2, restaurantOrderResponses.get(0).getProductRestaurantDtos().size());
    }

    @Test
    void should_Save_Order() {
        orderRequest = new OrderRequest(Arrays.asList(new ProductQuantityDto(1, 2)), "test");
        Product product = new Product();
        product.setPrice(new BigDecimal(10.00));
        when(customerService.getCustomerByEmail(anyString())).thenReturn(new Customer());
        when(productService.getProductById(anyInt())).thenReturn(product);
        orderService.saveOrder(orderRequest, "test");
    }

    @Test
    void should_Return_PreOrder() {
        orderRequest = new OrderRequest(Arrays.asList(new ProductQuantityDto(1, 2)), "test");
        Product product = new Product();
        product.setPrice(new BigDecimal(10.00));
        PromoCode promoCode = new PromoCode();
        promoCode.setPercentage(10.00);
        when(productService.getProductById(anyInt())).thenReturn(product);
        when(promoCodeService.getPromoCodeByCodekey(anyString())).thenReturn(promoCode);
        PreOrderResponse preOrderResponse = orderService.getPreOrder(orderRequest);
        assertEquals(new BigDecimal(20.00), preOrderResponse.getTotalTTC());
        assertEquals(new BigDecimal(18.00).setScale(2, RoundingMode.HALF_UP), preOrderResponse.getTotalWithDiscount());

    }

    @Test
    void should_Update_Order_Status() {
        UpdateOrderStatusRequest updateOrderStatusRequest = new UpdateOrderStatusRequest(1, "PENDING");
        when(restaurantService.findRestaurantByUsername(anyString())).thenReturn(new Restaurant());
        when(orderRepository.findById(anyInt())).thenReturn(Optional.of(order));
        orderService.updateOrderStatus(updateOrderStatusRequest, "test");
        verify(restaurantService, times(1)).findRestaurantByUsername(anyString());
        verify(orderRepository, times(1)).findById(anyInt());

    }

    @Test
    void should_Throws_UnauthorizedOperationException() {
        UpdateOrderStatusRequest updateOrderStatusRequest = new UpdateOrderStatusRequest(1, "PENDING");
        Restaurant restaurant = new Restaurant();
        restaurant.setId(1);
        order.getRestaurant().setId(2);
        when(restaurantService.findRestaurantByUsername(anyString())).thenReturn(restaurant);
        when(orderRepository.findById(anyInt())).thenReturn(Optional.of(order));
        assertThrows(UnauthorizedOperationException.class, () -> orderService.updateOrderStatus(updateOrderStatusRequest
                , "test"));

    }

}
