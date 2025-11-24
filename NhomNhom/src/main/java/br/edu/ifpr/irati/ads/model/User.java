package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;
import jakarta.persistence.GenerationType;

import java.time.LocalDate;

@Entity(name = "user")
@Table(name = "tb_user")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "user_role", discriminatorType = DiscriminatorType.STRING)
public abstract class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "user_name", length = 100, nullable = false)
    private String userName;

    @Column(name = "user_email", length = 100, nullable = false, unique = true)
    private String userEmail;

    @Column(name = "user_password", length = 20, nullable = false)
    private String userPassword;

    @Column(name = "user_birth_date", length = 10)
    private LocalDate userBirthDate;

    @Column(name = "user_cpf", length = 20, nullable = false)
    private String userCpf;

    public User(Long userId, String userName, String userEmail, String userPassword, LocalDate userBirthDate, String userCpf) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userBirthDate = userBirthDate;
        this.userCpf = userCpf;
    }

    public User() {
        userId = 0L;
        userName = "";
        userEmail = "";
        userPassword = "";
        userBirthDate = LocalDate.now();
        userCpf = "";
    }


    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long id) {
        this.userId = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public LocalDate getUserBirthDate() {
        return userBirthDate;
    }

    public void setUserBirthDate(LocalDate userBirthDate) {
        this.userBirthDate = userBirthDate;
    }

    public String getUserCpf() {
        return userCpf;
    }

    public void setUserCpf(String userCpf) {
        this.userCpf = userCpf;
    }
}
