package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.UserAdmin;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

public class UserAdminService implements Service {
    @Override
    public void findById(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserAdmin> dao = new GenericDao<>(UserAdmin.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        req.getSession().setAttribute("user", dao.findById(id));
        req.getSession().setAttribute("usersAdmin", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserAdmin> dao = new GenericDao<>(UserAdmin.class, session);
        req.getSession().setAttribute("user", new UserAdmin());
        req.getSession().setAttribute("usersAdmin", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void update(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserAdmin> dao = new GenericDao<>(UserAdmin.class, session);
        Long id = Long.parseLong(req.getParameter("adminEditId"));
        String name = req.getParameter("adminEditName");
        String email = req.getParameter("adminEditEmail");
        String password = req.getParameter("adminEditPassword");
        LocalDate birthDate = LocalDate.parse(req.getParameter("adminEditBirthDate"));
        String cpf = req.getParameter("adminEditCpf");
        UserAdmin userAdmin = dao.findById(id);
        userAdmin.setUserName(name);
        userAdmin.setUserEmail(email);
        userAdmin.setUserCpf(cpf);
        userAdmin.setUserBirthDate(birthDate);
        userAdmin.setUserPassword(password);
        dao.update(userAdmin);
        req.getSession().setAttribute("user", new UserAdmin());
        req.getSession().setAttribute("usersAdmin", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }

    @Override
    public void create(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserAdmin> dao = new GenericDao<>(UserAdmin.class, session);
        String name = req.getParameter("adminName");
        String email = req.getParameter("adminEmail");
        String password = req.getParameter("adminPassword");
        LocalDate birthDate = LocalDate.parse(req.getParameter("adminBirthDate"));
        String cpf = req.getParameter("adminCpf");
        UserAdmin userAdmin = new UserAdmin(0L, name, email, password, birthDate, cpf);
        dao.save(userAdmin);
        req.getSession().setAttribute("user", new UserAdmin());
        req.getSession().setAttribute("usersAdmin", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }

    @Override
    public void delete(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserAdmin> dao = new GenericDao<>(UserAdmin.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        UserAdmin userAdmin = dao.findById(id);
        dao.delete(userAdmin);
        req.getSession().setAttribute("user", new UserEmployee());
        req.getSession().setAttribute("usersAdmin", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }
}
