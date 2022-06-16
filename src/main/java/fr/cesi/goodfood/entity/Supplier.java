package fr.cesi.goodfood.entity;

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
import javax.persistence.Table;
import java.util.List;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Supplier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private String email;

    private String phone;

    private String street;

    private String city;

    @Column(name = "zipcode")
    private String zipCode;

    private String region;

    private String country;

    @ManyToMany
    @JoinTable(name = "supplier_article",
               joinColumns = @JoinColumn(name = "supplier_id"),
               inverseJoinColumns = @JoinColumn(name = "article_id"))
    List<Article> articlesSelled;

}
