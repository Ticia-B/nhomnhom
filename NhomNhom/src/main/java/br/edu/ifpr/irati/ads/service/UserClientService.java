package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.*;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.util.JwtProperties;
import br.edu.ifpr.irati.ads.util.JwtUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserClientService implements Service {
    @Override
    public void findById(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserClient> dao = new GenericDao<>(UserClient.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        req.getSession().setAttribute("user", dao.findById(id));
        req.getSession().setAttribute("usersClient", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserClient> dao = new GenericDao<>(UserClient.class, session);
        req.getSession().setAttribute("user", new UserClient());
        req.getSession().setAttribute("usersClient", dao.findAll());
        resp.sendRedirect("../homeAdmin.jsp");
    }

    @Override
    public void update(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserClient> dao = new GenericDao<>(UserClient.class, session);
        Long id = Long.parseLong(req.getParameter("clientId"));
        String name = req.getParameter("clientName");
        String email = req.getParameter("clientEmail");
        String password = req.getParameter("clientPassword");
        LocalDate birthDate = LocalDate.parse(req.getParameter("clientBirthDate"));
        String cpf = req.getParameter("clientCpf");
        UserClient userClient = dao.findById(id);
        userClient.setUserCpf(cpf);
        userClient.setUserName(name);
        userClient.setUserBirthDate(birthDate);
        userClient.setUserEmail(email);
        userClient.setUserPassword(password);
        dao.update(userClient);
        req.getSession().setAttribute("user", new UserClient());
        req.getSession().setAttribute("usersClient", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }

    @Override
    public void create(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserClient> dao = new GenericDao<>(UserClient.class, session);
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));
        String cpf = req.getParameter("cpf");
        List<Order> orders = new ArrayList<>();
        UserClient userClient = new UserClient(0L, name, email, password, birthDate, cpf, orders);
        dao.save(userClient);
        req.getSession().setAttribute("user", new UserClient());
        req.getSession().setAttribute("usersClient", dao.findAll());
        String redirectUrl = "../homeClient.jsp";
        String role = "";

        try {

            JwtProperties.loadProperties(req.getServletContext());
            String jwtPasswd = JwtProperties.getProperties().getProperty("jwt_passwd");

            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("token".equals(cookie.getName())) {
                        io.jsonwebtoken.Claims claims = JwtUtils.validateToken(cookie.getValue(), jwtPasswd);

                        role = claims.get("role", String.class);
                        break;
                    }
                }
            }
        } catch (Exception e) {

            System.out.println("Token inválido ou erro na leitura: " + e.getMessage());
        }

        if (role != null) {
            switch (role) {
                case "EMPLOYEE":
                    redirectUrl = "../homeEmployee.jsp";
                    break;
                case "ADMIN":
                    redirectUrl = "../adminUsers.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }
        resp.sendRedirect(redirectUrl);
    }

    @Override
    public void delete(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<UserClient> dao = new GenericDao<>(UserClient.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        UserClient userClient = dao.findById(id);
        dao.delete(userClient);
        req.getSession().setAttribute("user", new UserClient());
        req.getSession().setAttribute("usersClient", dao.findAll());
        resp.sendRedirect("../adminUsers.jsp");
    }
}
