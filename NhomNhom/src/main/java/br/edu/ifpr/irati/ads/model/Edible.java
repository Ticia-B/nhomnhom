package br.edu.ifpr.irati.ads.model;

import br.edu.ifpr.irati.ads.model.enums.ProductCategory;
import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity(name = "edible")
@Table(name = "tb_edible")
public class Edible {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "edible_id")
    private Long edibleId;

    @Column(name = "edbile_name", length = 50, nullable = false)
    private String edibleName;

    @Column(name = "edible_description", length = 300, nullable = false)
    private String edibleDescription;

    @Enumerated(EnumType.STRING)
    @Column(name = "product_category", nullable = false)
    private ProductCategory productCategory;

    @Column(name = "edible_photo", nullable = false)
    private String ediblePhoto;

    @Column(name = "edible_price", length = 10, nullable = false)
    private BigDecimal ediblePrice;

    public Edible(Long edibleId, String edbileName, String edbileDescription, ProductCategory productCategory, String ediblePhoto, BigDecimal ediblePrice) {
        this.edibleId = edibleId;
        this.ediblePhoto = ediblePhoto;
        this.edibleName = edbileName;
        this.edibleDescription = edbileDescription;
        this.productCategory = productCategory;
        this.ediblePrice = ediblePrice;
    }

    public Edible() {
        edibleId = 0L;
        edibleName = "";
        edibleDescription = "";
        productCategory = null;
        ediblePhoto = "";
        ediblePrice = BigDecimal.ZERO;
    }

    public String getEdiblePhoto() {
        return ediblePhoto;
    }

    public void setEdiblePhoto(String ediblePhoto) {
        this.ediblePhoto = ediblePhoto;
    }

    public Long getEdibleId() {
        return edibleId;
    }

    public void setEdibleId(Long edibleId) {
        this.edibleId = edibleId;
    }

    public String getEdibleName() {
        return edibleName;
    }

    public void setEdibleName(String edibleName) {
        this.edibleName = edibleName;
    }

    public String getEdibleDescription() {
        return edibleDescription;
    }

    public void setEdibleDescription(String edibleDescription) {
        this.edibleDescription = edibleDescription;
    }

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }

    public BigDecimal getEdiblePrice() {
        return ediblePrice;
    }

    public void setEdiblePrice(BigDecimal ediblePrice) {
        this.ediblePrice = ediblePrice;
    }
}
