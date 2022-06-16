package fr.cesi.goodfood.service;

import fr.cesi.goodfood.api.exception.PromoCodeNotFoundException;
import fr.cesi.goodfood.entity.PromoCode;
import fr.cesi.goodfood.repository.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PromoCodeService {

    private final PromoCodeRepository promoCodeRepository;

    public PromoCode getPromoCodeByCodekey(String codekey) {
        return promoCodeRepository.findPromoCodeByCodeKey(codekey).orElseThrow(() -> new PromoCodeNotFoundException(
                "Promo code not found"));
    }

}
