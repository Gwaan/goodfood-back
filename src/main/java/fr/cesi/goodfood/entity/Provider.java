package fr.cesi.goodfood.entity;

import fr.cesi.goodfood.entity.enums.Country;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import java.util.List;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    @Column(name = "ref")
    private String reference;

    private String email;

    private String phone;

    private String street;

    private String city;

    @Column(name = "zipcode")
    private String zipCode;

    private String region;

    private Country country;

    @ManyToMany
    @JoinTable(name = "provider_article", joinColumns = @JoinColumn(name = "provider_id"), inverseJoinColumns
            = @JoinColumn(name = "article_id"))
    List<Article> articlesSelled;

}
