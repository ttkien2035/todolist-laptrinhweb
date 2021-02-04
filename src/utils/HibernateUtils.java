package utils;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import model.Tag;
import model.Todo;
import model.User;

public class HibernateUtils {

	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();
				
				Properties settings = new Properties();
				settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://sql7.freemysqlhosting.net:3306/sql7388377?useSSL=false&allowPublicKeyRetrieval=true");
				settings.put(Environment.USER, "sql7388377");
				settings.put(Environment.PASS, "8cL6IvHugk");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
				
				settings.put(Environment.SHOW_SQL, "true");
				
				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
				
				settings.put(Environment.HBM2DDL_AUTO, "update");
				
				configuration.setProperties(settings);
				configuration.addAnnotatedClass(User.class);
				configuration.addAnnotatedClass(Todo.class);
				configuration.addAnnotatedClass(Tag.class);
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionFactory = configuration.buildSessionFactory(serviceRegistry);
				
				return sessionFactory;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return sessionFactory;
	}
	
}
