package br.edu.ifpr.irati.ads.service;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.model.Edible;
import br.edu.ifpr.irati.ads.model.Order;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import br.edu.ifpr.irati.ads.model.enums.OrderStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderService implements Service {
    @Override
    public void findById(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> dao = new GenericDao<>(Order.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        req.getSession().setAttribute("order", dao.findById(id));
        List<Order> orders = dao.findAll();
        Collections.reverse(orders);
        req.getSession().setAttribute("orders", orders);
        resp.sendRedirect("../home.jsp");
    }

    @Override
    public void findAll(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> dao = new GenericDao<>(Order.class, session);
        req.getSession().setAttribute("order", new Order());
        List<Order> orders = dao.findAll();
        Collections.reverse(orders);
        req.getSession().setAttribute("orders", orders);
        resp.sendRedirect("../home.jsp");
    }

    @Override
    public void update(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> dao = new GenericDao<>(Order.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        Order order = dao.findById(id);
        OrderStatus orderStatus = OrderStatus.valueOf(req.getParameter("orderStatus"));
        order.setOrderStatus(orderStatus);
        dao.update(order);
        req.getSession().setAttribute("order", new Order());
        List<Order> orders = dao.findAll();
        Collections.reverse(orders);
        req.getSession().setAttribute("orders", orders);
        resp.sendRedirect("../home.jsp");
    }

    @Override
    public void create(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> dao = new GenericDao<>(Order.class, session);


        UserClient loggedUser = (UserClient) req.getSession().getAttribute("userLogged");
        if (loggedUser == null) {
            resp.sendRedirect("../home.jsp");
            return;
        }
        Dao<UserClient> userDao = new GenericDao<>(UserClient.class, session);

        Order cart = (Order) req.getSession().getAttribute("cart");

        if (cart == null || cart.getEdibleOrder() == null || cart.getEdibleOrder().isEmpty()) {

            resp.sendRedirect("../homeClient.jsp?error=emptyCart");
            return;
        }

        List<Edible> edibles = cart.getEdibleOrder();

        BigDecimal totalPrice = cart.getTotal();

        OrderStatus orderStatus = OrderStatus.PENDING;

        Order order = new Order(0L, orderStatus, edibles, loggedUser, totalPrice);

        dao.save(order);

        req.getSession().removeAttribute("cart");
        req.getSession().removeAttribute("edibleOder");

        List<Order> orders = dao.findAll();
        Collections.reverse(orders);
        req.getSession().setAttribute("orders", orders);
        resp.sendRedirect("../home.jsp?msg=success");
    }


    @Override
    public void delete(HttpServletRequest req, HttpServletResponse resp, Session session) throws ServletException, IOException {
        Dao<Order> dao = new GenericDao<>(Order.class, session);
        Long id = Long.parseLong(req.getParameter("id"));
        Order order = dao.findById(id);
        dao.delete(order);
        req.getSession().setAttribute("order", new Order());
        List<Order> orders = dao.findAll();
        Collections.reverse(orders);
        req.getSession().setAttribute("orders", orders);
        resp.sendRedirect("../home.jsp");
    }
}
