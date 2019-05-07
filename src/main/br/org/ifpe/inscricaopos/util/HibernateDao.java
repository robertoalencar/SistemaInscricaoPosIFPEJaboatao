package main.br.org.ifpe.inscricaopos.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class HibernateDao {

    protected static final String PERSISTENCE_UNIT = "inscricaopos";

    public Object save(Object obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.persist(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
	return obj;
    }

    public Object update(Object obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.merge(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
	return obj;
    }

    public void remove(Long[] ids) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	for (int i = 0; i < ids.length; i++) {
	    manager.remove(manager.find(getClassEntidade(), ids[i]));
	}

	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public abstract Class<?> getClassEntidade();

}
