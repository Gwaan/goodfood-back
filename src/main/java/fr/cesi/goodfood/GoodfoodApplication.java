package fr.cesi.goodfood;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import fr.cesi.goodfood.entity.Customer;
import fr.cesi.goodfood.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.time.LocalDateTime;

@SpringBootApplication
@EnableEncryptableProperties
public class GoodfoodApplication {


    public static void main(String[] args) {
        SpringApplication.run(GoodfoodApplication.class, args);
    }

}
