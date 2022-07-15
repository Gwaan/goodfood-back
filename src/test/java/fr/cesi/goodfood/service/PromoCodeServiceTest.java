package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.PromoCode;
import fr.cesi.goodfood.repository.PromoCodeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class PromoCodeServiceTest {

    @Mock
    private PromoCodeRepository promoCodeRepository;

    private PromoCodeService promoCodeService;

    private PromoCode promoCode;

    @BeforeEach
    void setUp(){
        promoCodeService = new PromoCodeService(promoCodeRepository);
        promoCode = new PromoCode();
    }

    @Test
    void should_Return_Promo_Code_By_Code_Key(){
        when(promoCodeRepository.findPromoCodeByCodeKey(anyString())).thenReturn(promoCode);
        PromoCode promoCodeRetrieved = promoCodeService.getPromoCodeByCodekey("test");
        verify(promoCodeRepository,times(1)).findPromoCodeByCodeKey(anyString());
        assertEquals(promoCode,promoCodeRetrieved);
    }

}
