package br.edu.ifpr.irati.ads.dao;

import br.edu.ifpr.irati.ads.model.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class HibernateUtil {

    private static SessionFactory sessionFactory = null;

    public static SessionFactory getSessionFactory() {

        Properties p = DBProperties.getProperties();
        String host = p.get("db_host").toString();
        String port = p.get("db_port").toString();
        String schema = p.get("db_schema").toString();
        String user = p.get("db_user").toString();
        String password = p.get("db_password").toString();

        if (sessionFactory == null){

            Map<String, Object> settings = new HashMap<>();
            settings.put("connection.driver_class","com.mysql.cj.jdbc.Driver");
            settings.put("dialect","org.hibernate.dialect.MySQLDialect");
            settings.put("hibernate.connection.url","jdbc:mysql://"+host+":"+port+"/"+schema+"?createDatabaseIfNotExist=true&useUnicode=yes&characterEncoding=UTF-8");
            settings.put("hibernate.connection.username",user);
            settings.put("hibernate.connection.password",password);
//            settings.put("hibernate.connection.url","jdbc:mysql://localhost:3306/db_nhomnhom?createDatabaseIfNotExist=true&useUnicode=yes&characterEncoding=UTF-8");
//            settings.put("hibernate.connection.username", "root");
//            settings.put("hibernate.connection.password","mysql");
            settings.put("hibernate.hbm2ddl.auto","update");
            settings.put("hibernate.current_session_context_class","thread");
            settings.put("hibernate.show_sql","true");
            settings.put("hibernate.format_sql","true");

            ServiceRegistry serviceRegistry =
                    new StandardServiceRegistryBuilder().applySettings(settings).build();

            MetadataSources metadataSources = new MetadataSources(serviceRegistry);
            metadataSources.addAnnotatedClass(User.class);
            metadataSources.addAnnotatedClass(UserAdmin.class);
            metadataSources.addAnnotatedClass(UserEmployee.class);
            metadataSources.addAnnotatedClass(UserClient.class);
            metadataSources.addAnnotatedClass(Edible.class);
            metadataSources.addAnnotatedClass(Order.class);
            Metadata metadata = metadataSources.buildMetadata();
            sessionFactory = metadata.getSessionFactoryBuilder().build();

        }
        return sessionFactory;


    }

}
