package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.ProductNotFoundException;
import fr.cesi.goodfood.entity.Product;
import fr.cesi.goodfood.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
