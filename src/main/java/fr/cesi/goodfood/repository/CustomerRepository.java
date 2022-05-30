package fr.cesi.goodfood.repository;

import fr.cesi.goodfood.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

    Optional<Customer> findCustomerById(int id);

    Optional<Customer> findCustomerByEmail(String email);

    boolean existsCustomerByEmail(String email);

}
