package br.edu.ifpr.irati.ads.servlet;

import br.edu.ifpr.irati.ads.dao.GenericDao; // Supondo que você tenha um DAO genérico
import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.model.Edible;
import br.edu.ifpr.irati.ads.model.Order;
import br.edu.ifpr.irati.ads.model.UserClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;

import java.io.IOException;

@WebServlet(name = "cartServlet", urlPatterns = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        String idStr = req.getParameter("id");

        if ("add".equals(action) && idStr != null) {
            try {
                Long edibleId = Long.parseLong(idStr);
                addToCart(req, edibleId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        } else if ("remove".equals(action) && idStr != null) {
            try {
                Long edibleId = Long.parseLong(idStr);
                removeFromCart(req, edibleId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect(req.getContextPath() + "/homeClient.jsp");
    }

    private void addToCart(HttpServletRequest req, Long edibleId) {
        Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
        HttpSession session = req.getSession();
        Order currentOrder = (Order) session.getAttribute("cart");
        if (currentOrder == null) {
            currentOrder = new Order();
            UserClient user = (UserClient) session.getAttribute("userLogged");

            currentOrder.setUser(user);


            session.setAttribute("cart", currentOrder);
        }

        GenericDao<Edible> edibleDAO = new GenericDao<>(Edible.class, sessionHibernate);
        Edible item = edibleDAO.findById(edibleId);
        if (item != null) {
            currentOrder.addEdible(item);
            req.getSession().setAttribute("edibleOder", currentOrder);
            System.out.println("Item adicionado: " + item.getEdibleName());
            System.out.println("Total atual: " + currentOrder.getTotal());
        }
    }

    private void removeFromCart(HttpServletRequest req, Long edibleId) {
        HttpSession session = req.getSession();
        Order currentOrder = (Order) session.getAttribute("cart");

        if (currentOrder != null) {
            currentOrder.removeEdible(edibleId);
            System.out.println("Item removido ID: " + edibleId);
            System.out.println("Total atual: " + currentOrder.getTotal());
        }
    }

}