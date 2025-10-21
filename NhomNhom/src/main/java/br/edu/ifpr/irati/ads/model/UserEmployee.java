package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@DiscriminatorValue("EMPLOYEE")
public class UserEmployee extends User {
    @Column(name = "user_employee_position", length = 50, nullable = false)
    private String userEmployeePosition;

    @Column(name = "user_employee_salary", length = 50, nullable = false)
    private BigDecimal userEmployeeSalary;

    public UserEmployee(Long userId, String userName, String userEmail, String userPassword, LocalDate userBirthDate, String userCpf, String userEmployeePosition, BigDecimal userEmployeeSalary) {
        super(userId, userName, userEmail, userPassword, userBirthDate, userCpf);
        this.userEmployeePosition = userEmployeePosition;
        this.userEmployeeSalary = userEmployeeSalary;
    }

    public UserEmployee() {
        super();
        userEmployeePosition = "";
        userEmployeeSalary = BigDecimal.ZERO;
    }

    public String getUserEmployeePosition() {
        return userEmployeePosition;
    }

    public void setUserEmployeePosition(String userEmployeePosition) {
        this.userEmployeePosition = userEmployeePosition;
    }

    public BigDecimal getUserEmployeeSalary() {
        return userEmployeeSalary;
    }

    public void setUserEmployeeSalary(BigDecimal userEmployeeSalary) {
        this.userEmployeeSalary = userEmployeeSalary;
    }
}
