package fr.cesi.goodfood.service;

import fr.cesi.goodfood.entity.Article;
import fr.cesi.goodfood.entity.VatFee;
import fr.cesi.goodfood.repository.VatFeeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyDouble;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class VatFeeServiceTest {

    @Mock
    private VatFeeRepository vatFeeRepository;

    private VatFeeService vatFeeService;

    private Article article;

    @BeforeEach
    void setUp() {
        vatFeeService = new VatFeeService(vatFeeRepository);
        article = new Article();
    }

    @Test
    void should_Return_Vat_For_Packaged_Article() {
        article.setPackaged(true);
        when(vatFeeRepository.findVatFeeByPercentage(anyDouble())).thenReturn(new VatFee(null, 5.50));
        double vatRateRetrieved = vatFeeService.getVatRate(article);
        assertEquals(5.50, vatRateRetrieved);
    }

    @Test
    void should_Return_Vat_For_Non_Packaged_Article() {
            article.setPackaged(false);
        when(vatFeeRepository.findVatFeeByPercentage(anyDouble())).thenReturn(new VatFee(null, 10.00));
        double vatRateRetrieved = vatFeeService.getVatRate(article);
        assertEquals(10, vatRateRetrieved);
    }

}
