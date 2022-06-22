package fr.cesi.goodfood.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.CascadeType;
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
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    @Column(name = "is_in_stock")
    private boolean isInStock;

    @Column(name = "is_pork_free")
    private boolean isPorkFree;

    @Column(name = "is_vegan_friendly")
    private boolean isVeganFriendly;

    private String description;

    private BigDecimal price;

    @Column(name = "path_picture")
    private String picture;

    @OneToMany(cascade = CascadeType.MERGE)
    @JoinTable(name = "ingredient_allergen",
               joinColumns = @JoinColumn(name = "ingredient_id"),
               inverseJoinColumns = @JoinColumn(name = "allergen_id"))
    private List<Allergen> allergens;

}
