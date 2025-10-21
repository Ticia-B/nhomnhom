package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity(name = "address")
@Table(name = "tb_address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "address_id")
    private Long addressId;

    @Column(name = "address_number", length = 100, nullable = false)
    private Integer addressNumber;

    @Column(name = "address_complement", length = 100, nullable = true)
    private String addressComplement;

    @Column(name = "address_street", length = 100, nullable = false)
    private String addresStreet;

    @Column(name = "address_city", length = 100, nullable = false)
    private String addressCity;

    @Column(name = "address_state", length = 100, nullable = false)
    private String addressState;



}
