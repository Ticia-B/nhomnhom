package br.edu.ifpr.irati.ads.servlet;

import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.service.*;
import br.edu.ifpr.irati.ads.util.UrlParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

@WebServlet(name = "orderstatusservlet", urlPatterns = {"/orderstatus/approve",
        "/orderstatus/cancel",
        "/orderstatus/nextstage"})
public class OrderStatusUpdateServlet extends HttpServlet {

    private Session session;

    @Override
    public void init() throws ServletException {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            UrlParser urlParser = new UrlParser(req.getServletPath());
            OrderStatusUpdateService orderStatusUpdateService = new OrderStatusUpdateService();
            switch (urlParser.getMethod()) {
                case "approve":
                    orderStatusUpdateService.approve(req, resp, session);
                    break;
                case "cancel":
                    orderStatusUpdateService.cancel(req, resp, session);
                    break;
                case "nextstage":
                    orderStatusUpdateService.nextStage(req, resp, session);
                    break;
                default:

                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e.getMessage());
        }
    }

}
