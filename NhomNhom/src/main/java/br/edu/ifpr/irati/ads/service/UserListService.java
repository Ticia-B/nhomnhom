package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.UserAdmin;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

public class UserListService {
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserEmployee> daoEmployee = new GenericDao<>(UserEmployee.class, session);
        Dao<UserAdmin> daoAdmin = new GenericDao<>(UserAdmin.class, session);
        Dao<UserClient> daoClient = new GenericDao<>(UserClient.class, session);
        req.getSession().setAttribute("usersAdmin", daoAdmin.findAll());
        req.getSession().setAttribute("usersEmployee", daoEmployee.findAll());
        req.getSession().setAttribute("usersClient", daoClient.findAll());
        resp.sendRedirect("adminUsers.jsp");
    }
}
