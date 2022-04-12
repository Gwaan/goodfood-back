package fr.cesi.goodfood;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableEncryptableProperties
public class GoodfoodApplication {

	public static void main(String[] args) {
		SpringApplication.run(GoodfoodApplication.class, args);
	}

}
