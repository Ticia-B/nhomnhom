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
        admin.setUserCpf("98765432121");
        admin.setUserBirthDate(LocalDate.now());
        admin.setUserEmail("nedry@su");
        admin.setUserPassword("MrGoodBytes");
        admin.setUserName("Dennis Nedry");
        adminho.save(admin);

        Edible edible = new Edible();
        edible.setEdibleName("Xuxu");
        edible.setEdibleDescription("é um xuxu");
        edible.setEdiblePhoto("https://www.pensarcursos.com.br/blog/wp-content/uploads/2024/06/Sechium_edule_flower_and_fruit_2.png");
        edible.setEdiblePrice(new BigDecimal(12.75));
        edible.setProductCategory(ProductCategory.SAVORY);
        comida.save(edible);

        Edible edible1 = new Edible();
        edible1.setEdibleName("Batata Frita");
        edible1.setEdibleDescription("Batatas crocantes por fora e macias por dentro.");
        edible1.setEdiblePhoto("https://cdn.casaeculinaria.com/wp-content/uploads/2023/03/13101208/Batata-frita.jpg");
        edible1.setEdiblePrice(new BigDecimal(10.25));
        edible1.setProductCategory(ProductCategory.SNACK);
        comida.save(edible1);

        Edible edible2 = new Edible();
        edible2.setEdibleName("X-Salada");
        edible2.setEdibleDescription("Para você se sentir saudável.");
        edible2.setEdiblePhoto("https://www.sabornamesa.com.br/media/k2/items/cache/b4cd45b9dcdf28778c9b938159445747_XL.jpg");
        edible2.setEdiblePrice(new BigDecimal(19.50));
        edible2.setProductCategory(ProductCategory.SNACK);
        comida.save(edible2);

        Edible edible3 = new Edible();
        edible3.setEdibleName("Petit Gateau");
        edible3.setEdibleDescription("Delicioso bolo semi-cru de chocolate acompanhado com sorvete.");
        edible3.setEdiblePhoto("https://s2-receitas.glbimg.com/4ILw7u5lB7ZR_55pssPFeHFfoGc=/0x0:720x482/810x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/11/20/21_00_40_778_Petit_Gateau.jpg");
        edible3.setEdiblePrice(new BigDecimal(35.00));
        edible3.setProductCategory(ProductCategory.DESSERT);
        comida.save(edible3);

        Edible edible4 = new Edible();
        edible4.setEdibleName("Pudim de Leite");
        edible4.setEdibleDescription("Pudim de leite com uma deliciosa calda de caramelo.");
        edible4.setEdiblePhoto("https://www.receitas-sem-fronteiras.com/media/pudim-2_crop.jpg/rh/pudim-de-leite-moca.jpg");
        edible4.setEdiblePrice(new BigDecimal(15.50));
        edible4.setProductCategory(ProductCategory.DESSERT);
        comida.save(edible4);

        Edible edible5 = new Edible();
        edible5.setEdibleName("Malibu Sunrise");
        edible5.setEdibleDescription("Uma paisagem paradisíaca de laranja, abacaxi e cereja.");
        edible5.setEdiblePhoto("https://www.organizedisland.com/wp-content/uploads/2024/09/Best-Malibu-Sunset-cocktail--500x500.jpg");
        edible5.setEdiblePrice(new BigDecimal(15.00));
        edible5.setProductCategory(ProductCategory.DRINK);
        comida.save(edible5);

        Edible edible6 = new Edible();
        edible6.setEdibleName("Suco de Laranja Natural");
        edible6.setEdibleDescription("Suco natural com laranjas colhidas no dia.");
        edible6.setEdiblePhoto("https://s2.glbimg.com/E1WXXtiXeTi1DyT5Y1O3uf2DICs=/e.glbimg.com/og/ed/f/original/2019/01/15/31617293018_896bf29d55_k.jpg");
        edible6.setEdiblePrice(new BigDecimal(15.50));
        edible6.setProductCategory(ProductCategory.DRINK);
        comida.save(edible6);

        Edible edible7 = new Edible();
        edible7.setEdibleName("Salmão Grelhado");
        edible7.setEdibleDescription("Apetitoso salmão grelhado com especiarias, acompanhado de uma redução de vinho tinto e aspargos.");
        edible7.setEdiblePhoto("https://canaldareceita.com.br/wp-content/uploads/2024/09/SALMAO-GRELHADO.jpg");
        edible7.setEdiblePrice(new BigDecimal(34.25));
        edible7.setProductCategory(ProductCategory.SAVORY);
        comida.save(edible7);

        Edible edible8 = new Edible();
        edible8.setEdibleName("Cachorro Quente");
        edible8.setEdibleDescription("Cachorro quente com vinas artesanais.");
        edible8.setEdiblePhoto("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBqkzPgNsZlAb0Gn8PxG3A-3PyOULFB2UApQ&s");
        edible8.setEdiblePrice(new BigDecimal(15.00));
        edible8.setProductCategory(ProductCategory.SNACK);
        comida.save(edible8);

        Edible edible9 = new Edible();
        edible9.setEdibleName("Costela de Cordeiro");
        edible9.setEdibleDescription("Costela de cordeiro com mel e redução de vinho tinto, acompanhado de vegetais assados.");
        edible9.setEdiblePhoto("https://minervafoods.com/wp-content/uploads/2023/07/tinywow_07-Costela-de-cordeiro-com-mel-e-vinho-tinto-HOR_29794278-scaled.jpg");
        edible9.setEdiblePrice(new BigDecimal(70.00));
        edible9.setProductCategory(ProductCategory.SAVORY);
        comida.save(edible9);

        Edible edible10 = new Edible();
        edible10.setEdibleName("Brigadeiro");
        edible10.setEdibleDescription("Leite condensado, manteiga e achocolatado.");
        edible10.setEdiblePhoto("https://xamegobom.com.br/wp-content/uploads/2017/04/brigadeiro-de-leite-condensado.jpg");
        edible10.setEdiblePrice(new BigDecimal(5.00));
        edible10.setProductCategory(ProductCategory.DESSERT);
        comida.save(edible10);

        UserClient cliente1 = new UserClient();
        cliente1.setUserCpf("12345678912");
        cliente1.setUserBirthDate(LocalDate.now());
        cliente1.setUserEmail("c@c");
        cliente1.setUserPassword("123456");
        cliente1.setUserName("cliente1");
        cliente.save(cliente1);

        Order order = new Order();
        order.addEdible(comida.findById(1));
        order.addEdible(comida.findById(1));
        order.addEdible(comida.findById(1));
        order.setUser(cliente.findById(2));
        order.setTotal(new BigDecimal("340"));
        pedido.save(order);

        UserEmployee employee = new UserEmployee();
        employee.setUserCpf("21987654321");
        employee.setUserBirthDate(LocalDate.now());
        employee.setUserEmployeeSalary(new BigDecimal(1000.00));
        employee.setUserName("Funcionario1");
        employee.setUserEmployeePosition("CAIXA");
        employee.setUserEmail("f@f");
        employee.setUserPassword("123456");
        escravo.save(employee);
        session.close();
    }
}
