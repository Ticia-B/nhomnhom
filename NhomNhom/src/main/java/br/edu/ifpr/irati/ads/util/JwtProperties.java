package br.edu.ifpr.irati.ads.util;

import jakarta.servlet.ServletContext;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

public class JwtProperties {
    private static final Logger LOG = Logger.getLogger(JwtProperties.class.getName());
    private static Properties properties = null;

    public static void loadProperties(ServletContext sc) {
        Properties props = new Properties();
        try{
            FileInputStream file = new FileInputStream(sc.getResource("/WEB-INF/jwt.properties").getPath());
            props.load(file);
            properties = props;
        }catch (IOException ioe){
            LOG.warning("Failed to load jwt.properties: " + ioe.getMessage());
            LOG.warning("Using default (hardcode) properties.");
            props.setProperty("jwt_passwd","my_jwt_passwd");
            props.setProperty("jwt_default_expiration","86400000");
            properties = props;
        }
    }

    public static Properties getProperties(){
        return properties;
    }
}
