package fr.cesi.goodfood.entity;

import fr.cesi.goodfood.entity.enums.Category;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private BigDecimal price;

    @Column(name = "path_picture")
    private String picture;

    private String description;

    private Category category;

    @OneToOne
    @JoinColumn(name = "vat_id")
    private Vat vat;

    @Column(name = "is_on_sale")
    private boolean isOnSale;

    @OneToMany
    @JoinTable(name = "product_ingredient", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns =
    @JoinColumn(name = "ingredient_id"))
    private List<Ingredient> ingredients;

}
