package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

import java.time.LocalDate;

@Entity
@DiscriminatorValue("ADMIN")
public class UserAdmin extends User {
    public UserAdmin(Long userId, String userName, String userEmail, String userPassword, LocalDate userBirthDate, String userCpf) {
        super(userId, userName, userEmail, userPassword, userBirthDate, userCpf);
    }

    public UserAdmin() {
    }
}
