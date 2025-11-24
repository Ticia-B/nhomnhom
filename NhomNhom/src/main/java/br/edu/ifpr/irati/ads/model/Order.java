package br.edu.ifpr.irati.ads.model;

import br.edu.ifpr.irati.ads.model.enums.OrderStatus;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.ArrayList;
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
    @JoinColumn(name = "order_user")
    private UserClient user;

    @Enumerated(EnumType.STRING)
    @Column(name = "order_status", length = 50, nullable = false)
    private OrderStatus orderStatus;

    @Column(name = "order_total", length = 50, nullable = false)
    private BigDecimal total;

    public Order(Long orderId, OrderStatus orderStatus, List<Edible> edibleOrder, UserClient user, BigDecimal total) {
        this.orderId = orderId;
        this.orderStatus = orderStatus;
        this.edibleOrder = edibleOrder;
        this.user = user;
        this.total = total;
    }

    public Order() {
        orderStatus = OrderStatus.PENDING;
        orderId = 0L;
        edibleOrder = new ArrayList<>();
        user = new UserClient();
        total = new BigDecimal(0);
    }


    public void addEdible(Edible edible) {
        if (this.edibleOrder == null) {
            this.edibleOrder = new ArrayList<>();
        }
        this.edibleOrder.add(edible);
        recalculateTotal();
    }

    public void removeEdible(Long edibleId) {
        if (this.edibleOrder != null) {

            java.util.Iterator<Edible> iterator = this.edibleOrder.iterator();
            while (iterator.hasNext()) {
                Edible e = iterator.next();
                if (e.getEdibleId().equals(edibleId)) {
                    iterator.remove();// Remove o item
                    break;
                }
            }
            recalculateTotal();
        }
    }

    public void recalculateTotal() {
        this.total = BigDecimal.ZERO;
        if (edibleOrder != null) {
            for (Edible e : edibleOrder) {
                if (e.getEdiblePrice() != null) {
                    this.total = this.total.add(e.getEdiblePrice());
                }
            }
        }
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public List<Edible> getEdibleOrder() {
        return edibleOrder;
    }

    public void setEdibleOrder(List<Edible> edibleOrder) {
        this.edibleOrder = edibleOrder;
    }

    public UserClient getUser() {
        return user;
    }

    public void setUser(UserClient user) {
        this.user = user;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
