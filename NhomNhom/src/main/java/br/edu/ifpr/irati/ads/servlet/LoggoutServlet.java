package br.edu.ifpr.irati.ads.servlet; // Ajuste para o seu pacote de servlets

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// O link no seu HTML deve ser <a href="logout">Sair</a>
@WebServlet(name = "loggoutservlet", urlPatterns = "/loggout")
public class LoggoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie = new Cookie("token", "");
        cookie.setPath("/");


        cookie.setMaxAge(0);

        resp.addCookie(cookie);

        //KILL 'EM ALL

        req.getSession().removeAttribute("userLogged");
        req.getSession().removeAttribute("orders");
        req.getSession().removeAttribute("usersAdmin");
        req.getSession().removeAttribute("usersClient");
        req.getSession().removeAttribute("usersEmployee");
        req.getSession().removeAttribute("cart");
        req.getSession().removeAttribute("edibleOder");
        req.getSession().removeAttribute("orders");
        req.getSession().removeAttribute("ordersPending");
        req.getSession().removeAttribute("ordersInPreparation");
        req.getSession().removeAttribute("ordersReady");
        req.getSession().removeAttribute("ordersHistory");
        req.getSession().removeAttribute("searchEdibles");


        resp.sendRedirect(req.getContextPath() + "/home.jsp");


    }
}