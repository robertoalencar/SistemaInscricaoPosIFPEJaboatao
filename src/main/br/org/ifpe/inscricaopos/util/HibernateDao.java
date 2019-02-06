package main.br.org.ifpe.inscricaopos.util;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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

    public void remove(int[] ids) {

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

    public Object find(Class<?> entidade, int id) {

	Object obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(entidade, id);
	manager.close();
	factory.close();

	return obj;
    }

    public List<?> list(String classe, String criterioOrdenacao, String ordem) {

	criterioOrdenacao = (criterioOrdenacao == null) ? "id" : criterioOrdenacao;
	ordem = (ordem == null) ? "ASC" : ordem;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("FROM " + classe + " ORDER BY " + criterioOrdenacao + " " + ordem);
	List<?> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }

    public abstract Class<?> getClassEntidade();
}
