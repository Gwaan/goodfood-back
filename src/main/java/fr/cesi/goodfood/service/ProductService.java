package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.ProductNotFoundException;
import fr.cesi.goodfood.dto.ProductRestaurantDto;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.mapper.ProductMapper;
import fr.cesi.goodfood.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public Product getProductByName(String productName) {
        return productRepository.findProductByName(productName)
                                .orElseThrow(() -> new ProductNotFoundException(
                                        String.format("Product %s not found", productName)));
    }


}
