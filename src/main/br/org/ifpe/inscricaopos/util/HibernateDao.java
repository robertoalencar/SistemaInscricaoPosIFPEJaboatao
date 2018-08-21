package main.br.org.ifpe.inscricaopos.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class HibernateDao {

    protected static final String PERSISTENCE_UNIT = "inscricaopos";

    public void save(Object obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.persist(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public void update(Object obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.merge(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public void remove(int id) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Object obj = manager.find(getClassEntidade(), id);

	manager.getTransaction().begin();
	manager.remove(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public Object find(int id) {

	Object obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(getClassEntidade(), id);
	manager.close();
	factory.close();

	return obj;
    }

    public abstract Class<?> getClassEntidade();
}
