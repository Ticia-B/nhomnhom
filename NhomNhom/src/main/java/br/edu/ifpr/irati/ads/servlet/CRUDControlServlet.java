package br.edu.ifpr.irati.ads.servlet;

import jakarta.servlet.annotation.WebServlet;
import org.hibernate.Session;

@WebServlet(name = "crudcontrolservlet", urlPatterns = {
        //user url
        "/user/findbyid",
        "/user/findall",
        "/user/create",
        "/user/update",
        "/user/delete",

        //edible url
        "/edible/findbyid",
        "/edible/findall",
        "/edible/create",
        "/edible/update",
        "/edible/delete"
})
public class CRUDControlServlet {
    private Session session;

}
