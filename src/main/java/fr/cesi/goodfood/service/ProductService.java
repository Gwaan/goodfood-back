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

    public Product getProductById(Integer productId){
        return productRepository.findProductById(productId)
                                .orElseThrow(() -> new ProductNotFoundException("One product is not found"));
    }


}
