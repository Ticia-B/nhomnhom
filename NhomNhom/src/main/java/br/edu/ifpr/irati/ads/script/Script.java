package br.edu.ifpr.irati.ads.script;

import br.edu.ifpr.irati.ads.dao.Dao;
import br.edu.ifpr.irati.ads.dao.GenericDao;
import br.edu.ifpr.irati.ads.dao.HibernateUtil;
import br.edu.ifpr.irati.ads.model.*;
import br.edu.ifpr.irati.ads.model.enums.ProductCategory;
import org.hibernate.Session;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class Script {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Dao<UserClient> cliente = new GenericDao<>(UserClient.class, session);
        Dao<UserAdmin> adminho = new GenericDao<>(UserAdmin.class, session);
        Dao<UserEmployee> escravo = new GenericDao<>(UserEmployee.class, session);
        Dao<Order> pedido = new GenericDao<>(Order.class, session);
        Dao<Edible> comida = new GenericDao<>(Edible.class, session);

        UserAdmin admin = new UserAdmin();
        admin.setUserCpf("123123");
        admin.setUserBirthDate(LocalDate.now());
        admin.setUserEmail("nedry@su");
        admin.setUserPassword("MrGoodBytes");
        admin.setUserName("Denis Nedry");
        adminho.save(admin);

        Edible edible = new Edible();
        edible.setEdibleName("xuxu");
        edible.setEdibleDescription("é um xuxu");
        edible.setEdiblePrice(new BigDecimal(12.75));
        edible.setProductCategory(ProductCategory.SAVORY);
        comida.save(edible);

        UserClient cliente1 = new UserClient();
        cliente1.setUserCpf("123123");
        cliente1.setUserBirthDate(LocalDate.now());
        cliente1.setUserEmail("b@b");
        cliente1.setUserPassword("123456");
        cliente1.setUserName("fodinha");
        cliente.save(cliente1);

        Order order = new Order();
        order.addEdible(comida.findById(1));
        order.addEdible(comida.findById(1));
        order.addEdible(comida.findById(1));
        order.setUser(cliente.findById(2));
        order.setTotal(new BigDecimal("340"));
        pedido.save(order);

        UserEmployee employee = new UserEmployee();
        employee.setUserCpf("123123");
        employee.setUserBirthDate(LocalDate.now());
        employee.setUserEmployeeSalary(new BigDecimal(1000.00));
        employee.setUserName("escravo");
        employee.setUserEmployeePosition("CAIXA");
        employee.setUserEmail("a@a");
        employee.setUserPassword("123456");
        escravo.save(employee);
        session.close();
    }
}
