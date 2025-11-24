package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

public class UserEmployeeService implements Service {
    @Override
    public void findById(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> dao = new GenericDao<>(UserEmployee.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        req.getSession().setAttribute("user", dao.findById(id));
        req.getSession().setAttribute("usersEmployee", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> dao = new GenericDao<>(UserEmployee.class, session);
        req.getSession().setAttribute("user", new UserEmployee());
        req.getSession().setAttribute("usersEmployee", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void update(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> dao = new GenericDao<>(UserEmployee.class, session);
        Long id = Long.parseLong(req.getParameter("employeeId"));
        String name = req.getParameter("empEditName");
        String email = req.getParameter("empEditEmail");
        String password = req.getParameter("empEditPassword");
        String position = req.getParameter("userEditEmployeePosition");
        BigDecimal salary = new BigDecimal(req.getParameter("userEditEmployeeSalary"));
        LocalDate birthDate = LocalDate.parse(req.getParameter("empEditBirthDate"));
        String cpf = req.getParameter("empEditCpf");
        UserEmployee userEmployee = dao.findById(id);
        userEmployee.setUserName(name);
        userEmployee.setUserEmployeePosition(position);
        userEmployee.setUserEmployeeSalary(salary);
        userEmployee.setUserBirthDate(birthDate);
        userEmployee.setUserCpf(cpf);
        userEmployee.setUserEmail(email);
        userEmployee.setUserPassword(password);
        dao.update(userEmployee);
        req.getSession().setAttribute("user", new UserEmployee());
        req.getSession().setAttribute("usersEmployee", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }

    @Override
    public void create(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> dao = new GenericDao<>(UserEmployee.class, session);
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));
        String cpf = req.getParameter("cpf");
        String userEmployeePosition = req.getParameter("userEmployeePosition");
        BigDecimal userEmployeeSalary = BigDecimal.valueOf(Double.parseDouble(req.getParameter("userEmployeeSalary")));
        UserEmployee userEmployee = new UserEmployee(0L, name, email, password, birthDate, cpf, userEmployeePosition, userEmployeeSalary);
        dao.save(userEmployee);
        req.getSession().setAttribute("user", new UserEmployee());
        req.getSession().setAttribute("usersEmployee", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }

    @Override
    public void delete(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> dao = new GenericDao<>(UserEmployee.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        UserEmployee userEmployee = dao.findById(id);
        dao.delete(userEmployee);
        req.getSession().setAttribute("user", new UserEmployee());
        req.getSession().setAttribute("usersEmployee", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }
}
