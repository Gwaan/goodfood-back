package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.ProductNotFoundException;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.repository.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ProductServiceTest {

    @Mock
    private ProductRepository productRepository;

    private ProductService productService;

    private Product product;

    @BeforeEach
    void setUp() {
        productService = new ProductService(productRepository);
        product = new Product();
    }

    @Test
    void should_Return_Product_By_Id() {
        when(productRepository.findProductById(anyInt())).thenReturn(Optional.of(product));
        Product productRetrieved = productService.getProductById(1);
        verify(productRepository, times(1)).findProductById(anyInt());
        assertEquals(product, productRetrieved);
    }

    @Test
    void should_Throws_ProductNotFoundException() {
        when(productRepository.findProductById(anyInt())).thenThrow(ProductNotFoundException.class);
        assertThrows(ProductNotFoundException.class, ()->productService.getProductById(1));
    }

}
