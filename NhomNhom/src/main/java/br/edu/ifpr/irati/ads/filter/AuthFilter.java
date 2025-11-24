package br.edu.ifpr.irati.ads.filter;

import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.model.User;
import br.edu.ifpr.irati.ads.util.JwtProperties;
import br.edu.ifpr.irati.ads.util.JwtUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.Properties;

@WebFilter(urlPatterns = {
        "/homeAdmin.jsp",
        "/homeEmployee.jsp",
        "/homeClient.jsp"
})
public class AuthFilter implements Filter {

    private String CONTEXT_PATH;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Iniciando o AuthFilter (com Autorização)");
        CONTEXT_PATH = filterConfig.getServletContext().getContextPath();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();

        JwtProperties.loadProperties(request.getServletContext());
        Properties props = JwtProperties.getProperties();

        Cookie tokenCookie = getToken(request);
        Claims claims = getValidClaims(tokenCookie, props);

        if (claims == null) {
            System.out.println("Filtro: Token inválido ou ausente. Redirecionando para home.");
            response.sendRedirect(CONTEXT_PATH + "/home.jsp");
            return;
        }

        HttpSession session = request.getSession(true);
        System.out.println(session.getAttribute("userLogged"));
        if (session.getAttribute("userLogged") == null) {
            System.out.println("Filtro: Token válido, mas Sessão vazia. Recarregando usuário do BD...");

            String userEmail = claims.getSubject();

            if (userEmail != null) {
                User userEncontrado = findByUserEmail(userEmail);
                if (userEncontrado != null) {
                    session.setAttribute("userLogged", userEncontrado);
                    System.out.println("Filtro: Usuário " + userEncontrado.getUserEmail() + " recolocado na sessão.");
                }
            }
        }

        String role = claims.get("role", String.class);
        if (role == null) {
            System.out.println("Filtro: Token válido, mas sem 'role'.");
            response.sendRedirect(CONTEXT_PATH + "/acessDenied.jsp");
            return;
        }
        System.out.println("Filtro: " + role + " tentando acessar " + uri);


        if (uri.startsWith(CONTEXT_PATH + "/homeAdmin.jsp")) {
            if (role.equals("ADMIN")) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                System.out.println("ACESSO NEGADO: " + role + " não pode acessar /admin/");
                response.sendRedirect(CONTEXT_PATH + "/acessDenied.jsp");
            }
        } else if (uri.startsWith(CONTEXT_PATH + "/homeEmployee.jsp")) {
            if (role.equals("ADMIN") || role.equals("EMPLOYEE")) {
                filterChain.doFilter(servletRequest, servletResponse); // Autorizado!
            } else {
                System.out.println("ACESSO NEGADO: " + role + " não pode acessar /employee/");
                response.sendRedirect(CONTEXT_PATH + "/acessDenied.jsp");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }


    private Claims getValidClaims(Cookie token, Properties props) {
        if (token == null) {
            return null;
        }

        String jwtToken = token.getValue();
        String jwtPasswd = props.getProperty("jwt_passwd");

        try {
            return JwtUtils.validateToken(jwtToken, jwtPasswd);
        } catch (Exception e) {
            System.out.println("Filtro: Erro ao validar token: " + e.getMessage());
            return null;
        }
    }

    private Cookie getToken(HttpServletRequest servletRequest) {
        Cookie[] cookies = servletRequest.getCookies();
        Cookie token = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    token = cookie;
                    break;
                }
            }
        }
        return token;
    }

    @Override
    public void destroy() {
        System.out.println("Destruindo o AuthFilter");
    }

    private User findByUserEmail(String email) {
        Session session = null;
        User user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM user WHERE userEmail = :user_email";

            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("user_email", email);
            user = query.uniqueResult();
            System.out.println(user);
        } catch (Exception e) {
            System.out.println("Erro ao buscar usuário no filtro: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return user;
    }
}