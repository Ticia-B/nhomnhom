package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@DiscriminatorValue("CLIENT")
public class UserClient extends User {


    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @Column(name = "tb_user_orders")
    private List<Order> orders;

    public UserClient(Long id, String name, String email, String password, LocalDate birthDate, String cpf, List<Order> orders) {
        super(id, name, email, password, birthDate, cpf);
        this.orders = orders;
    }

    public UserClient() {
        super();
        this.orders = new ArrayList<>();

    }

    public void addOrder(Order order) {
        this.orders.add(order);
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}