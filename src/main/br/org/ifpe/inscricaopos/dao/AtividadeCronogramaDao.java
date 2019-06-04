package main.br.org.ifpe.inscricaopos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import main.br.org.ifpe.inscricaopos.domain.AtividadeCronograma;
import main.br.org.ifpe.inscricaopos.util.HibernateDao;

@Repository
public class AtividadeCronogramaDao extends HibernateDao {

    public Class<AtividadeCronograma> getClassEntidade() {
	return AtividadeCronograma.class;
    }

    public List<AtividadeCronograma> listar() {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = manager.createQuery("FROM AtividadeCronograma ");

	List<AtividadeCronograma> lista = query.getResultList();
	manager.close();
	factory.close();

	return lista;
    }
}
