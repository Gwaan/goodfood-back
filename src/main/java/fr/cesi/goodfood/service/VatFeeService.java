package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Article;
import fr.cesi.goodfood.repository.VatFeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class VatFeeService {

    private final VatFeeRepository vatFeeRepository;

    public double getVatRate(Article article) {
        if (article.isPackaged()) {
            return vatFeeRepository.findVatFeeByPercentage(5.50).getPercentage();
        } else {
            return vatFeeRepository.findVatFeeByPercentage(10.00).getPercentage();
        }
    }

}
