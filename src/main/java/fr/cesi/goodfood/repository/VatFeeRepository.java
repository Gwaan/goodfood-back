package fr.cesi.goodfood.repository;

import fr.cesi.goodfood.entity.VatFee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VatFeeRepository extends JpaRepository<VatFee, Integer> {

    VatFee findVatFeeByPercentage(double percentage);

}
