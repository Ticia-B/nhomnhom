package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.DaoSearch;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.Edible;
import br.edu.ifpr.irati.ads.model.UserAdmin;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import br.edu.ifpr.irati.ads.util.JwtProperties;
import br.edu.ifpr.irati.ads.util.JwtUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

public class SearchBarService {

    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        DaoSearch daoSearch = new DaoSearch(session);
        String search = req.getParameter("search");
        String redirectUrl = "home.jsp";
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
                    redirectUrl = "homeEmployee.jsp";
                    break;
                case "ADMIN":
                    redirectUrl = "homeAdmin.jsp";
                    break;
                default:
                    redirectUrl = "homeClient.jsp";
                    break;
            }
        }

        req.getSession().setAttribute("searchEdibles", daoSearch.findByName(search));
        resp.sendRedirect(redirectUrl);

    }

}
