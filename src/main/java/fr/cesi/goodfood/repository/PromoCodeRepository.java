package fr.cesi.goodfood.repository;

import fr.cesi.goodfood.entity.PromoCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface PromoCodeRepository extends JpaRepository<PromoCode, Integer> {

    Optional<PromoCode> findPromoCodeByCodeKey(String codekey);
}
