package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@DiscriminatorValue("CLIENT")
public class UserClient extends User {
    @ManyToOne
    @JoinColumn(name = "address_id", nullable = false)
    private Address address;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @Column(name = "user_orders")
    private List<Order> orders;

    public UserClient(Long id, String name, String email, String password, LocalDate birthDate, String cpf, Address address) {
        super(id, name, email, password, birthDate, cpf);
        this.address = address;
    }

    public UserClient() {
        super();
        address = new Address();
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}
