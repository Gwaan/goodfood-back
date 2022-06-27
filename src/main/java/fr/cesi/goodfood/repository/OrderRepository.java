package fr.cesi.goodfood.repository;

import fr.cesi.goodfood.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findByRestaurantEmail(String email);

    @Override
    Optional<Order> findById(Integer integer);

}
