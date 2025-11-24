package br.edu.ifpr.irati.ads.servlet;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.model.User;
import br.edu.ifpr.irati.ads.model.UserAdmin;
import br.edu.ifpr.irati.ads.model.UserClient;
import br.edu.ifpr.irati.ads.model.UserEmployee;
import br.edu.ifpr.irati.ads.service.Service;
import br.edu.ifpr.irati.ads.service.UserAdminService;
import br.edu.ifpr.irati.ads.service.UserClientService;
import br.edu.ifpr.irati.ads.service.UserEmployeeService;
import br.edu.ifpr.irati.ads.util.JwtProperties;
import br.edu.ifpr.irati.ads.util.JwtUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "loginservlet", urlPatterns = "/loginservlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_email = req.getParameter("userLogin");
        String password = req.getParameter("passwordLogin");
        JwtProperties.loadProperties(req.getServletContext());
        Properties props = JwtProperties.getProperties();
        UserClientService userClientService = new UserClientService();
        UserEmployeeService userEmployeeService = new UserEmployeeService();
        UserAdminService userAdminService = new UserAdminService();
        Session session = null;
        User user = null;
        String role = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            user = session.createQuery(
                            "FROM user WHERE userEmail = :user_email AND userPassword = :user_password",
                            User.class
                    )
                    .setParameter("user_email", user_email)
                    .setParameter("user_password", password)
                    .uniqueResult();
            if (user != null) {
                if (user instanceof UserClient) {
                    role = "CLIENT";
                } else if (user instanceof UserEmployee) {
                    role = "EMPLOYEE";
                } else if (user instanceof UserAdmin) {
                    role = "ADMIN";
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        if (user != null) {
            String chaveAcesso =
                    JwtUtils.generateToken(user.getUserEmail(),
                            role,
                            Integer.parseInt(props.getProperty("jwt_default_expiration")),
                            props.getProperty("jwt_passwd"));
            Cookie token = new Cookie("token", chaveAcesso);
            token.setMaxAge(Integer.parseInt(props.getProperty("jwt_default_expiration")) / 1000);
            token.setPath("/");
            resp.addCookie(token);
            System.out.println(user);
            req.getSession().setAttribute("userLogged", user);
            if (role == "CLIENT") {
                resp.sendRedirect("homeClient.jsp");
            } else if (role == "EMPLOYEE") {
                resp.sendRedirect("homeEmployee.jsp");
            } else if (role == "ADMIN") {
                resp.sendRedirect("homeAdmin.jsp");
            }
        } else {
            resp.sendRedirect("home.jsp");
        }

    }
}

