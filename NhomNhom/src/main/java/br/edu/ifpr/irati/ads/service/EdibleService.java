package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.Edible;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import br.edu.ifpr.irati.ads.model.enums.ProductCategory;
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

public class EdibleService implements Service {
    @Override
    public void findById(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Edible> dao = new GenericDao<>(Edible.class, session);
        Long id = Long.parseLong(req.getParameter("edibleId"));
        req.getSession().setAttribute("edible", dao.findById(id));
        req.getSession().setAttribute("edibles", dao.findAll());

        String redirectUrl = "../home.jsp";
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
                    redirectUrl = "../homeAdmin.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }
        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());
        resp.sendRedirect(redirectUrl);
    }

    @Override
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Edible> dao = new GenericDao<>(Edible.class, session);
        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());
        String redirectUrl = "../home.jsp";
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
                    redirectUrl = "../homeAdmin.jsp";
                    break;
                case "CLIENT":
                    redirectUrl = "../homeClient.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }
        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());
        resp.sendRedirect(redirectUrl);
    }

    @Override
    public void update(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Edible> dao = new GenericDao<>(Edible.class, session);
        Long id = Long.parseLong(req.getParameter("edibleId"));
        String edibleName = req.getParameter("edibleName");
        String edibleDescription = req.getParameter("edibleDescription");
        String ediblePhoto = req.getParameter("ediblePhoto");
        ProductCategory productCategory = ProductCategory.valueOf(req.getParameter("productCategory"));
        BigDecimal price = BigDecimal.valueOf(Double.parseDouble(req.getParameter("ediblePrice")));
        Edible edible = dao.findById(id);
        edible.setEdibleName(edibleName);
        edible.setEdiblePhoto(ediblePhoto);
        edible.setEdibleDescription(edibleDescription);
        edible.setProductCategory(productCategory);
        edible.setEdiblePrice(price);
        dao.update(edible);
        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());
        String redirectUrl = "../home.jsp";
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
                    redirectUrl = "../homeAdmin.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }
        resp.sendRedirect(redirectUrl);
    }

    @Override
    public void create(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Edible> dao = new GenericDao<>(Edible.class, session);
        String edibleName = req.getParameter("edibleName");
        String edibleDescription = req.getParameter("edibleDescription");
        String ediblePhoto = req.getParameter("ediblePhoto");
        ProductCategory productCategory = ProductCategory.valueOf(req.getParameter("productCategory"));
        BigDecimal price = BigDecimal.valueOf(Double.parseDouble(req.getParameter("ediblePrice")));
        Edible edible = new Edible(0L, edibleName, edibleDescription, productCategory, ediblePhoto, price);
        dao.save(edible);

        String redirectUrl = "../home.jsp";
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
                    redirectUrl = "../homeAdmin.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }

        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());
        resp.sendRedirect(redirectUrl);
    }

    @Override
    public void delete(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Edible> dao = new GenericDao<>(Edible.class, session);
        Long id = Long.parseLong(req.getParameter("edibleId"));
        Edible edible = dao.findById(id);
        dao.delete(edible);
        req.getSession().setAttribute("edible", new Edible());
        req.getSession().setAttribute("edibles", dao.findAll());

        String redirectUrl = "../home.jsp";
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
                    redirectUrl = "../homeAdmin.jsp";
                    break;
                default:
                    redirectUrl = "../home.jsp";
                    break;
            }
        }
        resp.sendRedirect(redirectUrl);
    }
}
