package com.jspider.singltonsessionfactory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {

		if (sessionFactory == null) {
			Configuration configuration = new Configuration();
			configuration.configure("hibernate.cg.xml");
			sessionFactory = configuration.buildSessionFactory();
		}

		return sessionFactory;
	}

	public void closeSessionFactory() {

		if (sessionFactory.isOpen()) {
			sessionFactory.close();
		}
	}
}
