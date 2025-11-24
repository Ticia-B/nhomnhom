package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.Order;
import br.edu.ifpr.irati.ads.model.UserAdmin;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import br.edu.ifpr.irati.ads.model.enums.OrderStatus;
import br.edu.ifpr.irati.ads.util.JwtProperties;
import br.edu.ifpr.irati.ads.util.JwtUtils;
import br.edu.ifpr.irati.ads.util.UrlParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderStatusUpdateService {

    public void approve(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> daoOrder = new GenericDao<>(Order.class, session);
        Order order = daoOrder.findById(Integer.parseInt(req.getParameter("id")));
        order.setOrderStatus(OrderStatus.IN_PREPARATION);
        daoOrder.update(order);
        List<Order> orders = daoOrder.findAll();
        List<Order> ordersPending = new ArrayList<>();
        List<Order> ordersInPreparation = new ArrayList<>();
        List<Order> ordersReady = new ArrayList<>();
        List<Order> ordersHistory = new ArrayList<>();
        for(Order o : orders){
            if(o.getOrderStatus() == OrderStatus.PENDING){
                ordersPending.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.IN_PREPARATION){
                ordersInPreparation.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.READY){
                ordersReady.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.COMPLETED || o.getOrderStatus() == OrderStatus.CANCELLED){
                ordersHistory.add(o);
            }


        }

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

        Collections.reverse(orders);
        Collections.reverse(ordersPending);
        Collections.reverse(ordersInPreparation);
        Collections.reverse(ordersReady);
        Collections.reverse(ordersHistory);

        req.getSession().setAttribute("orders", orders);
        req.getSession().setAttribute("ordersPending", ordersPending);
        req.getSession().setAttribute("ordersInPreparation", ordersInPreparation);
        req.getSession().setAttribute("ordersReady", ordersReady);
        req.getSession().setAttribute("ordersHistory", ordersHistory);
        resp.sendRedirect(redirectUrl);

    }

    public void cancel(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> daoOrder = new GenericDao<>(Order.class, session);
        Order order = daoOrder.findById(Integer.parseInt(req.getParameter("id")));
        order.setOrderStatus(OrderStatus.CANCELLED);
        daoOrder.update(order);
        List<Order> orders = daoOrder.findAll();
        List<Order> ordersPending = new ArrayList<>();
        List<Order> ordersInPreparation = new ArrayList<>();
        List<Order> ordersReady = new ArrayList<>();
        List<Order> ordersHistory = new ArrayList<>();
        for(Order o : orders){
            if(o.getOrderStatus() == OrderStatus.PENDING){
                ordersPending.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.IN_PREPARATION){
                ordersInPreparation.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.READY){
                ordersReady.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.COMPLETED || o.getOrderStatus() == OrderStatus.CANCELLED){
                ordersHistory.add(o);
            }


        }

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
                    redirectUrl = "../employeeOrders.jsp";
                    break;
                case "ADMIN":
                    redirectUrl = "../employeeOrders.jsp";
                    break;
                default:
                    redirectUrl = "../homeClient.jsp";
                    break;
            }
        }
        Collections.reverse(orders);
        Collections.reverse(ordersPending);
        Collections.reverse(ordersInPreparation);
        Collections.reverse(ordersReady);
        Collections.reverse(ordersHistory);

        req.getSession().setAttribute("orders", orders);
        req.getSession().setAttribute("ordersPending", ordersPending);
        req.getSession().setAttribute("ordersInPreparation", ordersInPreparation);
        req.getSession().setAttribute("ordersReady", ordersReady);
        req.getSession().setAttribute("ordersHistory", ordersHistory);
        resp.sendRedirect(redirectUrl);
    }

    public void nextStage(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> daoOrder = new GenericDao<>(Order.class, session);
        Order order = daoOrder.findById(Integer.parseInt(req.getParameter("id")));
        switch (order.getOrderStatus()) {
            case PENDING:
                order.setOrderStatus(OrderStatus.IN_PREPARATION);
                break;
            case IN_PREPARATION:
                order.setOrderStatus(OrderStatus.READY);
                break;
            case READY:
                order.setOrderStatus(OrderStatus.COMPLETED);
                break;
            default:
                order.setOrderStatus(OrderStatus.CANCELLED);
                break;
        }
        daoOrder.update(order);
        List<Order> orders = daoOrder.findAll();
        List<Order> ordersPending = new ArrayList<>();
        List<Order> ordersInPreparation = new ArrayList<>();
        List<Order> ordersReady = new ArrayList<>();
        List<Order> ordersHistory = new ArrayList<>();
        for(Order o : orders){
            if(o.getOrderStatus() == OrderStatus.PENDING){
                ordersPending.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.IN_PREPARATION){
                ordersInPreparation.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.READY){
                ordersReady.add(o);
            }
            if(o.getOrderStatus() == OrderStatus.COMPLETED || o.getOrderStatus() == OrderStatus.CANCELLED){
                ordersHistory.add(o);
            }


        }

        Collections.reverse(orders);
        Collections.reverse(ordersPending);
        Collections.reverse(ordersInPreparation);
        Collections.reverse(ordersReady);
        Collections.reverse(ordersHistory);

        req.getSession().setAttribute("orders", orders);
        req.getSession().setAttribute("ordersPending", ordersPending);
        req.getSession().setAttribute("ordersInPreparation", ordersInPreparation);
        req.getSession().setAttribute("ordersReady", ordersReady);
        req.getSession().setAttribute("ordersHistory", ordersHistory);
        resp.sendRedirect("../employeeOrders.jsp");
    }

}
