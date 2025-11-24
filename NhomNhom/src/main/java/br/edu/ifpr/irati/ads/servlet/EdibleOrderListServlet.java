package br.edu.ifpr.irati.ads.servlet;

import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.service.EdibleOrderListService;
import br.edu.ifpr.irati.ads.service.UserListService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

@WebServlet(name = "edibleorderlistservlet", urlPatterns = "/edibleorderlist")
public class EdibleOrderListServlet extends HttpServlet {

    private Session session;

    @Override
    public void init() throws ServletException {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            EdibleOrderListService edibleOrderListService = new EdibleOrderListService();
            edibleOrderListService.findAll(req, resp, session);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
