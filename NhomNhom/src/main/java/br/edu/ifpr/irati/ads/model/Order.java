package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.List;

@Entity(name = "order")
@Table(name = "tb_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "order_id")
    private Long orderId;

    @ManyToMany
    @JoinTable(
        name = "tb_order_edible",
        joinColumns = @JoinColumn(name = "order_id"),
        inverseJoinColumns = @JoinColumn(name = "edible_id")
    )
    private List<Edible> edibleOrder;

    @ManyToOne
    @Column(name = "order_user", length = 50, nullable = false)
    private UserClient user;

    @Column(name = "order_total", length = 50, nullable = false)
    private BigDecimal total;


}
